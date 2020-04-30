import UIKit
// AlamofireImage is used to support asynchronus fetching of images and caching
import AlamofireImage

struct DogCellViewModel {
  let dog: DogInterface
  init(dog: DogInterface) {
    self.dog = dog
  }
}

class DogCell: UITableViewCell {
  @IBOutlet private weak var nameLabel: UILabel!
  @IBOutlet private weak var lifeSpanLabel: UILabel!
  @IBOutlet private weak var dogImageView: UIImageView!
  
  override func prepareForReuse() {
    dogImageView.image = nil
  }
  
  func configure(with viewModel: DogCellViewModel) {
    nameLabel.text = viewModel.dog.displayName
    lifeSpanLabel.text = viewModel.dog.lifeSpan
    dogImageView.af.setImage(withURL: viewModel.dog.imageURL)
  }
}
