import UIKit

class SportsWebViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    var sportName: String = ""
    var levelName: String = ""
    var genderName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = genderName + " " + levelName + " " + sportName
        
        let date: Date = Date()
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let DateInFormat: String = dateFormatter.string(from: date)
        
        let baseURL = "http://schedules.schedulestar.com/Grand-Blanc-High-School-Grand-Blanc-MI/season"
        
        let fullURL = baseURL + "/" + DateInFormat + "/" + genderName + "/" + levelName + "/" + sportName
        
        let url = fullURL.replacingOccurrences(of: " ", with: "%20")
        
        let requestURL = URL(string:url)
        let request = URLRequest(url: requestURL!)
        webView.loadRequest(request)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        webView.scrollView.contentOffset = CGPoint(x: 0, y: 1000);
    }
    
    
}
