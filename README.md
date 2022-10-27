# CrackStation POC2 CS561 Week 6

A vanilla crack station that is able to crack any password up to two characters in length, which (a) matches either the regular expression[A-Za-z0-9]{1,2} and (b) is encrypted using SHA-1 or SHA-256.  So, everything POC v1 can do plus a bit more. 

# Why might someone want to use it or care?

Firstly it is cool to crack hashes. You can use this to raise awareness about insecure password storage in web applications, and to provide guidance to implementors of user authentication systems. We make it easier for security researchers to demonstrate why password storage solutions, like non-salted hashing, are insecure. 

## Sample test data

```bash
decrypt(shaHash: String)
```

| Input to crack station: the encrypted password | Crack station’s output: the plain-text password. |
| ---------------------------------------------- | ------------------------------------------------ |
| ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb       | a       											|
| 7902699be42c8a8e46fbbb4501726517e86b22c56a189f7625a6da49081b2451       | 7       											|

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