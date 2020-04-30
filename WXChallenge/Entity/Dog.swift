import Foundation

protocol DogInterface {
  var displayName: String { get }
  var lifeSpan: String { get }
  var imageURL: URL { get }
}

struct Dog: DogInterface, Equatable {
  var displayName: String
  var lifeSpan: String
  var imageURL: URL
}

extension Dog {
  var maxLifeSpan: String {
    let spanRanges = lifeSpan.components(separatedBy: CharacterSet.decimalDigits.inverted).filter { !$0.isEmpty}
    return spanRanges.count > 1 ? spanRanges[1] : spanRanges[0]
  }
}


