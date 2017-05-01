import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        guard let window = self.window else {
            return false
        }

        window.backgroundColor = UIColor.white
        window.rootViewController = LoginViewController()

        window.makeKeyAndVisible()

        return true
    }
}

