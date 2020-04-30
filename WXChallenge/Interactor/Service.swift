import Foundation

protocol DogFetching {
  func getDogs(completion: @escaping (Result<[DogData], Error>) -> Void)
}

struct Service {
  init(client: Client) {
    self.client = client
  }

  private let client: Client
}

extension Service: DogFetching {
  func getDogs(completion: @escaping (Result<[DogData], Error>) -> Void) {
    self.client.fetchDogs { (result) in
      DispatchQueue.main.async {
        switch result {
        case .success(let dogs):
          completion(.success(dogs))
        case .failure(let error):
          completion(.failure(error))
        }
      }
    }
  }
}
