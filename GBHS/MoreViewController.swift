import UIKit

class MoreViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var btnAbout: UIBarButtonItem!
    
    
    @IBAction func showAbout(sender: UIBarButtonItem) {
        var alert = UIAlertController(title: "Grand Blanc High School", message: "Developed by Grand Blanc CTE.\n\nTEAM\n\nLeader:\n\nMichael Wesner\nAP Computer Science A instructor\n\n2015 members:\n\nCorey Rowe\nAaron Goodfellow", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    let morelist = [
    "Daily Schedule",
    "GBHS Facebook",
    "Check Grades",
    "Campus Map",
    "Import Event Calendar",
    "Sports Schedule",
    "Early College",
    "External Links"]
    
    override func viewWillAppear(animated: Bool) {
        self.title="More"
    }
    
    //Number of sections in table
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of rows in table
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return morelist.count
    }
    
    //Contents of each cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var moreitem = morelist[indexPath.row]
        
        let CellIdentifier: String = "MoreCell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! UITableViewCell?
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifier)
        }
        cell!.textLabel!.text = moreitem
        switch indexPath.row {
        case 0:
            cell!.imageView!.image = UIImage(named: "Clock")
        case 1:
            cell!.imageView!.image = UIImage(named: "Facebook")
        case 2:
            cell!.imageView!.image = UIImage(named: "Grades")
        case 3:
            cell!.imageView!.image = UIImage(named: "Map")
        case 4:
            cell!.imageView!.image = UIImage(named: "Calendar")
        case 5:
            cell!.imageView!.image = UIImage(named: "Athletics")
        case 6:
            cell!.imageView!.image = UIImage(named: "College")
        case 7:
            cell!.imageView!.image = UIImage(named: "External")
        default:
            cell!.imageView!.image = nil
        }
        return cell!
    }
}

