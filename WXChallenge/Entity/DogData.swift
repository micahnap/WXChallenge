import Foundation

struct DogData: Decodable {
  let breeds: [BreedData]
  let url: URL
}

struct BreedData: Decodable {
  let name: String
  let life_span: String
}

