import UIKit

class CollegeViewController: UIViewController {
    
    
    @IBAction func learnMore(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://early-college.grandblanc.schoolfusion.us")!)
    }
}
