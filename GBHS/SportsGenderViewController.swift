import UIKit

class SportsGenderViewController: UITableViewController, UIWebViewDelegate {
    
    var sportName: String = ""
    var levelName: String = ""
    var genderName: String = ""
    
    var genderarray: [String] = []
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = levelName
        
        let backItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        
        if (tableView.indexPathForSelectedRow != nil) {
            tableView.deselectRowAtIndexPath(tableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    //Number of rows in table
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genderarray.count
    }
    
    //Contents of each cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let CellIdentifier: String = "GenderCell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) 
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifier)
        }
        cell!.textLabel!.text = genderarray[indexPath.row]
        return cell!
    }
    
    //Handle cell clicks
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        genderName = genderarray[indexPath.row]
        
        /*let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("SportsWebViewController") as! SportsWebViewController
        
        viewController.sportName = sportName
        viewController.levelName = levelName
        viewController.genderName = genderName
        
        self.navigationController?.pushViewController(viewController, animated: true)
        */
        
        let date: NSDate = NSDate()
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let DateInFormat: String = dateFormatter.stringFromDate(date)
        
        let baseURL = "http://schedules.schedulestar.com/Grand-Blanc-High-School-Grand-Blanc-MI/season"
        
        let fullURL = baseURL + "/" + DateInFormat + "/" + genderName + "/" + levelName + "/" + sportName
        
        let url = fullURL.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        
        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("MoreViewController") as! MoreViewController
        
        UIApplication.sharedApplication().openURL(NSURL(string: url)!)
        
        delay(0.5) {
            self.navigationController?.pushViewController(viewController, animated: false)
        }
    }
    
    func delay(delay: Double, closure: ()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(),
            closure
        )
    }
}

