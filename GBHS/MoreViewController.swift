import UIKit

class MoreViewController: UITableViewController, UIWebViewDelegate {
    
    @IBOutlet weak var btnAbout: UIBarButtonItem!
    
    @IBOutlet var table: UITableView!
    
    @IBAction func showAbout(_ sender: UIBarButtonItem) {
        
        let title = "Grand Blanc High School"
        let message = "Developed by Grand Blanc CTE.\n\nTeam Leader:\n\nMichael Wesner\nAP Computer Science A instructor\n\n2015 Members:\n\nCorey Rowe\nAaron Goodfellow\n\n2016 Members:\n\nMichael Olmsted\nBradley Kivett\n\n2017 Members:\n\nJordon Trower\nJared\n\nLily Eckman\nIcons provided by Icons8\nhttp://icons8.com"
        let buttontitle = "Close"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: buttontitle, style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
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


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (self.table.indexPathForSelectedRow != nil) {
            self.table.deselectRow(at: self.table.indexPathForSelectedRow!, animated: true)
        }
    }

    //Number of sections in table
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of rows in table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return morelist.count
    }
    
    //Contents of each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let (title, icon) = morelist[indexPath.row]
        
        let CellIdentifier: String = "MoreCell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: CellIdentifier) 
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: CellIdentifier)
        }
        cell!.textLabel!.text = title
        cell!.imageView!.image = UIImage(named: icon)
        return cell!
    }
    
    //Handle cell clicks
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let url = "https://m.facebook.com/GrandBlancHighSchool"
            
            UIApplication.shared.openURL(URL(string: url)!)
            //performSegueWithIdentifier("FacebookSegue", sender: nil)
        case 1:
            let url = "https://login.jupitered.com/login/?73825"
            
            UIApplication.shared.openURL(URL(string: url)!)
            //performSegueWithIdentifier("GradesSegue", sender: nil)
        case 2:
            performSegue(withIdentifier: "MapSegue", sender: nil)
        case 3:
            UIApplication.shared.openURL(URL (string: "http://hs.grandblancschools.org/calendar")!)
        case 4:
            performSegue(withIdentifier: "SportsSegue", sender: nil)
        case 5:
            performSegue(withIdentifier: "CollegeSegue", sender: nil)
        case 6:
            performSegue(withIdentifier: "ExternalSegue", sender: nil)
        default:
            print("No segue for row \(indexPath.row)", terminator: "")
        }
    }
}

