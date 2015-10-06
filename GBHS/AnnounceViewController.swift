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
    
    //Track type: 0 is date (header), 1 is announcement
    var sort: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160.0
        
        let urlString = "http://drive.google.com/uc?export=downloads&id=0B0YlVLIB047UQzRVclRBb2RFS00"
        
        if let myURL = NSURL(string: urlString) {
       
            let myHTMLString: String?
            do {
                myHTMLString = try String(contentsOfURL: myURL, encoding: NSUTF8StringEncoding)
                
                //Parse the XML
                
                let xml = SWXMLHash.parse(myHTMLString!)
                
                if xml["root"]["group"].all.count > 0 {
                    //Announcements present.
                    tableView.hidden = false
                    txtError.hidden = true
                    imgError.hidden = true
                }
                
                for var i = 0; i < xml["root"]["group"].all.count; ++i {
                    
                    for var j = 0; j < xml["root"]["group"][i]["date"].all.count; ++j {
                        announcements.append(xml["root"]["group"][i]["date"][j].element!.text!)
                        sort.append(0)
                    }
                    
                    for var k = 0; k < xml["root"]["group"][i]["announcement"].all.count; ++k {
                        announcements.append(xml["root"]["group"][i]["announcement"][k].element!.text!)
                        sort.append(1)
                    }
                }

            } catch let error as NSError {
                myHTMLString = nil
                
                if Reachability.isConnectedToNetwork() == true {
                    //Connection established, but scraper has failed.
                    txtError.text = "Cannot parse announcements feed"
                    
                    Answers.logCustomEventWithName("Announcements parse failure: \(error.localizedDescription)", customAttributes: nil)
                }else{
                    //No internet connection.
                    txtError.text = "Cannot connect to announcements feed"
                }
            }
        }
    }
    
    //Number of rows in table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcements.count
    }
    
    //Contents of each cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        if sort[indexPath.row] == 1 {
            let CellIdentifier: String = "AnnounceCell"
            
            cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier)
            
            if cell == nil {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifier)
            }
            
            cell!.textLabel?.text = announcements[indexPath.row]
            cell!.textLabel?.numberOfLines = 0
        }else{
            //Date cell, designed to act as a custom section header
            let CellIdentifier: String = "DateCell"
            
            cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) 
     if cell == nil {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifier)
            }
            cell!.textLabel?.text = " "
            cell!.detailTextLabel?.text = announcements[indexPath.row].uppercaseString
        }
        
        return cell!
        
    }
    
    class Reachability {
        class func isConnectedToNetwork() -> Bool {
            var zeroAddress = sockaddr_in()
            zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
            zeroAddress.sin_family = sa_family_t(AF_INET)
            let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
                SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
            }
            var flags = SCNetworkReachabilityFlags()
            if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
                return false
            }
            let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
            let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
            return (isReachable && !needsConnection)
        }
    }
}

