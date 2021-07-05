
import XCTest
@testable import PizzabotApp

var sut: PizzabotType!

class PizzabotTests: XCTestCase {

    override func setUpWithError() throws {
        sut = Pizzabot()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample1() throws {
        let initialString = "5x5 (1, 3) (4, 4)"
        XCTAssertEqual(try sut.route(for: initialString), "ENNNDEEEND")
    }
    
    func testExample2() throws {
        let initialString = "5x5 (0, 0) (1, 3) (4,4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)"
        XCTAssertEqual(try sut.route(for: initialString), "DENNNDEEENDSSDDWWWWSDEEENDWNDEESSD")
    }
    
    func testExtraSpaces() throws {
        let initialString = " 5   x5  (1,   3)   (   4, 4 )  "
        XCTAssertEqual(try sut.route(for: initialString), "ENNNDEEEND")
    }
    
    func testNoPoints() throws {
        let initialString = "3x3"
        XCTAssertEqual(try sut.route(for: initialString), "")
    }
    
    func testWrongInitialStringFormat() throws {
        let initialString = "dfhfgjfdgf"
        XCTAssertThrowsError(try sut.route(for: initialString), "", { error in print("Error catched: \(error)") })
    }
    
    func testEmptyInitialString() throws {
        let initialString = ""
        XCTAssertThrowsError(try sut.route(for: initialString), "", { error in print("Error catched: \(error)") })
    }
    
    func testNotAllPointsInRegion() throws {
        let initialString = "5x5 (1,3)(2,5)(6,2)"
        XCTAssertThrowsError(try sut.route(for: initialString), "", { error in print("Error catched: \(error)") })
    }

}
