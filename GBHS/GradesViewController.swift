import UIKit

class GradesViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "com.jupitered.jupitered"
                
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }
    
    
    @IBAction func closeView(sender: UIBarButtonItem) {
        
        navigationController!.dismissViewControllerAnimated(true, completion: nil)
    }
}