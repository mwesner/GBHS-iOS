import UIKit

class SportsViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate, UIWebViewDelegate {
    
    let sports = [
        ("Baseball"),
        ("Basketball"),
        ("Bowling"),
        ("Cheerleading"),
        ("Cross Country"),
        ("Football"),
        ("Golf"),
        ("Ice Hockey"),
        ("Lacrosse"),
        ("Skiing"),
        ("Soccer"),
        ("Softball"),
        ("Swim and Dive"),
        ("Tennis"),
        ("Track"),
        ("Volleyball"),
        ("Water Polo"),
        ("Wrestling")
    ]
    
    let icons = [
        ("Baseball"),
        ("Basketball"),
        ("Bowling"),
        ("Cheer"),
        ("Running"),
        ("Sports"),
        ("Golf"),
        ("Hockey"),
        ("Hockey"),
        ("Skiing"),
        ("Soccer"),
        ("Baseball"),
        ("Swimming"),
        ("Tennis"),
        ("Running"),
        ("Volleyball"),
        ("Swimming"),
        ("Wrestling")
    ]
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Sports Schedule"
        
        if (tableView.indexPathForSelectedRow() != nil) {
            tableView.deselectRowAtIndexPath(tableView.indexPathForSelectedRow()!, animated: true)
        }
    }
    
    //Number of rows in table
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sports.count
    }
    
    //Contents of each cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let CellIdentifier: String = "SportsCell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! UITableViewCell?
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifier)
        }
        cell!.textLabel!.text = sports[indexPath.row]
        cell!.imageView!.image = UIImage(named: icons[indexPath.row])
        return cell!
    }
    
    //Handle cell clicks
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(sports[indexPath.row])
    }
}

