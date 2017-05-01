import UIKit

class PageViewController: UIViewController, UIPageViewControllerDataSource {

    @IBOutlet weak var greetingsLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    fileprivate var pageViewController: UIPageViewController?
    fileprivate var elements: [CardModel]!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard
            let currentUser = ApplicationManager.shared.currentUser,
            let currentCity = ApplicationManager.shared.currentCity,
            let cardList = ApplicationManager.shared.cardList,
            let navigationController = self.navigationController else {
                return
        }

        navigationController.navigationBar.isHidden = true

        self.greetingsLabel.text = "Hi, " + currentUser + ". Welcome to"
        self.cityLabel.text = currentCity
        
        self.elements = cardList

        createPageViewController()

    }

    fileprivate func createPageViewController() {
        self.pageViewController = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController?.dataSource = self
        
        if elements.count > 0 {
            let firstController = getItemController(0)!
            let startingViewControllers = [firstController]
            self.pageViewController?.setViewControllers(startingViewControllers, direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        }

        addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        self.pageViewController!.didMove(toParentViewController: self)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! PageItemController
        
        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex-1)
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! PageItemController
        
        if itemController.itemIndex+1 < elements.count {
            return getItemController(itemController.itemIndex+1)
        }
        
        return nil
    }

    fileprivate func getItemController(_ itemIndex: Int) -> PageItemController? {
        
        if itemIndex < elements.count {
            let pageItemController = PageItemController.init(card: elements[itemIndex], itemIndex: itemIndex)
            return pageItemController
        }
        
        return nil
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return elements.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

    func currentControllerIndex() -> Int {
        
        let pageItemController = self.currentController()
        
        if let controller = pageItemController as? PageItemController {
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
