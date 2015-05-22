import UIKit

class FacultyViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var selectControl: UISegmentedControl!
    
    
    @IBAction func changeTypeSelected(sender: UISegmentedControl) {
        // TODO: Update table on segment selected
    }
    
    let admins = [
        ("Jennifer Hammond", "Principal"),
        ("Chris Belcher", "Assistant Principal"),
        ("Gary Goetzinger", "Assistant Principal"),
        ("Patricia Poelke", "Assistant Principal"),
        ("Christy Knight", "CSS Student Advisor"),
        ("Jerrod Dohm", "Athletic Director - Assistant Principal")
    ]
    
    let guidance = [
        ("Mrs. Gardner", "O-Z"),
        ("Mr. Hentes", "CSS"),
        ("Mrs. Hall", "9th Grade"),
        ("Mrs. Kernen", "Ge-N"),
        ("Mrs. Mol", "A-Ga"),
        ("Mrs. McCleary", "Secretary East")
    ]
    
    override func viewWillAppear(animated: Bool) {
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
    }
    
    //Number of sections in table
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of rows in table
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return admins.count
    }
    
    //Contents of each cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var (adminName, adminSubtitle) = admins[indexPath.row]
        var (guidanceName, guidanceSubtitle) = guidance[indexPath.row]
        
        let CellIdentifier: String = "FacultyCell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! UITableViewCell?
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: CellIdentifier)
        }
        cell!.textLabel!.text = adminName
        cell!.detailTextLabel!.text = adminSubtitle
        
        return cell!
    }
}

