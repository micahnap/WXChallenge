import Foundation

struct Client {
  func fetchDogs(result: @escaping (Result<[DogData], Error>) -> Void) {
    guard let url = URL(string: "https://api.thedogapi.com/v1/images/search?limit=50") else {
      let error = NSError(domain: "error", code: 0, userInfo: nil)
            result(.failure(error))
      return
    }

    URLSession.shared.dataTask(with: url) { data, _, error in
      if let error = error {
        result(.failure(error))
      }
      if let data = data {
        let decoder = JSONDecoder()
        do {
          let data = try decoder.decode([DogData].self, from: data)
          result(.success(data))
        } catch (let error) {
          result(.failure(error))
        }
      }
    }.resume()
  }
}
