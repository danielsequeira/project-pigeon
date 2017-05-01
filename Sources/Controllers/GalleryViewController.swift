import UIKit

class GalleryViewController: UIViewController, UIPageViewControllerDataSource {

    fileprivate var pageViewController: UIPageViewController?

    let galleryImages = ["pendergast", "pendergast1", "pendergast2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard
            let navigationController = self.navigationController else {
                return
        }
        
        navigationController.navigationBar.isHidden = true

        createPageViewController()
        setupPageControl()
    }
    
    fileprivate func createPageViewController() {
        self.pageViewController = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController?.dataSource = self
        
        if galleryImages.count > 0 {
            let firstController = getItemController(0)!
            let startingViewControllers = [firstController]
            self.pageViewController?.setViewControllers(startingViewControllers, direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        }
        
        addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        self.pageViewController!.didMove(toParentViewController: self)
    }

    fileprivate func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.gray
        appearance.currentPageIndicatorTintColor = UIColor.white
        appearance.backgroundColor = UIColor.black
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! GalleryItemController
        
        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex-1)
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! GalleryItemController
        
        if itemController.itemIndex+1 < galleryImages.count {
            return getItemController(itemController.itemIndex+1)
        }
        
        return nil
    }
    
    fileprivate func getItemController(_ itemIndex: Int) -> GalleryItemController? {
        
        if itemIndex < galleryImages.count {
            let pageItemController = GalleryItemController.init(imageName: galleryImages[itemIndex], itemIndex: itemIndex)
            return pageItemController
        }
        
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return galleryImages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func currentControllerIndex() -> Int {
        
        let pageItemController = self.currentController()
        
        if let controller = pageItemController as? GalleryItemController {
            return controller.itemIndex
        }
        
        return -1
    }
    
    func currentController() -> UIViewController? {
        
        if (self.pageViewController?.viewControllers?.count)! > 0 {
            return self.pageViewController?.viewControllers![0]
        }
        
        return nil
    }
}
