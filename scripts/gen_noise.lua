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

print("#include \"noisefreq.h\"")

print("\nconst unsigned char noise_freq[] = {")

for r = 7, 0, -1 do
	print("\t" .. "//o" .. 8-r .. ":")
	for s = 15, 4, -1 do
		print("\t" .. bitmask(r, s) .. "U,")
	end
	print("\t0U, 0U, 0U, 0U,")
end
-- Extended noise table:
for o = 0, 1 do
	print("\t" .. "//o" .. o+9 .. ":")
	if o == 0 then
		for i = 0, 2 do
			for j = 0, 3 do
				print("\t" .. 56-i*16 - j-1 .. "U,")
			end
		end
	else
		for i = 0, 11 do
			print("\t" .. math.max(1, 7-i) .. "U,")
		end
	end
	print("\t0U, 0U, 0U, 0U,")
end
print("};")
