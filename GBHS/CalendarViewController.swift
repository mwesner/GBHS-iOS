import UIKit

class CalendarViewController: UIViewController {
    
    @IBAction func onSubscribe(sender: UIBarButtonItem) {
        UIApplication.sharedApplication().openURL(NSURL (string: "http://grandblanc.high.schoolfusion.us/modules/calendar/exportICal.php")!)
    }
}