import XCTest
import CrackStation

final class CrackStationTests: XCTestCase {
    
    func testCrackStation() async {
        let crackStation = CrackStation()
        var plainText = crackStation.decrypt(shaHash: "961b6dd3ede3cb8ecbaacbd68de040cd78eb2ed5889130cceb4c49268ea4d506")
        XCTAssertEqual(plainText, "aa")
        plainText = crackStation.decrypt(shaHash: "6dcd4ce23d88e2ee9568ba546c007c63d9131c1b")
        XCTAssertEqual(plainText, "A")
        plainText = crackStation.decrypt(shaHash: "66abb21cab9931cf7033eaf5a1eb04924cd88b0a30219b7b6118700167e4be18")
        XCTAssertEqual(plainText, "1r")
        plainText = crackStation.decrypt(shaHash: "58bb119c35513a451d24dc20ef0e9031ec85b35bfc919d263e7e5d9868909cb5")
        XCTAssertEqual(plainText, "AA")
        
        
        let milesToPoint = ["point1":120.0,"point2":50.0,"point3":70.0]
        //        let kmToPoint = milesToPoint.map {name,miles in miles * 1.6093}
        print(milesToPoint.map {name,miles in miles * 1.6093}.reduce(0, +))
        
    }
}
