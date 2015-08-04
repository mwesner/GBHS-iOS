import UIKit

class SportsWebViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    var sportName: String = ""
    var levelName: String = ""
    var genderName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = genderName + " " + levelName + " " + sportName
        
        var date: NSDate = NSDate()
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        var DateInFormat: String = dateFormatter.stringFromDate(date)
        
        let baseURL = "http://schedules.schedulestar.com/Grand-Blanc-High-School-Grand-Blanc-MI/season"
        
        let fullURL = baseURL + "/" + DateInFormat + "/" + genderName + "/" + levelName + "/" + sportName
        
        let url = fullURL.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        webView.scrollView.contentOffset = CGPointMake(0, 1000);
    }
    
    
}