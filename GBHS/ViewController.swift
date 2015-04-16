import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnAnnounce: UIButton!
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnTwitter: UIButton!
    @IBOutlet weak var btnCalendar: UIButton!
    @IBOutlet weak var btnTimes: UIButton!
    @IBOutlet weak var btnGrades: UIButton!
    @IBOutlet weak var btnWeb: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonColor(btnAnnounce)
        setButtonColor(btnFacebook)
        setButtonColor(btnTwitter)
        setButtonColor(btnCalendar)
        setButtonColor(btnTimes)
        setButtonColor(btnGrades)
        setButtonColor(btnWeb)
    }
    
    func setButtonColor(button: UIButton) {
        button.backgroundColor = UIColor.grayColor()
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    @IBAction func showAnnouncements(sender: UIButton) {
        var alert = UIAlertController(title: "Announcements", message: "Show the announcements!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func showPosts(sender: UIButton) {
        var alert = UIAlertController(title: "Facebook", message: "Show 20 posts!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    @IBAction func showTweets(sender: UIButton) {
        var alert = UIAlertController(title: "Twitter", message: "Show 20 tweets!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func showCal(sender: UIButton) {
        var alert = UIAlertController(title: "Calendar", message: "Show the iCal events!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func showTimes(sender: UIButton) {
        var alert = UIAlertController(title: "Times", message: "Show the times!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func checkGrades(sender: UIButton) {
        var alert = UIAlertController(title: "Grades", message: "Open StudentVUE!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func showWeb(sender: UIButton) {
        var alert = UIAlertController(title: "Web", message: "Open the website!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}

