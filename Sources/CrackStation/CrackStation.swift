import Foundation
import CryptoKit

public class CrackStation: Decrypter {
    
    //---------
    private let concat: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    //---------
    
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
    
    private func encryptUsingSha256(from input: String) -> String {
        let inputData = Data(input.utf8)
        if #available(macOS 10.15, *) {
            let output = SHA256.hash(data: inputData)
            return output.description
        } else {
            return "Need macOS>10.15 for generating hash"
        }
        
    }
    public func generateHash() -> Bool{
        if let path = Bundle.module.url(forResource: "data", withExtension: "json") {
            do {
                  let data = try Data(contentsOf: path)
                  let jsonResult = try JSONSerialization.jsonObject(with: data)
                  if let jsonResult = jsonResult as? [String] {
                      for a in jsonResult {
                          hashDict[encryptUsingSha1(from: a)] = a
                          hashDict[encryptUsingSha256(from: a)] = a
                      }
                      for a in concat {
                          hashDict[encryptUsingSha1(from: a)] = a
                          hashDict[encryptUsingSha256(from: a)] = a
                      }
                      
                      UserDefaults.standard.set(hashDict, forKey: "hashDict")
                      return true
                  }
              } catch {
                  return false
              }
        }
        return false
    }
    
    public func decrypt(shaHash: String) -> String? {
        if UserDefaults.standard.object(forKey: "hashDict") == nil {
            if(generateHash()) {
                let hashDict = UserDefaults.standard.object(forKey: "hashDict") as? [String:String]
                if(hashDict?["SHA1 digest: \(shaHash)"] != nil) {
                    return hashDict?["SHA1 digest: \(shaHash)"]
                }
                else if(hashDict?["SHA256 digest: \(shaHash)"] != nil) {
                    return hashDict?["SHA256 digest: \(shaHash)"]
                }
                else {
                    return nil
                }
                
            }
        }
        else if UserDefaults.standard.object(forKey: "hashDict") != nil {
            let hashDict = UserDefaults.standard.object(forKey: "hashDict") as? [String:String]
            if(hashDict?["SHA1 digest: \(shaHash)"] != nil) {
                return hashDict?["SHA1 digest: \(shaHash)"]
            }
            else if(hashDict?["SHA256 digest: \(shaHash)"] != nil) {
                return hashDict?["SHA256 digest: \(shaHash)"]
            }
            else {
                return nil
            }
        }
        
        return nil
    }
    
}
