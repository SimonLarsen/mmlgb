package io.github.simonlarsen.mmlgb;

import java.util.List;
import java.util.ArrayList;

public class Song {
	private int modulo, ticks;

	private List<WaveData> waveData;
	private List<List<Integer>> channel;

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
