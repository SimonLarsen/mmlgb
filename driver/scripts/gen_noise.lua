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

print("\nconst UBYTE noise_freq[] = {")
local count = 0
for r = 7, 0, -1 do
	for s = 15, 0, -1 do
		if freq(r, s) >= THRESHOLD then
			print("\t" .. bitmask(r, s) .. "U,")

			count = count+1
			if count == 12 then
				print("\t0U, 0U, 0U, 0U,")
				count = 0
			end
		end
	end
end
print("};")
print("\n#endif")
