import Foundation

class ViewModel {
  init(service: DogFetching) {
    self.service = service
  }
  
  var dogs: [Dog]?
  
  var normalButtonTitle: String {
    return "Sort by descending"
  }
  
  var selectedButtonTitle: String {
    return "Sort by ascending"
  }
  
  private let service: DogFetching
  
  private var dogsByAscending: [Dog]? {
    guard let dogs = dogs else { return nil }
    return dogs.sorted(by: { $0.maxLifeSpan > $1.maxLifeSpan })
  }
  
  private var dogsByDescending: [Dog]? {
    guard let dogs = dogs else { return nil }
    return dogs.sorted(by: { $0.maxLifeSpan < $1.maxLifeSpan })
  }
  
  func dogs(isSelected: Bool) -> [Dog]? {
    if isSelected {
      return dogsByAscending
    } else {
      return dogsByDescending
    }
  }
  
  func getDogs(completion: @escaping (Result<[Dog], Error>) -> Void) {
    service.getDogs { [weak self] (result) in
      switch result {
      case .success(let dogs):
        let dogs: [Dog] = dogs.compactMap { dogData in
          guard let breed = dogData.breeds.first else { return nil }
          return Dog(displayName: breed.name, lifeSpan: breed.life_span, imageURL: dogData.url) 
        }
        self?.dogs = dogs
        completion(.success(dogs))
      case .failure(let error):
        assertionFailure(error.localizedDescription)
      }
    }
  }
}

