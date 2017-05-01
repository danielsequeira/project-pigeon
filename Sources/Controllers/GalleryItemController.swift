import UIKit

class GalleryItemController: UIViewController {

    var itemIndex: Int = 0
    var imageName: String = "" {
        didSet {
            if let imageView = galleryImageView {
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    
    init(imageName: String!, itemIndex: Int!) {
        self.itemIndex = itemIndex
        self.imageName = imageName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBOutlet var galleryImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        galleryImageView.image = UIImage(named: imageName)
    }
}
