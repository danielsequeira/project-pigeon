import UIKit

class PageItemController: UIViewController {

    var itemName: String = ""
    var itemDescription: String = ""
    var itemIndex: Int = 0
    var imageName: String = "" {
        didSet {
            if let imageView = contentImageView {
                imageView.image = UIImage(named: imageName)
            }
        }
    }

    init(itemName: String!, itemDescription: String!, imageName: String!, itemIndex: Int!) {
        self.itemName = itemName
        self.itemDescription = itemDescription
        self.itemIndex = itemIndex
        self.imageName = imageName
        super.init(nibName: nil, bundle: nil)
    }

    init(card: CardModel!, itemIndex: Int!) {
        self.itemName = card.name
        self.itemDescription = card.description
        self.itemIndex = itemIndex
        self.imageName = card.imageName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBOutlet var contentNameView: UILabel!
    @IBOutlet var contentDescView: UILabel!
    @IBOutlet var contentImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        contentNameView.text = itemName
        contentDescView.text = itemDescription
        contentImageView.image = UIImage(named: imageName)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        contentImageView.isUserInteractionEnabled = true
        contentImageView.addGestureRecognizer(tapGestureRecognizer)
    }

    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let navigationController = NavigationController(rootViewController: GalleryViewController())
        self.present(navigationController, animated: true, completion: nil)
    }
}
