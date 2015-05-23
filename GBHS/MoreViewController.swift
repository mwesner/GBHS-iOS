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
    
    let imagelist = [
    "Clock",
    "Facebook",
    "Grades",
    "Map",
    "Calendar",
    "Athletics",
    "College",
    "External"]


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
        var imageitem = imagelist[indexPath.row]
        
        let CellIdentifier: String = "MoreCell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! UITableViewCell?
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifier)
        }
        cell!.textLabel!.text = moreitem
        cell!.imageView!.image = UIImage(named: imageitem)
        return cell!
    }
    
    //Handle cell clicks
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 2:
            UIApplication.sharedApplication().openURL(NSURL(string: "https://studentvue.geneseeisd.org/GBCS/Login_Student_PXP.aspx")!)
        case 3:
            performSegueWithIdentifier("MapSegue", sender: nil)
        case 8:
            UIApplication.sharedApplication().openURL(NSURL(string: "http://grandblanc.high.schoolfusion.us")!)
        default:
            var alert = UIAlertController(title: "Table entry selected", message: "\(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
}

