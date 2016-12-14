import UIKit

class FacebookViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //let url = "fb://profile/116000535113722"
        
        let url = "https://m.facebook.com/GrandBlancHighSchool"
        let requestURL = URL(string:url)
        let request = URLRequest(url: requestURL!)
        webView.loadRequest(request)
    }
    
    
    @IBAction func closeView(_ sender: UIBarButtonItem) {
        
        navigationController!.dismiss(animated: true, completion: nil)
    }
}
