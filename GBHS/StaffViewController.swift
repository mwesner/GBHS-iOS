import UIKit
import MessageUI

class StaffViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    var phone = ""
    var email = ""
    
    
    //Call the staff member when pressed.
    @IBAction func phoneButtonPress(sender: AnyObject) {
        if (phoneButton.titleForState(UIControlState.Normal) != "NONE")
        {
            let phoneCall = "tel://" + phoneButton.titleForState(UIControlState.Normal)!
            let number = phoneCall.stringByReplacingOccurrencesOfString("-", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            
            //Execute the call
            UIApplication.sharedApplication().openURL(NSURL(string: number)!)
        }
    }
    
    //Email the staff member when pressed. 
    @IBAction func emailButtonPress(sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients([email])
        mailComposerVC.setSubject("Sending you an in-app e-mail...")
        mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setupButton(button: UIButton) {
        button.backgroundColor = UIColor.clearColor()
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneButton.setTitle(phone, forState: UIControlState.Normal)
        setupButton(phoneButton)
        emailButton.setTitle(email, forState: UIControlState.Normal)
        setupButton(emailButton)
    }
}