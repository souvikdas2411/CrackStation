import Foundation
import CryptoKit

public class CrackStation {
    
    private let alphabet: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    private let numbers: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    private var hashDict:[String:String]
    
    public init() {
        self.hashDict = [:]
    }
    
    private func encryptUsingSha1(from input: String) -> String {
        let inputData = Data(input.utf8)
        let output = Insecure.SHA1.hash(data: inputData)
        return output.description
    }
    
    public func generateHash() async -> Bool{
//        if UserDefaults.standard.object(forKey: "hashDict") == nil {
//            for a in alphabet {
//                hashDict[encryptUsingSha1(from: a)] = a
//                hashDict[encryptUsingSha1(from: a.uppercased())] = a.uppercased()
//            }
//            UserDefaults.standard.set(hashDict, forKey: "hashDict")
//        }
        
        // Not  using
        /// -------------> if UserDefaults.standard.object(forKey: "hashDict") == nil <-------------
        // because if the cached file gets damaged somehow the user should be able to generate a new hashDict
        
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
    
    /// Either returns the cracked plain-text password
    /// or, if unable to crack, then returns nil.
    public func crack(password: String) -> String? {
        if UserDefaults.standard.object(forKey: "hashDict") != nil {
            let hashDict = UserDefaults.standard.object(forKey: "hashDict") as? [String:String]
            return hashDict?["SHA1 digest: \(password)"]
        }
        return nil
    }
}
