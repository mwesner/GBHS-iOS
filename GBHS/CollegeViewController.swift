import UIKit

class CollegeViewController: UIViewController {
    
    
    @IBAction func learnMore(_ sender: UIButton) {
        UIApplication.shared.openURL(URL(string: "http://early-college.grandblanc.schoolfusion.us")!)
    }
}
