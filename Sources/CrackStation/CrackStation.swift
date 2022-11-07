import Foundation
import CryptoKit

public class CrackStation: Decrypter {
    
    private var hashDict:[String:String]
    
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
    
    public func decrypt(shaHash: String) -> String? {
        if(hashDict[shaHash] != nil) {
            return hashDict[shaHash]
        }
        else {
            return nil
        }
        
    }
}
