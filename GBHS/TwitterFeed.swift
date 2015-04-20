import UIKit

class TwitterFeed: UITableViewController, UITableViewDataSource,
    UITableViewDelegate {
    
    //One section in table
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Twenty rows in table
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    //Set the table contents
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = "[Tweet]"
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        //Set navigation controller to "Twitter Blue"
        navigationController!.navigationBar.barTintColor = UIColor(red: 85.0/255.0, green: 172.0/255.0, blue: 238.0/255.0, alpha: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "GBHS Twitter"
    }
}
