import UIKit

class TimesViewController: UITableViewController {
    
    let fullday = [
        ("1st Hour", "7:20 - 8:19 (59 minutes)"),
        ("2nd Hour", "8:25 - 9:23 (58 minutes)"),
        ("3rd Hour", "9:29 - 10:32 (63 min. with announcements)"),
        ("A Lunch", "10:32 - 11:02 (class starts at 11:08)"),
        ("B Lunch", "11:05 - 11:35 (class starts at 11:38)"),
        ("C Lunch", "11:38 - 12:08"),
        ("4th Hour", "10:38 - 12:08"),
        ("5th Hour", "12:14 - 1:12 (58 minutes)"),
        ("6th Hour", "1:18 - 2:16 (58 minutes)")
    ]
    
    let halfday = [
        ("1st Hour", "7:20 - 7:48 (28 minutes)"),
        ("2nd Hour", "7:54 - 8:22 (28 minutes)"),
        ("3rd Hour", "8:28 - 9:01 (29 minutes)"),
        (" ", "No lunch is served on a half day."),
        ("4th Hour", "9:07 - 9:35 (28 minutes)"),
        ("5th Hour", "9:41 - 10:09 (28 minutes)"),
        ("6th Hour", "10:15 - 10:43 (28 minutes)")
    ]
    
    let latestart = [
        ("1st Hour", "9:40 - 10:11 (31 minutes)"),
        ("2nd Hour", "10:17 - 10:48 (31 minutes)"),
        ("3rd Hour", "10:54 - 11:25 (31 minutes)"),
        ("A Lunch", "11:25 - 11:55 (class starts at 12:01)"),
        ("B Lunch", "11:58 - 12:28 (class starts at 12:31)"),
        ("C Lunch", "12:31 - 1:01"),
        ("4th Hour", "11:31 - 1:01 (60 minutes of class)"),
        ("5th Hour", "1:07 - 1:38 (31 minutes)"),
        ("6th Hour", "1:44 - 2:16 (32 minutes)")
    ]

    
    let fulldaynotice = "There will be a tone at 8:16, 9:20, 10:29, 12:05 and 1:09 to release travelers to their next class. All non-traveling students must remain in class until the official end of the period."
    
    let halfdaynotice = "There will be a tone at 7:45, 8:19, 8:58, 9:32 and 10:06 to release travelers to their next class. All non-traveling students must remain in class until the official end of the period."
    
    let latestartnotice = "There will be a tone at 10:08, 10:45, 11:22, 12:58 and 1:35 to release travelers to their next class. All non-traveling students must remain in class until the official end of the period."
    
    @IBOutlet weak var scheduleType: UISegmentedControl!
    
    @IBOutlet weak var txtNotice: UITextView!
    
    @IBOutlet weak var notice: UITextView!
    @IBAction func changeType(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            txtNotice.text = fulldaynotice
        case 1:
            txtNotice.text = halfdaynotice
        case 2:
            txtNotice.text = latestartnotice
        default:
            txtNotice.text = ""
            
        }
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 44.0 // Replace with your actual estimation
        // Automatic dimensions to tell the table view to use dynamic height
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        tableView.reloadData()
    }
    
    //Number of sections in table
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of rows in table
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch scheduleType.selectedSegmentIndex {
        case 0:
            return fullday.count
        case 1:
            return halfday.count
        case 2:
            return latestart.count
        default:
            return 0
        }
    }
    
    //Contents of each cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var (hour, time) = fullday[indexPath.row]
        switch scheduleType.selectedSegmentIndex {
            case 0:
                (hour, time) = fullday[indexPath.row]
            case 1:
                (hour, time) = halfday[indexPath.row]
            case 2:
                (hour, time) = latestart[indexPath.row]
            default:
                (hour, time) = fullday[indexPath.row]
        }
        
        
        let CellIdentifier: String = "TimesCell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) 
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: CellIdentifier)
        }
        cell!.textLabel!.text = hour
        cell!.detailTextLabel!.text = time
        return cell!
    }
}