import UIKit

class GradesViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "com.jupitered.jupitered"
                
        let requestURL = URL(string:url)
        let request = URLRequest(url: requestURL!)
        webView.loadRequest(request)
    }
    
    
    @IBAction func closeView(_ sender: UIBarButtonItem) {
        
        navigationController!.dismiss(animated: true, completion: nil)
    }
}
