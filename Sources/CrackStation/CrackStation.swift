import Foundation
import CryptoKit

public class CrackStation: Decrypter {
    
    private let hashDict:[String:String]
    
    public required init() {
        let path = Bundle.module.url(forResource: "data", withExtension: "json")!
        let data = try! Data(contentsOf: path)
        let jsonResult = try! JSONSerialization.jsonObject(with: data)
        self.hashDict = jsonResult as? [String:String] ?? [:]
        
    }
    
    public func decrypt(shaHash: String) -> String? {
        return hashDict[shaHash]
        
    }
}
