import UIKit

class SportsViewController: UITableViewController, UIWebViewDelegate {
    
    var sport: Int = 0;
    var level: Int = 0;
    var gender: Int = 0;
    
    //(Sport name, icon name)
    let sportslist = [
        ("Baseball", "Baseball"),
        ("Basketball", "Basketball"),
        ("Bowling", "Bowling"),
        ("Cheerleading", "Cheer"),
        ("Cross Country", "Running"),
        ("Football", "Sport"),
        ("Golf", "Golf"),
        ("Ice Hockey", "Hockey"),
        ("Lacrosse", "Lacrosse"),
        ("Skiing", "Skiing"),
        ("Soccer", "Soccer"),
        ("Softball", "Baseball"),
        ("Swim and Dive", "Swimming"),
        ("Tennis", "Tennis"),
        ("Track", "Running"),
        ("Volleyball", "Volleyball"),
        ("Water Polo", "Swimming"),
        ("Wrestling", "Wrestling")
    ]
    
    //Level is 1
    let all = [
        "Varsity",
        "Junior Varsity",
        "Freshman"
    ]
    
    //Level is 2
    let varsity = [
        "Varsity"
    ]
    
    //Level is 3
    let jv = [
        "Varsity",
        "Junior Varsity"
    ]
    
    //Gender is 1
    let allgenders = [
        "Boys",
        "Girls",
        "Boys and Girls"
    ]
    
    //Gender is 2
    let boys = [
        "Boys"
    ]
    
    
    //Gender is 3
    let girls = [
        "Girls"
    ]
    
    //Gender is 4
    let boysgirls = [
        "Boys",
        "Girls"]
    
    //Gender is 5
    let combined = [
        "Boys and Girls"
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (tableView.indexPathForSelectedRow != nil) {
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    //Number of rows in table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sportslist.count
    }
    
    //Contents of each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let (name, icon) = sportslist[indexPath.row]
        
        let CellIdentifier: String = "SportsCell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: CellIdentifier) 
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: CellIdentifier)
        }
        cell!.textLabel!.text = name
        cell!.imageView!.image = UIImage(named: icon)
    
        return cell!
    }
    
    //Handle cell clicks
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch (indexPath.row) {
            case 0: //Baseball: All levels, Boys
                setLevelAll()
                setBoys()
            case 1: //Basketball: All levels, Boys, Girls
                setLevelAll()
                setBoysGirls()
            case 2: //Bowling: Varsity, Combined
                setVarsity()
                setCombined()
            case 3: //Cheerleading: All levels, Girls
                setLevelAll()
                setGirls()
            case 4: //Cross Country: Varsity, all genders
                setVarsity()
                setGenderAll()
            case 5: //Football: All levels, Boys
                setLevelAll()
                setBoys()
            case 6: //Golf: Varsity and JV, Boys, Girls
                setJuniorVarsity()
                setBoysGirls()
            case 7: //Ice Hockey: Varsity, Boys
                setVarsity()
                setBoys()
            case 8: //Lacrosse: Varsity and JV, Boys, Girls
                setJuniorVarsity()
                setBoysGirls()
            case 9: //Skiing: Varsity and JV, Combined
                setJuniorVarsity()
                setCombined()
            case 10: //Soccer: All levels, Boys, Girls
                setLevelAll()
                setBoysGirls()
            case 11: //Softball: All levels, Girls
                setLevelAll()
                setGirls()
            case 12: //Swim and Dive: Varsity, Boys, Girls
                setVarsity()
                setBoysGirls()
            case 13: //Tennis: Varsity, JV, Boys, Girls
                setJuniorVarsity()
                setBoysGirls()
            case 14: //Track: Varsity, Boys, Girls
                setVarsity()
                setBoysGirls()
            case 15: //Volleyball: All levels, Girls
                setLevelAll()
                setGirls()
            case 16: //Water Polo: Varsity, JV, Boys, Girls
                setJuniorVarsity()
                setBoysGirls()
            case 17: //Wrestling: Varsity, JV, Boys
                setJuniorVarsity()
                setBoys()
            default:
                print("Error selecting sport", terminator: "")
        }
    
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "SportsLevelViewController") as! SportsLevelViewController
        
        if (level == 1) {
            viewController.levelarray = all
        }else if (level == 2) {
            viewController.levelarray = varsity
        }else if (level == 3) {
            viewController.levelarray = jv
        }
        
        if (gender == 1) {
            viewController.genderarray = allgenders
        }else if (gender == 2) {
            viewController.genderarray = boys
        }else if (gender == 3) {
            viewController.genderarray = girls
        }else if (gender == 4) {
            viewController.genderarray = boysgirls
        }else if (gender == 5) {
            viewController.genderarray = combined
        }
        
        let (name, _) = sportslist[indexPath.row]
        
        viewController.sportName = name
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func setLevelAll() {
        level = 1
    }
    
    func setVarsity() {
        level = 2
    }
    
    func setJuniorVarsity() {
        level = 3
    }
    
    func setGenderAll() {
        gender = 1
    }
    
    func setBoys() {
        gender = 2
    }
    
    func setGirls() {
        gender = 3
    }
    
    func setBoysGirls() {
        gender = 4
    }
    
    func setCombined() {
        gender = 5
    }
}

