package io.github.simonlarsen.mmlgb;

import java.util.List;
import java.util.ArrayList;

public class Song {
	private int waveDataCount, envDataCount;

	private WaveData[] waveData;
	private int[] envData;
	private List<List<Integer>> channel;

	private static final int HEADER_SIZE = 4;
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
		T_LENGTH,
		T_OCTAVE,
		T_OCT_UP,
		T_OCT_DOWN,
		T_VOL,
		T_ENV,
		T_WAVE,
		T_TEMPO,
		T_EOF
	};

	public Song() {
		waveData = new WaveData[MAX_WAVE_DATA];
		waveDataCount = 0;

		envData = new int[MAX_ENV_DATA];
		envDataCount = 0;

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

	public void addEnvData(int id, int direction, int length) throws ParserException {
		if(id >= MAX_ENV_DATA) {
			throw new ParserException(String.format("You can only define %d envelopes.", MAX_ENV_DATA));
		}
		envData[id] = (direction << 3) | length;
		envDataCount = Math.max(envDataCount, id+1);
	}

	public int getEnvData(int id) {
		return envData[id];
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
		int chan1Start = HEADER_SIZE + waveDataCount * 16;
		int chan2Start = chan1Start + channel.get(0).size();
		int chan3Start = chan2Start + channel.get(1).size();
		int chan4Start = chan3Start + channel.get(2).size();

		data.add(chan1Start);
		data.add(chan2Start);
		data.add(chan3Start);
		data.add(chan4Start);

		// Generate wave data
		for(int i = 0; i < waveDataCount; ++i) {
			int[] samples = waveData[i].getData();
			if(samples != null) {
				for(int j = 0; j < 16; j += 2) {
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
}
