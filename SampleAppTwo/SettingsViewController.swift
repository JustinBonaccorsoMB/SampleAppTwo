import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions
    @IBAction func logoutPressed(sender: UIButton) {
        self.navigationController?.popToRootViewControllerAnimated(false)
    }
}
