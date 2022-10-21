import XCTest
import CrackStation

final class CrackStationTests: XCTestCase {
    
    func testCrackStation() async {

        let crackStation = CrackStation()
        let result = await crackStation.generateHash()
        
        if (result){
            print("Hash dict created")
            let plainText = crackStation.crack(password: "e9d71f5ee7c92d6dc9e92ffdad17b8bd49418f98")
            XCTAssertEqual(result, true)
            XCTAssertEqual(plainText, "b")
        }
        else {
            print("Some error occured. Please try again!")
            XCTAssertEqual(result, false)
        }

    }
    
}
