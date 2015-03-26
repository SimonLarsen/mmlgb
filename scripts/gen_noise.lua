local THRESHOLD = 50

function freq(r, s)
	if r == 0 then
		r = 0.5
	end
	return 524228 / r / math.pow(2, s+1)
end

function bitmask(r, s)
	return (s * 16) + r
end

print("#ifndef MUS_NOISEFREQ_H")
print("#define MUS_NOISEFREQ_H")

print("\n#define MUS_NOISE_FIRST_OCTAVE 1U");

print("\nconst UBYTE noise_freq[] = {")

for r = 7, 0, -1 do
	for s = 15, 4, -1 do
		print("\t" .. bitmask(r, s) .. "U,")
	end
	print("\t0U, 0U, 0U, 0U,")
end
print("};")
print("\n#endif")
