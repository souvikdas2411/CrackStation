# CrackStation POC1 CS561 Week 5

A vanilla Crackstation which can crack any single-character password, which matches the regular expression [A-Za-z0-9] and is encrypted using the SHA-1 cryptographic hash function. 

## Sample test data

```bash
crack(password: "Your SHA1 Digest")
```

| Input to crack station: the encrypted password | Crack station’s output: the plain-text password. |
| ---------------------------------------------- | ------------------------------------------------ |
| 86f7e437faa5a7fce15d1ddcb9eaeaea377667b8       | a       											|
| 902ba3cda1883801594b6e1b452790cc53948fda       | 7       											|

## How to use our CrackStation?
The function below returns the plain-text password, if not found the function returns nil.
```swift
public func decrypt(shaHash: String) -> String?
```

If you are adding our package as a dependency look below.
```swift
import CrackStation
...
decrypt(shaHash: "Your hash")
```

## How to generate the SHA1 digest?

```bash
echo -n "your string" | sha1sum
```