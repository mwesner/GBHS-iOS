import UIKit

class MoreViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate, UIWebViewDelegate {
    
    var alertControllerAvailable = false
    
    @IBOutlet weak var btnAbout: UIBarButtonItem!
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet var table: UITableView!
    
    @IBAction func showAbout(sender: UIBarButtonItem) {
        
        let title = "Grand Blanc High School"
        let message = "Developed by Grand Blanc CTE.\n\nTeam Leader:\n\nMichael Wesner\nAP Computer Science A instructor\n\n2015 members:\n\nCorey Rowe\nAaron Goodfellow\n\nIcons provided by Icons8\nhttp://icons8.com"
        let buttontitle = "Close"
        
        if alertControllerAvailable {
            //UIAlertController for iOS 8 +
            var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: buttontitle, style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            //UIAlertView for iOS 7
            let alert = UIAlertView()
            alert.title = title
            alert.message = message
            alert.addButtonWithTitle(buttontitle)
            alert.show()
        }
    }
    
    let morelist = [
    "GBHS Facebook",
    "Check Grades",
    "Campus Map",
    "Event Calendar",
    "Sports Schedule",
    "Early College",
    "External Links"]
    
    let imagelist = [
    "Facebook",
    "Grades",
    "Map",
    "Calendar",
    "Athletics",
    "College",
    "External"]


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title="More"
        
        if (self.table.indexPathForSelectedRow() != nil) {
            self.table.deselectRowAtIndexPath(self.table.indexPathForSelectedRow()!, animated: true)
        }
        
        if (objc_getClass("UIAlertController") != nil) {
            //UIAlertController for iOS 8 +
            alertControllerAvailable = true
        }else{
            //UIAlertView for iOS 7
            alertControllerAvailable = false
        }
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
        case 0:
            performSegueWithIdentifier("FacebookSegue", sender: nil)
        case 1:
            performSegueWithIdentifier("GradesSegue", sender: nil)
        case 2:
            performSegueWithIdentifier("MapSegue", sender: nil)
        case 3:
            performSegueWithIdentifier("CalendarSegue", sender: nil)
        case 5:
            performSegueWithIdentifier("CollegeSegue", sender: nil)
        case 6:
            performSegueWithIdentifier("ExternalSegue", sender: nil)
        default:
            println("No segue for row \(indexPath.row)")
        }
    }
}

