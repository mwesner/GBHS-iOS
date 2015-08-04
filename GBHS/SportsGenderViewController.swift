import UIKit

class SportsGenderViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate, UIWebViewDelegate {
    
    var sportName: String = ""
    var levelName: String = ""
    var genderName: String = ""
    
    var genderarray: [String] = []
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = levelName
        
        let backItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        
        println(genderName)
        
        if (tableView.indexPathForSelectedRow() != nil) {
            tableView.deselectRowAtIndexPath(tableView.indexPathForSelectedRow()!, animated: true)
        }
    }
    
    //Number of rows in table
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genderarray.count
    }
    
    //Contents of each cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let CellIdentifier: String = "GenderCell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! UITableViewCell?
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifier)
        }
        cell!.textLabel!.text = genderarray[indexPath.row]
        return cell!
    }
    
    //Handle cell clicks
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        genderName = genderarray[indexPath.row]
        
        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("SportsWebViewController") as! SportsWebViewController
        
        viewController.sportName = sportName
        viewController.levelName = levelName
        viewController.genderName = genderName
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
}

