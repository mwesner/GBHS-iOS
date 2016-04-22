import UIKit

class GradesViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://studentvue.geneseeisd.org/GBCS/Login_Student_PXP.aspx"
                
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }
    
    
    @IBAction func closeView(sender: UIBarButtonItem) {
        
        navigationController!.dismissViewControllerAnimated(true, completion: nil)
    }
}