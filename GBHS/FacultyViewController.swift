import UIKit

class FacultyViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var selectControl: UISegmentedControl!
    
    
    @IBAction func changeTypeSelected(sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    let admins = [
        ("Jennifer Hammond", "Principal", "admin_hammond"),
        ("Chris Belcher", "Assistant Principal", "admin_belcher"),
        ("Gary Goetzinger", "Assistant Principal", "admin_gz"),
        ("Patricia Poelke", "Assistant Principal", "admin_poelke"),
        ("Christy Knight", "CSS Student Advisor", "admin_knight"),
        ("Jerrod Dohm", "Athletic Director - Assistant Principal", "admin_dohm")
    ]
    
    let guidance = [
        ("Mrs. Gardner", "O-Z", "guidance_gardner"),
        ("Mr. Hentes", "CSS", "guidance_hentes"),
        ("Mrs. Hall", "9th Grade", "guidance_hall"),
        ("Mrs. Kernen", "Ge-N", "guidance_kernen"),
        ("Mrs. Mol", "A-Ga", "guidance_mol"),
        ("Mrs. McCleary", "Secretary East", "guidance_mccleary")
    ]
    
    let staff = [
        "Allswede, Stacey",
        "Anderson, Katelyn",
        "Applebee, Stephen",
        "Arakelyan, Natalya",
        "Arbit, Michael",
        "Babiasz, Todd",
        "Bailey, Brad",
        "Baker, Tami",
        "Barker, Steven",
        "Barnes, Kim",
        "Barnowsky, Nicholas",
        "Bas, Adriana",
        "Bauermeister, Marie",
        "Belcher, Chris",
        "Belill-Lemke, Valerie",
        "Benaway, Karen",
        "Bieda, Sara",
        "Blackett, Patricia",
        "Blakley, Sarah",
        "Blake, Justin",
        "Bleicher, Dana",
        "Botzki, Denise",
        "Bradley, Zachary",
        "Briggs, Tisha",
        "Brunskole, Lori",
        "Bujalski, Courtney",
        "Butzu, Ava",
        "Calo, Ron",
        "Carmody, Charlie",
        "Carney, Chad",
        "Church, Katie",
        "Clark, Daniel",
        "Clark, Matthew",
        "Clement, David",
        "Coffman, Ryan",
        "Cottrill, Amy",
        "Cozad, Colleen",
        "Cuccia, Linda",
        "Davis, Marcia",
        "Delaney, Joseph",
        "Doering, Meagan",
        "Dohm, Jerrod",
        "Dolzynski, Mary",
        "Dunk, Steven",
        "Dunning, Amy",
        "Eickholt, Kiersten",
        "Elias, Elizabeth",
        "Finkbeiner, Jacob",
        "Franzel, Mary",
        "Funsch, Leo",
        "Gardner, Mary",
        "Garey, Stephanie",
        "Gaudet, Karen",
        "Gauthier, Marcia",
        "Gibbs-Halm, Deborah",
        "Giddings, Tonya",
        "Goetzinger, Debbie",
        "Goetzinger, Gary",
        "Gottlieb, Jennifer",
        "Gowdy, Larhonda",
        "Graves, Megan",
        "Green, Al",
        "Grzymkowski, Heather",
        "Gualdoni, Laura",
        "Guerra, Amy",
        "Hahn, Kolette",
        "Hall, Pamela",
        "Hammond, Jennifer",
        "Harr-Smith, Lindsey",
        "Hassenzahl, Beth",
        "Heemsoth, Miranda",
        "Hentes, John",
        "Holt, Denny",
        "Howell, Kathleen",
        "Hubbs, Laura",
        "Hugo, Brian",
        "Hugo, Matt",
        "Hutchison, Cory",
        "Jacobson, Amy",
        "Johnson, Amy",
        "Johnson, Sarah",
        "Kehn, Bonnie",
        "Keilitz, Kevin",
        "Kenney, Rachel",
        "Kernen, Nicole",
        "King, Irving",
        "Kish, Kaitlyn",
        "Knapp, Don",
        "Knight, Christy",
        "Kufuor, Justin",
        "Larose, Michael",
        "Lawrence, Jenalyn",
        "Lemaster, Thomas",
        "Li, Snow",
        "Londrigan, Aimee",
        "Lund, Elizabeth",
        "Lundy, Andrea",
        "Mareski, Shannon",
        "Mather, Brenda",
        "McCleary, Linda",
        "Melton, Hunter",
        "Melton, Marcie",
        "Messimer, Megan",
        "Meyer, Lindsay",
        "Mitchell, Jeremy",
        "Mol, Phyllis",
        "Moore, Karen",
        "Moore, Patrick",
        "Morris, Krista",
        "Newman, Maureen",
        "Newton, Dana",
        "Nicholson, James",
        "O'Toole, Lia",
        "Orange, Adam",
        "Ousnamer, Karen",
        "Padgett, David",
        "Paris, Michael",
        "Pearce, Jill",
        "Pearce, Matt",
        "Pendergrass, Erik",
        "Peske, Nancy",
        "Piggott, Sally",
        "Poelke, Trish",
        "Popadich, Nick",
        "Pottenger, Troy",
        "Powers, Suzanne",
        "Raab, Lisa",
        "Ralbusky, Elizabeth",
        "Read, Rachel",
        "Reed, Adam",
        "Retberg, Daniel",
        "Riek, Kathleen",
        "Riek, Nate",
        "Roberts, Janet",
        "Robertson, Joan",
        "Roth, Alyssa",
        "Russian, Tanya",
        "Ryckaert, Justin",
        "Saffron, Danida",
        "Salem, John",
        "Schramm, Chuck",
        "Schweitzer, Amy",
        "Shaver, Dana",
        "Shinabarger, Lucy",
        "Shuster, Michael",
        "Smith, Gary",
        "Stockton, Sarah",
        "Stockton, Susan",
        "Stuck, James",
        "Tackaberry, Robert",
        "Tait, Rachael",
        "Taneyhill, Maryalice",
        "Taylor, Justin",
        "Thurlow, Leslie",
        "Tosh, Karin",
        "Trombly, Craig",
        "Urbanik, Phil",
        "Vanitvelt, Marcie",
        "Walroth, Allyson",
        "Wesner, Michael",
        "Wheeler, JD",
        "Willing, Heather",
        "Wilson, Jessica",
        "Wiltse, Wesley",
        "Wray, Peggy",
        "Wyatt, Mary",
        "Yelland, Paula",
        "Youngs, Jason",
        "Yunker, Karen",
        "Zacek, Tom"
    ]
    
    override func viewWillAppear(animated: Bool) {
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
    }
    
    //Number of sections in table
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of rows in table
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectControl.selectedSegmentIndex {
        case 0:
            return staff.count
        case 1:
            return guidance.count
        case 2:
            return admins.count
        default:
            return 0
        }
    }
    
    //Contents of each cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var staffcell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("StaffCell") as! UITableViewCell?
        
        var officecell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("OfficeCell") as! UITableViewCell?
        
        if staffcell == nil {
            staffcell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "StaffCell")
        }
        
        if officecell == nil {
            officecell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "OfficeCell")
        }
        
        switch selectControl.selectedSegmentIndex {
        case 0:
              
            var staffName = staff[indexPath.row]
            staffcell!.textLabel!.text = staffName
            staffcell!.detailTextLabel!.text = " "
            
            return staffcell!
        case 1:
            
            var (guidanceName, guidanceSubtitle, guidanceImage) = guidance[indexPath.row]
            officecell!.textLabel!.text = guidanceName
            officecell!.detailTextLabel!.text = guidanceSubtitle
            officecell!.imageView!.image = UIImage(named: guidanceImage)
            
            return officecell!
        case 2:
            
            var (adminName, adminSubtitle, adminImage) = admins[indexPath.row]
            officecell!.textLabel!.text = adminName
            officecell!.detailTextLabel!.text = adminSubtitle
            officecell!.imageView!.image = UIImage(named: adminImage)
            
            return officecell!
            
        default:
            return staffcell!
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("OfficeSegue", sender: nil)
    }
}

