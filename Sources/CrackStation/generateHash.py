import itertools
import json
import hashlib

# Driver code
arr = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "?", "!"]

combinations = {}
temp = ""

for i in list(itertools.product(arr, repeat=3)):
    for j in i:
        temp = temp + j
    combinations[hashlib.sha256(temp.encode()).hexdigest()] = temp
    combinations[hashlib.sha1(temp.encode()).hexdigest()] = temp
    temp = ""

for i in list(itertools.product(arr, repeat=2)):
	for j in i:
		temp = temp + j
	combinations[hashlib.sha256(temp.encode()).hexdigest()] = temp
	combinations[hashlib.sha1(temp.encode()).hexdigest()] = temp
	temp = ""

for i in arr:
	combinations[hashlib.sha256(i.encode()).hexdigest()] = i
	combinations[hashlib.sha1(i.encode()).hexdigest()] = i

with open('data.json', 'w', encoding='utf-8') as f:
    json.dump(combinations, f, ensure_ascii=False)




