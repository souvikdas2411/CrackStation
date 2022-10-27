import XCTest
import CrackStation

final class CrackStationTests: XCTestCase {
    
    func testCrackStation() async {
        
        let crackStation = CrackStation()
        print("Hash dict created")
        var plainText = crackStation.decrypt(shaHash: "86f7e437faa5a7fce15d1ddcb9eaeaea377667b8")
        XCTAssertEqual(plainText, "a")
        plainText = crackStation.decrypt(shaHash: "6dcd4ce23d88e2ee9568ba546c007c63d9131c1b")
        XCTAssertEqual(plainText, "A")
        plainText = crackStation.decrypt(shaHash: "b6589fc6ab0dc82cf12099d1c2d40ab994e8410c")
        XCTAssertEqual(plainText, "0")
        
        
    }
    
}
