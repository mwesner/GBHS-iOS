import Foundation
import UIKit
import SWXMLHash
import Crashlytics
import SystemConfiguration

class AnnounceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet weak var imgError: UIImageView!
    
    @IBOutlet weak var txtError: UILabel!
    
    var announcements: [String] = []
    
    var refreshControl: UIRefreshControl!
    
    //Track type: 0 is date (header), 1 is announcement
    var sort: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(AnnounceViewController.refresh(_:)), for: UIControlEvents.valueChanged)
        tableView.addSubview(refreshControl)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 220.0
        
        getAnnouncements()
    }
    
    func refresh(_ sender:AnyObject) {
        getAnnouncements()
    }
    
    
    //Number of rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcements.count
    }
    
    //Contents of each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        if sort[indexPath.row] == 1 {
            let CellIdentifier: String = "AnnounceCell"
            
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier)
            
            if cell == nil {
                cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: CellIdentifier)
            }
            
            cell!.textLabel?.text = announcements[indexPath.row]
            cell!.textLabel?.numberOfLines = 0
        }else{
            //Date cell, designed to act as a custom section header
            let CellIdentifier: String = "DateCell"
            
            cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier) 
     if cell == nil {
                cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: CellIdentifier)
            }
            cell!.textLabel?.text = " "
            cell!.detailTextLabel?.text = announcements[indexPath.row].uppercased()
        }
        
        return cell!
        
    }
    
    func getAnnouncements() {
        let urlString = "http://drive.google.com/uc?export=downloads&id=0B0YlVLIB047UQzRVclRBb2RFS00"
        
        if let myURL = URL(string: urlString) {
            
            var myHTMLString: String?
            do {
                myHTMLString = try String(contentsOf: myURL, encoding: String.Encoding.utf8)
                
                //Add <root> tag, so XML only has one root tag
                myHTMLString = "<root>\n" + myHTMLString! + "</root>"
                
                //Parse the XML
                
                let xml = SWXMLHash.parse(myHTMLString!)
                
                if xml["root"]["group"].all.count > 0 {
                    //Announcements present.
                    tableView.isHidden = false
                    txtError.isHidden = true
                    imgError.isHidden = true
                }
                
                for i in 0..<xml["root"]["group"].all.count {
                    
                    for j in 0..<xml["root"]["group"][i]["date"].all.count{
                        announcements.append(xml["root"]["group"][i]["date"][j].element!.text!)
                        sort.append(0)
                    }
                    
                    for k in 0..<xml["root"]["group"][i]["announcement"].all.count {
                        announcements.append(xml["root"]["group"][i]["announcement"][k].element!.text!)
                        sort.append(1)
                    }
                }
                
            } catch let error as NSError {
                myHTMLString = nil
                
                if Reachability.isConnectedToNetwork() == true {
                    //Connection established, but scraper has failed.
                    txtError.text = "Cannot parse announcements feed"
                    
                    Answers.logCustomEvent(withName: "Announcements parse failure: \(error.localizedDescription)", customAttributes: nil)
                }else{
                    //No internet connection.
                    txtError.text = "Cannot connect to announcements feed"
                }
            }
        }
        refreshControl.endRefreshing()
    }
    
    class Reachability {
      class func isConnectedToNetwork() -> Bool {
            
            var zeroAddress = sockaddr_in()
            zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
            zeroAddress.sin_family = sa_family_t(AF_INET)
            
            guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
                $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                    SCNetworkReachabilityCreateWithAddress(nil, $0)
                }
            }) else {
                return false
            }
            
            var flags: SCNetworkReachabilityFlags = []
            if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
                return false
            }
            
            let isReachable = flags.contains(.reachable)
            let needsConnection = flags.contains(.connectionRequired)
            
            return (isReachable && !needsConnection)
        }}}

