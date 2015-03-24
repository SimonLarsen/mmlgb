package dk.hisimon.mmlgb;

import java.util.List;
import java.util.ArrayList;

public class Song {
	private String filename;
	private int waveDataCount;

	private WaveData[] waveData;
	private List<List<Integer>> channel;

	private static final int HEADER_SIZE = 8;
	private static final int MAX_WAVE_DATA = 8;
	private static final int MAX_ENV_DATA = 16;

	public enum CMD {
		T_C,
		T_Cs,
		T_D,
		T_Ds,
		T_E,
		T_F,
		T_Fs,
		T_G,
		T_Gs,
		T_A2,
		T_As,
		T_B,
		T_REST,
		T_WAIT,
		T_LENGTH,
		T_OCTAVE,
		T_OCT_UP,
		T_OCT_DOWN,
		T_VOL,
		T_ENV,
		T_WAVE,
		T_TEMPO,
		T_WAVEDUTY,
		T_PAN,
		T_SWEEP,
		T_LOOP,
		T_EOF
	};

	public Song() {
		waveData = new WaveData[MAX_WAVE_DATA];
		waveDataCount = 0;

		channel = new ArrayList<List<Integer>>();
		for(int i = 0; i < 4; ++i) {
			channel.add(new ArrayList<Integer>());
		}
	}

	public void addWaveData(int id, WaveData data) throws ParserException {
		if(id >= MAX_WAVE_DATA) {
			throw new ParserException(String.format("You can only define %d wave data blocks.", MAX_WAVE_DATA));
		}
		waveData[id] = data;
		waveDataCount = Math.max(waveDataCount, id+1);
	}

	public void addData(int chan, int value) {
		channel.get(chan).add(value);
	}

	public void addData(boolean[] active, int value) {
		for(int i = 0; i < 4; ++i) {
			if(active[i]) {
				channel.get(i).add(value);
			}
		}
	}

	public List<Integer> getData() {
		List<Integer> data = new ArrayList<Integer>();

		// Generate header
		int c1Start = HEADER_SIZE + waveDataCount * 16;
		int c2Start = c1Start + channel.get(0).size();
		int c3Start = c2Start + channel.get(1).size();
		int c4Start = c3Start + channel.get(2).size();

		data.add(c1Start & 0xFF);
		data.add(c1Start >> 8);
		data.add(c2Start & 0xFF);
		data.add(c2Start >> 8);
		data.add(c3Start & 0xFF);
		data.add(c3Start >> 8);
		data.add(c4Start & 0xFF);
		data.add(c4Start >> 8);

		// Generate wave data
		for(int i = 0; i < waveDataCount; ++i) {
			int[] samples = waveData[i].getData();
			if(samples != null) {
				for(int j = 0; j < 32; j += 2) {
					int value = (samples[j] << 4) | samples[j+1];
					data.add(value);
				}
			} else {
				for(int j = 0; j < 16; ++j) {
					data.add(0);
				}
			}
		}

		// Output channel data
		for(int i = 0; i < 4; ++i) {
			data.addAll(channel.get(i));
		}

		return data;
	}

	public void setFileName(String name) {
		this.filename = name;
	}

	public String emitC() {
		String id = filename.replaceAll("[^a-zA-Z0-9]", "_");
		String id_upper = id.toUpperCase();
		StringBuilder sb = new StringBuilder();

		sb.append(String.format("#ifndef %s\n", id_upper));
		sb.append(String.format("#define %s\n", id_upper));

		sb.append(String.format("\nconst UBYTE %s_data[] = {\n", id));

		for(Integer i : getData()) {
			sb.append("\t" + i + "U,\n");
		}
		sb.append("};\n\n");

		sb.append("#endif");

		return sb.toString();
	}

	public String emitASM() {
		String id = filename.replaceAll("[^a-zA-Z0-9]", "_");
		String id_lower = id.toLowerCase();
		StringBuilder sb = new StringBuilder();

		sb.append(String.format(".globl %s_data\n", id_lower));
		sb.append(String.format("%s_data:\n", id_lower));

		for(Integer i : getData()) {
			sb.append(String.format("\t.db 0x%02X\n", i));
		}

		return sb.toString();
	}
}
