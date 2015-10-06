import UIKit

class MoreViewController: UITableViewController, UIWebViewDelegate {
    
    @IBOutlet weak var btnAbout: UIBarButtonItem!
    
    @IBOutlet var table: UITableView!
    
    @IBAction func showAbout(sender: UIBarButtonItem) {
        
        let title = "Grand Blanc High School"
        let message = "Developed by Grand Blanc CTE.\n\nTeam Leader:\n\nMichael Wesner\nAP Computer Science A instructor\n\n2015 members:\n\nCorey Rowe\nAaron Goodfellow\n\nIcons provided by Icons8\nhttp://icons8.com"
        let buttontitle = "Close"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: buttontitle, style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    //(Title, icon)
    let morelist = [
        ("GBHS Facebook", "Facebook"),
        ("Check Grades", "Grades"),
        ("Campus Map", "Map"),
        ("Subscribe to Calendar", "Calendar"),
        ("Sports Schedule", "Sport"),
        ("Early College", "College"),
        ("External Links", "External")
    ]


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if (self.table.indexPathForSelectedRow != nil) {
            self.table.deselectRowAtIndexPath(self.table.indexPathForSelectedRow!, animated: true)
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
        let (title, icon) = morelist[indexPath.row]
        
        let CellIdentifier: String = "MoreCell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) 
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifier)
        }
        cell!.textLabel!.text = title
        cell!.imageView!.image = UIImage(named: icon)
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
            UIApplication.sharedApplication().openURL(NSURL (string: "http://grandblanc.high.schoolfusion.us/modules/calendar/exportICal.php")!)
        case 4:
            performSegueWithIdentifier("SportsSegue", sender: nil)
        case 5:
            performSegueWithIdentifier("CollegeSegue", sender: nil)
        case 6:
            performSegueWithIdentifier("ExternalSegue", sender: nil)
        default:
            print("No segue for row \(indexPath.row)", terminator: "")
        }
    }
}

