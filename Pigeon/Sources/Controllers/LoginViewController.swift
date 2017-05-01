import UIKit
import Material
import CoreLocation

class LoginViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    var locationManager: CLLocationManager!

    var loginViewModel: LoginViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        self.loginViewModel = LoginViewModel()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.usernameTextField {
            return self.passwordTextField.becomeFirstResponder()
        } else {
            self.view.endEditing(true)
            return false
        }
    }

    @IBAction func didPressLoginButton(_ sender: Any) {
        guard
            let loginViewModel = self.loginViewModel,
            let username = self.usernameTextField.text,
            let password = self.passwordTextField.text else {
                return
        }

        if loginViewModel.validateLoginFields(username: username, password: password) {
            if loginViewModel.login(username: username, password: password) {
                let navigationController = NavigationController(rootViewController: PageViewController())

                self.present(navigationController , animated: true, completion: nil)
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) in
            
            if (error != nil) {
                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                return
            }
            
            if (placemarks?.count)! > 0 {
                let pm = (placemarks?[0])! as CLPlacemark
                ApplicationManager.shared.currentCity = pm.locality!
                return
            }
        }
    }
}
