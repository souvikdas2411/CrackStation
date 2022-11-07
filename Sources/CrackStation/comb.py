import itertools
import json
import hashlib

# Driver code
arr = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

combs = {}
temp = ""

for i in list(itertools.combinations_with_replacement(arr, 2)):
	for j in i:
		temp = temp + j
	combs[hashlib.sha256(temp.encode()).hexdigest()] = temp
	combs[hashlib.sha1(temp.encode()).hexdigest()] = temp
	temp = ""

for i in arr:
	combs[hashlib.sha256(i.encode()).hexdigest()] = i
	combs[hashlib.sha1(i.encode()).hexdigest()] = i

with open('data.json', 'w', encoding='utf-8') as f:
    json.dump(combs, f, ensure_ascii=False)




