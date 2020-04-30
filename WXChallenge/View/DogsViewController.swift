
import UIKit

class DogsViewController: UIViewController {
  init(viewModel: ViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @IBOutlet private weak var tableView: UITableView!
  @IBOutlet private weak var sortButton: UIButton! {
    didSet {
      self.sortButton.setTitle(viewModel.normalButtonTitle, for: .normal)
      self.sortButton.setTitle(viewModel.selectedButtonTitle, for: .selected)
    }
  }
  
  private let viewModel: ViewModel
  private var dataSource: [Dog]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    registerCell()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    loadData()
  }
  
  private func registerCell() {
    tableView.register(UINib(nibName: "DogCell", bundle: Bundle.main), forCellReuseIdentifier: "cellIdentifier")
  }
  
  private func loadData() {
    viewModel.getDogs { [weak self](result) in
      switch result {
      case .success (let result):
        self?.dataSource = result
        self?.tableView.reloadData()
      case .failure(let error):
        assertionFailure(error.localizedDescription)
      }
    }
  }
  
  @IBAction func sort(_ sender: UIButton) {
    sender.isSelected = !sender.isSelected
    dataSource = viewModel.dogs(isSelected: sender.isSelected)
    tableView.reloadData()
  }
  
}

extension DogsViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let dataSource = dataSource else { return 0 }
    return dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") as? DogCell, 
      let dataSource = dataSource else {
      return UITableViewCell()
    }
    let dog = dataSource[indexPath.row]
    let viewModel = DogCellViewModel(dog: dog)
    cell.configure(with: viewModel)
    return cell
  }
  
}
