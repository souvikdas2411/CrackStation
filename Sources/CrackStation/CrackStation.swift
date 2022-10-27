import Foundation
import CryptoKit

public class CrackStation: Decrypter {
        
    private let alphabet: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    private let numbers: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    private var hashDict:[String:String]

    public required init() {
        self.hashDict = [:]
    }
    
    private func encryptUsingSha1(from input: String) -> String {
        let inputData = Data(input.utf8)
        if #available(macOS 10.15, *) {
            let output = Insecure.SHA1.hash(data: inputData)
            return output.description
        } else {
            return "Need macOS>10.15 for generating hash"
        }

    }
    
    private func generateHash() -> Bool{
        for a in alphabet {
                hashDict[encryptUsingSha1(from: a)] = a
                hashDict[encryptUsingSha1(from: a.uppercased())] = a.uppercased()
        }
        for n in numbers {
                hashDict[encryptUsingSha1(from: n)] = n
        }
        UserDefaults.standard.set(hashDict, forKey: "hashDict")
        
        if UserDefaults.standard.object(forKey: "hashDict") != nil {
            return true
        }
        else {
            return false
        }
    }
    
    public func decrypt(shaHash: String) -> String? {
        if UserDefaults.standard.object(forKey: "hashDict") == nil {
            if(generateHash()) {
                let hashDict = UserDefaults.standard.object(forKey: "hashDict") as? [String:String]
                return hashDict?["SHA1 digest: \(shaHash)"]
            }
            return nil
        }
        if UserDefaults.standard.object(forKey: "hashDict") != nil {
            let hashDict = UserDefaults.standard.object(forKey: "hashDict") as? [String:String]
            return hashDict?["SHA1 digest: \(shaHash)"]
        }
        return nil
    }

}
