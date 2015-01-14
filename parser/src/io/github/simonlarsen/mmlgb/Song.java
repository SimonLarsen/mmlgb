package io.github.simonlarsen.mmlgb;

import java.util.List;
import java.util.ArrayList;

public class Song {
	private int modulo, ticks;

	private List<WaveData> waveData;
	private List<List<Integer>> channel;

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
		T_EOF
	};

	public Song() {
		waveData = new ArrayList<WaveData>();

		channel = new ArrayList<List<Integer>>();
		for(int i = 0; i < 4; ++i) {
			channel.add(new ArrayList<Integer>());
		}
	}

	public void addWaveData(WaveData data) {
		waveData.add(data);
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
		data.add(modulo);
		data.add(ticks);

		int chan1Start = 6;
		int chan2Start = chan1Start + channel.get(0).size();
		int chan3Start = chan2Start + channel.get(1).size();
		int chan4Start = chan3Start + channel.get(2).size();

		data.add(chan1Start);
		data.add(chan2Start);
		data.add(chan3Start);
		data.add(chan4Start);

		// Generate wave data
		
		// Output channel data
		for(int i = 0; i < 4; ++i) {
			data.addAll(channel.get(i));
		}

		return data;
	}
}
