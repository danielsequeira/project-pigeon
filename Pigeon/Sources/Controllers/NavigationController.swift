import UIKit

/// The navigation controller.
class NavigationController: UINavigationController {
    /**
     Formats the navigation bar.
     */
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 17), NSForegroundColorAttributeName: UIColor.white]
        self.navigationBar.isTranslucent = false

        self.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)

        let dismissKeyboardTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NavigationController.dismissKeyboard))
        dismissKeyboardTapGestureRecognizer.cancelsTouchesInView = false

        view.addGestureRecognizer(dismissKeyboardTapGestureRecognizer)
    }

    /**
     Resign the first responder status of any existing textfield.
     */
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
