import UIKit

class FacebookViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //let url = "fb://profile/116000535113722"
        
        let url = "https://m.facebook.com/GrandBlancHighSchool"
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }
    
    
    @IBAction func closeView(sender: UIBarButtonItem) {
        
        navigationController!.dismissViewControllerAnimated(true, completion: nil)
    }
}