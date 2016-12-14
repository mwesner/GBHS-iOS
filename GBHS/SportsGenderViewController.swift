import UIKit

class SportsGenderViewController: UITableViewController, UIWebViewDelegate {
    
    var sportName: String = ""
    var levelName: String = ""
    var genderName: String = ""
    
    var genderarray: [String] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = levelName
        
        let backItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        
        if (tableView.indexPathForSelectedRow != nil) {
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    //Number of rows in table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genderarray.count
    }
    
    //Contents of each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let CellIdentifier: String = "GenderCell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: CellIdentifier) 
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: CellIdentifier)
        }
        cell!.textLabel!.text = genderarray[indexPath.row]
        return cell!
    }
    
    //Handle cell clicks
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        genderName = genderarray[indexPath.row]
        
        /*let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("SportsWebViewController") as! SportsWebViewController
        
        viewController.sportName = sportName
        viewController.levelName = levelName
        viewController.genderName = genderName
        
        self.navigationController?.pushViewController(viewController, animated: true)
        */
        
        let date: Date = Date()
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let DateInFormat: String = dateFormatter.string(from: date)
        
        let baseURL = "http://schedules.schedulestar.com/Grand-Blanc-High-School-Grand-Blanc-MI/season"
        
        let fullURL = baseURL + "/" + DateInFormat + "/" + genderName + "/" + levelName + "/" + sportName
        
        let url = fullURL.replacingOccurrences(of: " ", with: "%20")
        
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "MoreViewController") as! MoreViewController
        
        UIApplication.shared.openURL(URL(string: url)!)
        
        delay(0.5) {
            self.navigationController?.pushViewController(viewController, animated: false)
        }
    }
    
    func delay(_ delay: Double, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
            execute: closure
        )
    }
}

