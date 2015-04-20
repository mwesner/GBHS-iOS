import UIKit

class Home: UIViewController {

    @IBOutlet weak var btnAnnounce: UIButton!
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnTwitter: UIButton!
    @IBOutlet weak var btnCalendar: UIButton!
    @IBOutlet weak var btnTimes: UIButton!
    @IBOutlet weak var btnGrades: UIButton!
    @IBOutlet weak var btnWeb: UIButton!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.Default
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationController!.navigationBar.barTintColor = UIColor.clearColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Grand Blanc High School"
    
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

