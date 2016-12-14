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
        emailButton.setTitle(email, for: UIControlState())
        phoneButton.setTitle(phone, for: UIControlState())
    }
    
    //Email the office staff
    @IBAction func emailButtonPressed(_ sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
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
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    //Call the office staff
    @IBAction func phoneButtonPressed(_ sender: AnyObject) {
        let phoneCall = "tel://" + phoneButton.title(for: UIControlState())!
        let number = phoneCall.replacingOccurrences(of: "-", with: "", options: NSString.CompareOptions.literal, range: nil)
        
        //Execute the call
        UIApplication.shared.openURL(URL(string: number)!)
    }
}
