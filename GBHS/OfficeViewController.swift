import UIKit
import MessageUI

class OfficeViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var bioText: UITextView!
    @IBOutlet weak var faceImage: UIImageView!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var nameText: UITextView!
    
    //Information about the person
    var pic = ""
    var name = ""
    var job = ""
    var phone = ""
    var email = ""
    var bio = ""
    
    //Set up the information correctly
    override func viewDidLoad(){
        super.viewDidLoad()
        faceImage.image = UIImage(named: pic)
        nameText.text = name
        titleText.text = job
        bioText.text = bio
        emailButton.setTitle(email, forState: UIControlState.Normal)
        phoneButton.setTitle(phone, forState: UIControlState.Normal)
    }
    
    //Email the office staff
    @IBAction func emailButtonPressed(sender: AnyObject) {
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
    
    //Call the office staff
    @IBAction func phoneButtonPressed(sender: AnyObject) {
        let phoneCall = "tel://" + phoneButton.titleForState(UIControlState.Normal)!
        let number = phoneCall.stringByReplacingOccurrencesOfString("-", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        //Execute the call
        UIApplication.sharedApplication().openURL(NSURL(string: number)!)
    }
}