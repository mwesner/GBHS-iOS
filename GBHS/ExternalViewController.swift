import UIKit

class ExternalViewController: UITableViewController {
    
    @IBOutlet weak var selectControl: UISegmentedControl!
    
    @IBOutlet var table: UITableView!
    
    @IBAction func changeTypeSelected(sender: UISegmentedControl) {
        // TODO: Update table on segment selected
    }
    
    let external = [
        ("GBHS Facebook", "facebook.com/GrandBlancHighSchool"),
        ("GBHS Twitter", "twitter.com/GrandBlancPride"),
        ("Athletics", "hs.grandblancschools.org/athletics-ba07d344"),
        ("Club Listing", "grandblanc.high.schoolfusion.us/overview/clubs.phtml"),
        ("BAC/ACC", "gbhsaccprocess.weebly.com"),
        ("Bobcat Banner", "bobcatbanner.com"),
        ("Career Resource Center", "http://hs.grandblancschools.org/career-resource-center-7bca3d90"),
        ("Career & Technical Education", "http://www.grandblancschools.org/career-and-technical-education-6992c6f5"),
        ("Center for Student Success", "http://gbhscss.weebly.com/about.html"),
        ("Instrumental Music Department", "gbhsinstrumentalmusicdepartment.weebly.com"),
        ("Library", "gbhlib.weebly.com"),
        ("Newsletter", "smore.com/u/peggywray"),
        ("National Honor Society", "gbhsnhs.com"),
        ("Grand Blanc Powerlifting", "sites.google.com/a/grandblancschools.org/grand-blanc-powerlifting/home"),
        ("Yearbook", "gbyearbook.com")
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
        return external.count
    }
    
    //Contents of each cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let (title, link) = external[indexPath.row]
        
        let CellIdentifier: String = "ExternalCell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) 
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: CellIdentifier)
        }
        cell!.textLabel!.text = title
        cell!.detailTextLabel!.text = link
        
        return cell!
    }
    
    //Open the selected link
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let (_, link) = external[indexPath.item]
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        //Used to determine if the link should use https
        switch indexPath.item {
        case 2, 3, 7, 8, 12, 14:
            UIApplication.sharedApplication().openURL(NSURL(string: "http://" + link)!)
            break;
        default:
            UIApplication.sharedApplication().openURL(NSURL(string: "https://" + link)!)
            break;
        }
    }
}

