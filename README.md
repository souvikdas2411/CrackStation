# CrackStation, a Decrypter implementation 

A vanilla crack station that is able to crack any unsalted password up to three characters in length, which (a) matches either the regular expression[A-Za-z0-9?!]{1,3} and (b) is encrypted using SHA-1 or SHA-256.

# Overview

* Firstly it is cool to crack hashes. 
* You can use this to raise awareness about insecure password storage in web applications, and to provide guidance to implementors of user authentication systems. 
* We make it easier for security researchers to demonstrate why password storage solutions, like non-salted hashing, are insecure. 

## Installation

## Swift Package Manager
The [Swift Package Manager](https://www.swift.org/package-manager) is "a tool for managing the distribution of Swift code. It's integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies."

Once you have your Swift package set up, add CrackStation to the list of dependencies in your Package, swift file:

```swift
    dependencies: [
        .package(url: "git@github.com:souvikdas2411/CrackStation.git", from: "1.2.0"),
    ]
```

## Usage
## The API
The function below returns the plain-text password, if not found the function returns nil.
```swift
public required init() {
    self.hashDict = [:]
    if let path = Bundle.module.url(forResource: "data", withExtension: "json") {
        do {
            let data = try Data(contentsOf: path)
            let jsonResult = try JSONSerialization.jsonObject(with: data)
            if let jsonResult = jsonResult as? [String:String] {
                self.hashDict = jsonResult
            }
        } catch {
            self.hashDict = [:]
        }
    }
}
```
```swift
public func decrypt(shaHash: String) -> String?
```
## An example
```swift
import XCTest
import CrackStation

final class CrackStationTests: XCTestCase {
    func testCrackStation() async {
    
        let crackStation = CrackStation()
        
        plainText = crackStation.decrypt(shaHash: "cbf2a7ed1893d2686ae9ec75712d340c8b9f50e7bcd7698ee43ea2e3b42e3911")
        XCTAssertEqual(plainText, "ab!")
        
    }
}
```

## Author
Hi I am **Souvik**! :) 
