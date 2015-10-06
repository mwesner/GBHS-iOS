import UIKit

class SportsLevelViewController: UITableViewController, UIWebViewDelegate {
    
    var sportName: String = ""
    
    var levelarray: [String] = []
    var levelName: String = ""
    
    var genderarray: [String] = []
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = sportName
        
        if (tableView.indexPathForSelectedRow != nil) {
            tableView.deselectRowAtIndexPath(tableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    //Number of rows in table
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levelarray.count
    }
    
    //Contents of each cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let CellIdentifier: String = "LevelCell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) 
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifier)
        }
        cell!.textLabel!.text = levelarray[indexPath.row]
        return cell!
    }
    
    //Handle cell clicks
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        levelName = levelarray[indexPath.row]
    
        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("SportsGenderViewController") as! SportsGenderViewController
        
        viewController.sportName = sportName
        viewController.levelName = levelName
        viewController.genderarray = genderarray
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

