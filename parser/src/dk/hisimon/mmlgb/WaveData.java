package dk.hisimon.mmlgb;

public class WaveData {
	private int[] data;

	public WaveData(int[] data) {
		if(data.length != 32) {
			throw new IllegalArgumentException(
				String.format("Array contains %d samples. Expected 32.", data.length)
			);
		}

		this.data = data;
	}

	public int[] getData() {
		return data;
	}
}
