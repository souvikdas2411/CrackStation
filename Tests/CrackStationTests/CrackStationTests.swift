import XCTest
import CrackStation

final class CrackStationTests: XCTestCase {
    
    func testCrackStation() async {
        let crackStation = CrackStation()
        if(crackStation.generateHash()){
            print("Hash dict created")
            var plainText = crackStation.decrypt(shaHash: "961b6dd3ede3cb8ecbaacbd68de040cd78eb2ed5889130cceb4c49268ea4d506")
            XCTAssertEqual(plainText, "aa")
            plainText = crackStation.decrypt(shaHash: "6dcd4ce23d88e2ee9568ba546c007c63d9131c1b")
            XCTAssertEqual(plainText, "A")
            plainText = crackStation.decrypt(shaHash: "b6589fc6ab0dc82cf12099d1c2d40ab994e8410c")
            XCTAssertEqual(plainText, "0")
        }
    }
    
}
