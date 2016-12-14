import UIKit

class SportsLevelViewController: UITableViewController, UIWebViewDelegate {
    
    var sportName: String = ""
    
    var levelarray: [String] = []
    var levelName: String = ""
    
    var genderarray: [String] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = sportName
        
        if (tableView.indexPathForSelectedRow != nil) {
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    //Number of rows in table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levelarray.count
    }
    
    //Contents of each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let CellIdentifier: String = "LevelCell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: CellIdentifier) 
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: CellIdentifier)
        }
        cell!.textLabel!.text = levelarray[indexPath.row]
        return cell!
    }
    
    //Handle cell clicks
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        levelName = levelarray[indexPath.row]
    
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "SportsGenderViewController") as! SportsGenderViewController
        
        viewController.sportName = sportName
        viewController.levelName = levelName
        viewController.genderarray = genderarray
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

