import UIKit
import SWXMLHash

class AnnounceViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var announcements: [String] = []
    
    //Track type: 0 is date (header), 1 is announcement
    var sort: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160.0
        
        let urlString = "http://drive.google.com/uc?export=downloads&id=0B0YlVLIB047UQzRVclRBb2RFS00"
        
        if let myURL = NSURL(string: urlString) {
            var error: NSError?
            let myHTMLString = String(contentsOfURL: myURL, encoding: NSUTF8StringEncoding, error: &error)
            
            if let error = error {
                println("Error : \(error)")
            } else {
                
                //Parse the XML
                
                let xml = SWXMLHash.parse(myHTMLString!)
                
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
                
            }
        } else {
            println("Error: \(urlString) is invalid.")
        }
    }
    
    //Number of rows in table
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcements.count
    }
    
    //Contents of each cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        if sort[indexPath.row] == 1 {
            let CellIdentifier: String = "AnnounceCell"
            
            cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! UITableViewCell?
            
            if cell == nil {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifier)
            }
            
            cell!.textLabel?.text = announcements[indexPath.row]
            cell!.textLabel?.numberOfLines = 0
        }else{
            //Date cell, designed to act as a custom section header
            let CellIdentifier: String = "DateCell"
            
            cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! UITableViewCell?
            
            if cell == nil {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifier)
            }
            cell!.textLabel?.text = " "
            cell!.detailTextLabel?.text = announcements[indexPath.row].uppercaseString
        }
        
        return cell!
        
    }
}

