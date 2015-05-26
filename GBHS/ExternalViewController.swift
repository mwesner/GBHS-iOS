import UIKit

class ExternalViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var selectControl: UISegmentedControl!
    
    @IBOutlet var table: UITableView!
    
    @IBAction func changeTypeSelected(sender: UISegmentedControl) {
        // TODO: Update table on segment selected
    }
    
    let external = [
        ("GBHS Facebook", "facebook.com/GrandBlancHighSchool"),
        ("GBHS Twitter", "twitter.com/GrandBlancPride"),
        ("Athletics", "grandblanc.high.schoolfusion.us/overview/athletics.phtml"),
        ("Club Listing", "grandblanc.high.schoolfusion.us/overview/clubs.phtml"),
        ("BAC/ACC", "gbhsaccprocess.weebly.com"),
        ("Bobcat Banner", "bobcatbanner.com"),
        ("Career Resource Center", "crc.grandblanc.career.schoolfusion.us"),
        ("Career & Technical Education", "grandblanc.career.schoolfusion.us"),
        ("Center for Student Success", "css.grandblanc.high.schoolfusion.us"),
        ("Instrumental Music Department", "gbhsinstrumentalmusicdepartment.weebly.com"),
        ("Library", "gbhlib.weebly.com"),
        ("Newsletter", "smore.com/u/peggywray"),
        ("National Honor Society", "gbhsnhs.com"),
        ("Grand Blanc Powerlifting", "sites.google.com/a/grandblancschools.org/grand-blanc-powerlifting/home"),
        ("Yearbook", "gbyearbook.com")
    ]
        

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        self.title = "External Links"
        
        
        if (self.table.indexPathForSelectedRow() != nil) {
            self.table.deselectRowAtIndexPath(self.table.indexPathForSelectedRow()!, animated: true)
        }
    }
    
    //override func viewWillDisappear(animated: Bool) {
       // <#code#>
    //}
    
    //Number of sections in table
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of rows in table
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return external.count
    }
    
    //Contents of each cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var (title, link) = external[indexPath.row]
        
        let CellIdentifier: String = "ExternalCell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! UITableViewCell?
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: CellIdentifier)
        }
        cell!.textLabel!.text = title
        cell!.detailTextLabel!.text = link
        
        return cell!
    }
    
    //Open the selected link
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var (title, link) = external[indexPath.item]
        UIApplication.sharedApplication().openURL(NSURL(string: "http://" + link)!)
        println(link)
    }
}

