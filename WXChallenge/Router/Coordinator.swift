
class Coordinator {

  private let service: Service = Service(client: Client())
  
  var rootViewController: DogsViewController {
    let viewModel = ViewModel(service: service)
    let dogsViewController = DogsViewController(viewModel: viewModel)
    return dogsViewController
  }
}
