import XCTest
@testable import WXChallenge
class DogTests: XCTestCase {
    func testDogLifeSpan() {
      let dog = Dog(displayName: "Yorkie", lifeSpan: "10 - 13 years", imageURL: URL(string: "www.google.com")!)
      XCTAssertEqual(dog.lifeSpan, "10 - 13 years")
      XCTAssertEqual(dog.maxLifeSpan, "13")
    }
    
    func testDogWithNoLifeSpanRange() {
      let dog = Dog(displayName: "Yorkie", lifeSpan: "13 years", imageURL: URL(string: "www.google.com")!)
      XCTAssertEqual(dog.lifeSpan, "13 years")
      XCTAssertEqual(dog.maxLifeSpan, "13")
    }

}
