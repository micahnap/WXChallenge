import XCTest
@testable import WXChallenge
class ViewModelTests: XCTestCase {
  
  struct MockService: DogFetching {
    func getDogs(completion: @escaping (Result<[DogData], Error>) -> Void) {
      let error = NSError(domain: "", code: 999, userInfo: nil)
      return completion(.failure(error))
    }
  }
  
  func testDogsSortedByLifeSpan() {
    let dog = Dog(displayName: "Yorkie", lifeSpan: "10-13 years", imageURL: URL(string: "www.google.com")!)
    let dog1 = Dog(displayName: "Bulldog", lifeSpan: "8-10 years", imageURL: URL(string: "www.google.com")!)
    let dog2 = Dog(displayName: "Terrier", lifeSpan: "10-11 years", imageURL: URL(string: "www.google.com")!)
    
    let viewModel = ViewModel(service: MockService())
    viewModel.dogs = [dog, dog1, dog2]
    
    let dogsAscending = viewModel.dogs(isSelected: false)
    XCTAssertEqual(dogsAscending, [dog1, dog2, dog])
    
    let dogsDescending = viewModel.dogs(isSelected: true)
    XCTAssertEqual(dogsDescending, [dog, dog2, dog1])
  }

}
