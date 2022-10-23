import XCTest
import CrackStation

final class CrackStationTests: XCTestCase {
    
    func testCrackStation() async {

        let crackStation = CrackStation()
        let result = await crackStation.generateHash()
        
        if (result){
            print("Hash dict created")
            var plainText = crackStation.crack(password: "86f7e437faa5a7fce15d1ddcb9eaeaea377667b8")
            XCTAssertEqual(result, true)
            XCTAssertEqual(plainText, "a")
            plainText = crackStation.crack(password: "6dcd4ce23d88e2ee9568ba546c007c63d9131c1b")
            XCTAssertEqual(plainText, "A")
            plainText = crackStation.crack(password: "b6589fc6ab0dc82cf12099d1c2d40ab994e8410c")
            XCTAssertEqual(plainText, "0")
            plainText = crackStation.crack(password: "")
            XCTAssertEqual(plainText, nil)
            
        }
        else {
            print("Some error occured. Please try again!")
            XCTAssertEqual(result, false)
        }

    }
    
}
