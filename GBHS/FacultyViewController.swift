import UIKit
import MessageUI

class FacultyViewController: UITableViewController, MFMailComposeViewControllerDelegate  {
    
    var index: Int?
    
    @IBOutlet weak var selectControl: UISegmentedControl!
    
    @IBAction func changeTypeSelected(sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    let admins = [
        ("Jennifer Hammond", "Principal", "admin_hammond"),
        ("Chris Belcher", "Assistant Principal", "admin_belcher"),
        ("Gary Goetzinger", "Assistant Principal", "admin_gz"),
        ("Patricia Poelke", "Assistant Principal", "admin_poelke"),
        ("Jeremy Mitchell", "Student Advisor", "admin_mitchell"),
        ("Jerrod Dohm", "Athletic Director-Asst. Principal", "admin_dohm")
    ]
    
    let guidance = [
        ("Mary Gardner", "O-Z", "guidance_gardner"),
        ("John Hentes", "CSS", "guidance_hentes"),
        ("Pamela Hall", "9th Grade", "guidance_hall"),
        ("Nicole Kernen", "Ge-N", "guidance_kernen"),
        ("Phyllis Mol", "A-Ga", "guidance_mol"),
        ("Courtney Wood", "Counselor Asst.", "guidance_wood"),
        ("Kari Lynn Clark", "Secretary", "guidance_clark")
    ]
    
    let staff = [
        "Allswede, Stephen",
        "Applebee, Natalya",
        "Arakelyan, Todd",
        "Babiasz, Brad",
        "Bailey, Tami",
        "Baker, Steven",
        "Barker, Kimberly",
        "Barnes, Nicholas",
        "Barnowsky, Adriana",
        "Bas, Marie",
        "Bauermeister, Valerie",
        "Belill, Karen",
        "Benaway, Sara",
        "Bieda, Patricia",
        "Blackett, Justin",
        "Blake, Sarah",
        "Blakley, Dana",
        "Bleicher, Denise",
        "Botzki, Jade",
        "Bowhall, Zachary",
        "Bradley, Tisha",
        "Briggs, Amanda",
        "Bruin, Lori",
        "Brunskole, Ava",
        "Butzu, Nina",
        "Buxbaum, Ronald",
        "Calo, Charlie",
        "Carmody, Chad",
        "Carney, Katie",
        "Church, Daniel",
        "Clark, Kari",
        "Clark, Matthew",
        "Clark, David",
        "Clement, Ryan",
        "Coffman, Robert",
        "Coon, Amy",
        "Cottrill, Colleen",
        "Cozad, Linda",
        "Cuccia, Jeffrey",
        "Cushman, Marcia",
        "Davis, Jennifer",
        "DeArmond, Cynthia",
        "Decker, Joseph",
        "Delaney, Meagan",
        "Doering, Jerrod",
        "Dohm, Steven",
        "Dunk, Amy",
        "Dunning, Nicholas",
        "Ejak, Elizabeth",
        "Elias, Nicholas",
        "Ender, Lee",
        "Evans, Dave",
        "Fox, Mary",
        "Franzel, Kaylinda",
        "Fritzsching, Mary",
        "Gardner, Kolette",
        "Garey, Karen",
        "Gaudet, Deborah",
        "Gibbs-Halm, Tonya",
        "Giddings, Larry",
        "Glosch, Gary",
        "Goetzinger, Caleb",
        "Goncz, Megan",
        "Graves, Alan",
        "Green, Heather",
        "Grzymkowski, Laura",
        "Gualdoni,, LMSW",
        "Amy, Guerra",
        "Nate, Guigear",
        "Pamela, Hall",
        "Jennifer, Hammond",
        "Beth, Hassenzahl",
        "John, Hentes",
        "Craig, Histed",
        "Denny, Holt",
        "Kathleen, Howell",
        "Laura, Hubbs",
        "Tiffany, Huff",
        "Brian, Hugo",
        "Matthew, Hugo",
        "Corbin, Hutchison",
        "Lori, Jackson",
        "Amy, Jacobson",
        "James, Jarou",
        "Ashley, Jeffers",
        "Amy, Johnson",
        "Sarah, Johnson",
        "Jared, Jonas",
        "Bonnie, Kehn",
        "Kevin, Keilitz",
        "Rachel, Kenney",
        "Nicole, Kernen",
        "Meghann, Kildee",
        "Katie, Kimball",
        "Irving, King",
        "Kaitlyn, Kish",
        "Donald, Knapp",
        "Michael, Larose",
        "Jenalyn, Lawrence",
        "Thomas, Lemaster",
        "Snow, li",
        "Aimee, Londrigan",
        "Andrea, Lundy",
        "Scott, Lunn",
        "Matthew, Mageli",
        "Shannon, Mareski",
        "Brenda, Mather",
        "Lyniece, McNair-Levi",
        "Marcie, Melton",
        "Lindsay, Meyer",
        "Phyllis, Mol",
        "Karen, Moore",
        "Patrick, Moore",
        "Krista, Morris",
        "Tina, Mueller",
        "Maureen, Newman",
        "James, Nicholson",
        "Danielle, Otero",
        "Lia, O'Toole",
        "Karen, Ousnamer",
        "Emily, Overmyer",
        "David, Padgett",
        "Michael, Paris",
        "Lindsay, Parish",
        "Matthew, Pearce",
        "Erik, Pendergrass",
        "Sally, Piggott",
        "Nicholas, Popadich",
        "Troy, Pottenger",
        "Suzanne, Powers",
        "Lisa, Raab",
        "Jeffrey, Ragland",
        "Elizabeth, Ralbusky",
        "Rachel, Read",
        "Adam, Reed",
        "Kathleen, Riek",
        "Nathan, Riek",
        "Janet, Roberts",
        "Joan, Robertson",
        "Tanya, Russian",
        "Danida, Saffron",
        "John, Salem",
        "Charles, Schramm",
        "Shannon, Schwegler",
        "Amy, Schweitzer",
        "Sarah, Scott",
        "Autumn, Sellers",
        "Becky, Sharkey",
        "Dana, Shaver",
        "Susan, Shaw",
        "Bodhi, Shebak",
        "Michael, Shuster",
        "Gary, Smith",
        "Sarah, Stockton",
        "Susan, Stockton",
        "Rebecca, Stormer",
        "James, Stuck",
        "Rachael, Tait",
        "Daniel, Taneyhill",
        "Kristen, Tanner",
        "Justin, Taylor",
        "Sarah, Thamm",
        "Leslie, Thurlow",
        "Scott, Thurlow",
        "Phillip, Urbanik",
        "Marcie, Vanitvelt",
        "Kendra, Vanover",
        "Allyson, Walroth",
        "Cody, Wangler",
        "Jennifer, Webb",
        "Michael, Wesner",
        "Lamanzer, Williams",
        "Heather, Willing",
        "Jessica, Wilson",
        "Wesley, Wiltse",
        "Peggy, Wray",
        "Jason, Youngs",
        "Karen, Yunker",
        "Thomas, Zacek"    ]
    
    let guidanceEmail = [
        "mgardner@grandblancschools.org",
        "jhentes@grandblancschools.org",
        "phall@grandblancschools.org",
        "nkernen@grandblancschools.org",
        "pmol@grandblancschools.org",
        "cwood@grandblancschools.org",
        "kclark@grandblancschools.org"
    ]
    
    let guidancePhone = [
        "810-591-6652",
        "810-591-6651",
        "810-591-6649",
        "810-591-6651",
        "810-591-6648",
        "810-591-6680",
        "810-591-6647"
    ]
    
    let adminEmail = [
        "jhammond@grandblancschools.org",
        "cbelcher@grandblancschools.org",
        "ggoetzin@grandblancschools.org",
        "tpoelke@grandblancschools.org",
        "jmitchel@grandblancschools.org",
        "jdohm@grandblancschools.org"
    ]
    
    let adminPhone = [
        "810-591-6637",
        "810-591-6659",
        "810-591-6645",
        "810-591-6353",
        "810-591-6644",
        "810-591-4301",
    ]
    
    let adminBio = [
    
        "As the principal of Grand Blanc High School, my responsibilities include supervising the overall building operations, overseeing curriculum development and improvement, evaluating and monitoring instructional staff by visiting classrooms on a daily basis, planning and executing professional development for staff, monitoring the building budget, developing and implementing the school improvement plan, overseeing the high school testing program, and supervising the career and technical education department. What I love most about my position is being around our students and staff. With a large campus, it is often difficult to get to know individual students but I visit classrooms regularly and enjoy seeing them learning, collaborating, and building relationships with their teachers and one another. \n\nI began my career in education over 20 years ago as a high school math teacher in Houston, Texas. I also taught middle school and high school math in Hamtramck and at Troy Athens High School. I served as an assistant principal at Troy High School for eight years prior to coming to Grand Blanc. My educational experiences include a bachelor\'s degree from Michigan State University, a master\'s degree from Wayne State University and an education specialist degree and doctorate of philosophy degree from Oakland University.",
    
        "After serving Grand Blanc High School for ten years as a World History teacher and basketball coach I moved into administration.  The experiences I have had in the classroom and on the athletic field here at GBHS have helped mold me into the person and leader I am today. \n\nI am a proud graduate of Oakland University, where I received my Bachelors, Masters and Education Specialist degrees in education and leadership. My coursework has given me invaluable experiences in building curriculum, working with state standards, public speaking and school leadership––all skills and tools that I use daily as an AP. For the 2015–2016 school year, I will be responsible for students in grades 9–12 whose last names begin with O-Z but am always available to any student. I am looking forward to another great year here at GBHS and continue to believe we have one of the best high schools in the state of Michigan, and we should all be very proud to be bobcats!",
    
        "Beginning my 15th year as assistant principal at GBHS, I have a broad background in public school administration as a school administrator for twenty-nine years including most areas of K-12 education and community college, as well as a five-year private business experience as an educational consultant. I have had the opportunity to be a teacher, coach, assistant principal, principal, athletic director, community education director, technology director, and school consultant. I have earned a Bachelor Degree from Alma College and a Masters Degree from Central Michigan University.\n\nDuring my tenure at GBHS, I have demonstrated the ability to be an effective educational leader in the areas of student achievement, strategic planning, school improvement, student attendance and behavior, staff development, and community/parent involvement. I build strong relationships with staff, students and parents. I am truly committed to the success of all students.",
    
        "I am excited to start my third year at Grand Blanc High School.  I am a native of Southern California where I taught middle school social studies, worked with at–risk youth as a Title I Coordinator, and was a high school assistant principal. This community has been an amazing place to work and be a part of. I am always proud to say I serve the Grand Blanc Community.\n\nMy responsibilities for the 2015–2016 school year include attendance contracts, student discipline, class schedules, and supervision of instruction and counseling. Please feel free to call me whenever you have a question or concern. We are all here to help our students grow academically, emotionally, and professionally. I am looking forward to another great year at GBHS. Go Bobcats!",
    
        "As the high school student adviser, I am responsible for promoting a positive school culture and working with students to ensure they are making good decisions socially and academically. I taught social studies, economics and world history for three years at the high school. I was rewarded tremendously as a classroom teacher, but am very excited to take on a leadership role in administration as the student advisor. Prior to transitioning to the education profession, I served as a Captain in the Army with the 82nd Airborne Division. I deployed to Afghanistan from 2007–2008, where I gained invaluable leadership experiences that served me well in the education field. I hold a Master\'s degree in Educational Leadership and a Bachelor\'s in Secondary Education from the University of Michigan-Flint, and a Bachelor\'s in Organizational Communication from Missouri State University. Grand Blanc Schools are premiere and I am so fortunate to serve the student and families of this community.",
    
        "I am eager to start my first year as Athletic Director/Assistant Principal at Grand Blanc High School. I spent the last eleven years at Alanson Public Schools. During my time at Alanson I taught high school science, physical education, and health and served as the district\'s Athletic Director for both middle and high school sports. I am thrilled to be coming to a school district with such a rich academic and athletic tradition.\n\nI am originally from Owosso, Michigan. I attended Owosso High School and played football, wrestling, and baseball. I am a 2002 graduate of Alma College. While there I played one year of football and four years of baseball. I later attended Michigan State University where I obtained a Masters of Arts degree in education.\n\nIn my spare time I enjoy spending time with my family. I look forward to working with the students, staff, and parents of Grand Blanc High School and helping to continue the strong academic and athletic tradition."
    ]
    
    let staffEmail = [
        "sallswed@grandblancschools.org",
        "sapplebe@grandblancschools.org",
        "narakely@grandblancschools.org",
        "marbit@grandblancschools.org",
        "tbabiasz@grandblancschools.org",
        "bbailey@grandblancschools.org",
        "tbaker@grandblancschools.org",
        "sbarker@grandblancschools.org",
        "kbarnes@grandblancschools.org",
        "nbarnows@grandblancschools.org",
        "abas@grandblancschools.org",
        "mbauerme@grandblancschools.org",
        "cbelcher@grandblancschools.org",
        "vbelill@grandblancschools.org",
        "kbenaway@grandblancschools.org",
        "sbieda@grandblancschools.org",
        "pblacket@grandblancschools.org",
        "sblakley@grandblancschools.org",
        "jblake@grandblancschools.org",
        "dbleiche@grandblancschools.org",
        "dbotzki@grandblancschools.org",
        "zbradley@grandblancschools.org",
        "tbriggs@grandblancschools.org",
        "abruin@grandblancschools.org",
        "lbrunsko@grandblancschools.org",
        "abutzu@grandblancschools.org",
        "nbuxbaum@grandblancschools.org",
        "rcalo@grandblancschools.org",
        "lcampbel@grandblancschools.org",
        "ccarmody@grandblancschools.org",
        "carney@grandblancschools.org",
        "kchurch@grandblancschools.org",
        "dclark@grandblancschools.org",
        "kclark@grandblancschools.org",
        "mclark@grandblancschools.org",
        "dclement@grandblancschools.org",
        "rcoffman@grandblancschools.org",
        "rcoon@grandblancschools.org",
        "acottril@grandblancschools.org",
        "ccozad@grandblancschools.org",
        "lcuccia@grandblancschools.org",
        "mdavis2@grandblancschools.org",
        "cdecker@grandblancschools.org",
        "jdelaney@grandblancschools.org",
        "mdoering@grandblancschools.org",
        "jdohm@grandblancschools.org",
        "sdunk@grandblancschools.org",
        "adunning@grandblancschools.org",
        "eelias@grandblancschools.org",
        "nender@grandblancschools.org",
        "jfinkbei@grandblancschools.org",
        "mfranzel@grandblancschools.org",
        "kfritzsc@grandblancschools.org",
        "mgardner@grandblancschools.org",
        "kgarey@grandblancschools.org",
        "sgarey@grandblancschools.org",
        "kgaudet@grandblancschools.org",
        "dgibbsha@grandblancschools.org",
        "tgidding@grandblancschools.org",
        "ggoetzin@grandblancschools.org",
        "lgowdy@grandblancschools.org",
        "mgraves@grandblancschools.org",
        "agreen@grandblancschools.org",
        "hgrzymko@grandblancschools.org",
        "lgualdon@grandblancschools.org",
        "aguerra@grandblancschools.org",
        "null.org",
        "phall@grandblancschools.org",
        "jhammond@grandblancschools.org",
        "bhassenz@grandblancschools.org",
        "mheemsot@grandblancschools.org",
        "jhentes@grandblancschools.org",
        "dholt@grandblancschools.org",
        "khowell@grandblancschools.org",
        "lhubbs@grandblancschools.org",
        "bhugo@grandblancschools.org",
        "mhugo@grandblancschools.org",
        "chutchis@grandblancschools.org",
        "ajacobso@grandblancschools.org",
        "ajohnson@grandblancschools.org",
        "sjohnson@grandblancschools.org",
        "bkehn@grandblancschools.org",
        "kkeilitz@grandblancschools.org",
        "rkenney@grandblancschools.org",
        "nkernen@grandblancschools.org",
        "mkildee@grandblancschools.org",
        "iking@grandblancschools.org",
        "kkish@grandblancschools.org",
        "dknapp@grandblancschools.org",
        "mlarose@grandblancschools.org",
        "jlawrenc@grandblancschools.org",
        "tlemaste@grandblancschools.org",
        "sli@grandblancschools.org",
        "alondrig@grandblancschools.org",
        "alundy@grandblancschools.org",
        "smareski@grandblancschools.org",
        "bmather@grandblancschools.org",
        "hmelton@grandblancschools.org",
        "mmelton@grandblancschools.org",
        "lmeyer@grandblancschools.org",
        "jminier@grandblancschools.org",
        "jmitchel@grandblancschools.org",
        "pmol@grandblancschools.org",
        "kmoore@grandblancschools.org",
        "pmoore@grandblancschools.org",
        "kmorris@grandblancschools.org",
        "mnewman@grandblancschools.org",
        "tmueller@grandblancschools.org",
        "snaddeo@grandblancschools.org",
        "dnewton@grandblancschools.org",
        "jnichols@grandblancschools.org",
        "lotoole@grandblancschools.org",
        "kousname@grandblancschools.org",
        "dpadgett@grandblancschools.org",
        "mparis@grandblancschools.org",
        "lparish@grandblancschools.org",
        "jpearce@grandblancschools.org",
        "mpearce@grandblancschools.org",
        "ependerg@grandblancschools.org",
        "npeske@grandblancschools.org",
        "spiggott@grandblancschools.org",
        "ppoelke@grandblancschools.org",
        "npopadic@grandblancschools.org",
        "tpotteng@grandblancschools.org",
        "spowers@grandblancschools.org",
        "lraab@grandblancschools.org",
        "eralbusky@grandblancschools.org",
        "rread@grandblancschools.org",
        "areed@grandblancschools.org",
        "dretberg@grandblancschools.org",
        "kriek@grandblancschools.org",
        "nriek@grandblancschools.org",
        "jrobert2@grandblancschools.org",
        "jroberts@grandblancschools.org",
        "trussian@grandblancschools.org",
        "jryckaer@grandblancschools.org",
        "dsaffron@grandblancschools.org",
        "jsalem@grandblancschools.org",
        "cschramm@grandblancschools.org",
        "aschweit@grandblancschools.org",
        "rseeds@grandblancschools.org",
        "sseiter@grandblancschools.org",
        "dshaver@grandblancschools.org",
        "sshaw@grandblancschools.org",
        "bshebak@grandblancschools.org",
        "lshinaba@grandblancschools.org",
        "mshuster@grandblancschools.org",
        "gsmith@grandblancschools.org",
        "sstockto@grandblancschools.org",
        "sstockt2@grandblancschools.org",
        "jstuck@grandblancschools.org",
        "rtait@grandblancschools.org",
        "jtaylor@grandblancschools.org",
        "lthurlow@grandblancschools.org",
        "ktosh@grandblancschools.org",
        "ctrombly@grandblancschools.org",
        "purbanik@grandblancschools.org",
        "mvanitve@grandblancschools.org",
        "kvanover@grandblancschools.org",
        "awalroth@grandblancschools.org",
        "mwesner@grandblancschools.org",
        "hwilling@grandblancschools.org",
        "jwilson@grandblancschools.org",
        "wwiltse@grandblancschools.org",
        "cwood@grandblancschools.org",
        "pwray@grandblancschools.org",
        "mwyatt@grandblancschools.org",
        "jyoungs@grandblancschools.org",
        "kyunker@grandblancschools.org",
        "tzacek@grandblancschools.org"
    ]
    
    let staffPhone = [
        "810-591-6505",
        "810-591-6428",
        "810-591-6443",
        "810-591-6662",
        "810-591-6487",
        "810-591-6663",
        "810-591-1679",
        "810-591-1575",
        "810-591-1572",
        "810-591-6452",
        "810-591-6466",
        "810-591-6492",
        "810-591-6659",
        "810-591-6315",
        "810-591-6665",
        "810-591-1579",
        "810-591-1675",
        "810-591-6348",
        "810-591-6455",
        "810-591-6072",
        "810-591-1606",
        "810-591-6494",
        "810-591-6671",
        "810-591-6045",
        "810-591-6429",
        "810-591-6427",
        "810-591-6066",
        "810-591-1585",
        "NONE",
        "810-591-6679",
        "810-591-6438",
        "810-591-1587",
        "810-591-6045",
        "810-591-6639",
        "810-591-1579",
        "810-591-6479",
        "810-591-1602",
        "810-591-6361",
        "810-591-6060",
        "810-591-1584",
        "NONE",
        "810-591-6108",
        "810-591-6468",
        "810-591-4302",
        "810-591-6475",
        "810-591-4301",
        "810-591-6493",
        "810-591-6071",
        "810-591-6467",
        "810-591-1663",
        "810-591-6102",
        "810-591-6642",
        "NONE",
        "810-591-6652",
        "810-591-6501",
        "810-591-6929",
        "810-591-6643",
        "810-591-2668",
        "810-591-6448",
        "810-591-6645",
        "810-591-6061",
        "810-591-6697",
        "810-591-6669",
        "810-591-6495",
        "810-591-1677",
        "810-591-6503",
        "810-591-6501",
        "810-591-6649",
        "810-591-6637",
        "810-591-6483",
        "810-591-1599",
        "810-591-6651",
        "810-591-6656",
        "810-591-6664",
        "810-591-1674",
        "810-591-6437",
        "810-591-6345",
        "810-591-6102",
        "810-591-1583",
        "810-591-6475",
        "810-591-6445",
        "810-591-6635",
        "810-591-6357",
        "810-591-6040",
        "810-591-6651",
        "810-591-1678",
        "810-591-6348",
        "810-591-6511",
        "810-591-6375",
        "810-591-6481",
        "810-591-6506",
        "810-591-1589",
        "810-591-1571",
        "810-591-6475",
        "810-591-6480",
        "810-591-6464",
        "810-591-6068",
        "810-591-6688",
        "810-591-6350",
        "810-591-6434",
        "NONE",
        "810-591-6644",
        "810-591-6648",
        "810-591-6351",
        "810-591-6500",
        "810-591-6666",
        "810-591-6107",
        "810-591-1672",
        "810-591-6925",
        "810-591-6448",
        "810-591-1576",
        "810-591-1581",
        "810-591-1574",
        "810-591-6346",
        "810-591-6070",
        "810-591-6067",
        "810-591-6634",
        "810-591-6376",
        "810-591-6449",
        "810-591-6042",
        "810-591-4300",
        "810-591-6353",
        "810-591-6677",
        "810-591-6332",
        "810-591-1586",
        "810-591-6497",
        "810-591-1576",
        "810-591-1680",
        "810-591-6491",
        "810-591-6468",
        "810-591-6041",
        "810-591-6344",
        "810-591-6035",
        "810-591-6653",
        "810-591-6507",
        "810-591-6655",
        "810-591-1588",
        "810-591-6504",
        "810-591-6502",
        "810-591-6666",
        "810-591-1678",
        "810-591-6657",
        "810-591-6069",
        "810-591-6469",
        "810-591-1567",
        "810-591-6931",
        "810-591-1582",
        "810-591-6063",
        "810-591-6444",
        "810-591-6465",
        "810-591-6047",
        "810-591-6921",
        "810-591-6640",
        "810-591-6484",
        "810-591-6678",
        "810-591-6430",
        "810-591-6485",
        "810-591-1676",
        "810-591-6647",
        "810-591-6044",
        "810-591-1591",
        "810-591-6380",
        "810-591-1560",
        "810-591-6663",
        "810-591-6680",
        "810-591-6638",
        "810-591-6925",
        "810-591-6641",
        "810-591-6454",
        "810-591-6478"
    ]

    
    //Set the styling for the view.
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if (self.tableView.indexPathForSelectedRow != nil) {
            self.tableView.deselectRowAtIndexPath(self.tableView.indexPathForSelectedRow!, animated: true)
        }
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
        
        var staffcell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("StaffCell") 
        
        var officecell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("OfficeCell") 
        
        if staffcell == nil {
            staffcell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "StaffCell")
        }
        
        if officecell == nil {
            officecell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "OfficeCell")
        }
        
        switch selectControl.selectedSegmentIndex {
        case 0:
            
            let staffName = staff[indexPath.row]
            let selectedStaffEmail = staffEmail[indexPath.row]
            
            if (UIDevice.currentDevice().userInterfaceIdiom == .Pad) {
                //Device is an iPhone
                staffcell!.textLabel!.text = staffName
                staffcell!.detailTextLabel!.text = selectedStaffEmail
            }else{
                staffcell!.textLabel!.text = staffName
                staffcell!.detailTextLabel!.text = ""
            }
            return staffcell!
        case 1:
            
            let (guidanceName, guidanceSubtitle, guidanceImage) = guidance[indexPath.row]
            officecell!.textLabel!.text = guidanceName
            officecell!.detailTextLabel!.text = guidanceSubtitle
            officecell!.imageView!.image = UIImage(named: guidanceImage)
            
            return officecell!
        case 2:
            
            let (adminName, adminSubtitle, adminImage) = admins[indexPath.row]
            officecell!.textLabel!.text = adminName
            officecell!.detailTextLabel!.text = adminSubtitle
            officecell!.imageView!.image = UIImage(named: adminImage)
            
            return officecell!
            
        default:
            return staffcell!
        }
    }
    
    //Show the staff emails and phone numbers.
    func showDialog(indexPath: NSIndexPath) {
        
        let row = indexPath.row
        
        let actionSheetController: UIAlertController
            
        actionSheetController = UIAlertController(title: staff[row], message: "Phones ring into the classroom so please make an effort to call before/after school or during a conference period.", preferredStyle: .ActionSheet)
        
        if (staffPhone[row] != "NONE") {
            let callAction: UIAlertAction = UIAlertAction(title: "Call " + staffPhone[row], style: .Default) { action -> Void in
                self.call(row)
            }
            actionSheetController.addAction(callAction)
        }
       
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            if (self.tableView.indexPathForSelectedRow != nil) {
                self.tableView.deselectRowAtIndexPath(self.tableView.indexPathForSelectedRow!, animated: true)
            }
        }
        
        actionSheetController.addAction(cancelAction)
        
        if (staffEmail[row] != "NONE") {
            let emailAction: UIAlertAction = UIAlertAction(title: staffEmail[row], style: .Default) { action -> Void in
                    self.email(row)
            }
            actionSheetController.addAction(emailAction)
        }
        
        if let popoverController = actionSheetController.popoverPresentationController {
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            popoverController.sourceView = cell
            popoverController.sourceRect = CGRectMake(80, 0, 50, 50)
        }
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    
    }
    
    //Call the staff member when pressed.
    func call(row: Int) {
        let phoneCall = "tel://" + self.staffPhone[row]
        let number = phoneCall.stringByReplacingOccurrencesOfString("-", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        //Execute the call
        UIApplication.sharedApplication().openURL(NSURL(string: number)!)

    }
    
    //Email the staff member when pressed.
    func email(row: Int) {
        let mailComposeViewController = configuredMailComposeViewController(row)
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        }
    }
    
    func configuredMailComposeViewController(row: Int) -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients([staffEmail[row]])
        
        return mailComposerVC
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }

    
    //Called when an item is selected. Open action sheet for staff, OfficeView for others.
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexSelected = indexPath.row
        
        switch selectControl.selectedSegmentIndex {
        case 0:
            if (UIDevice.currentDevice().userInterfaceIdiom == .Phone) {
                //Device is an iPhone
                showDialog(indexPath)
            }else{
                email(indexSelected)
            }
        case 1:
            performSegueWithIdentifier("OfficeSegue", sender: indexSelected)
        case 2:
            performSegueWithIdentifier("AdminSegue", sender: indexSelected)
        default:
            performSegueWithIdentifier("OfficeSegue", sender: nil)
        }
    }
    
    //Transfer the variables into the next view that are needed for the person selected.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var (name, job, picture) = ("","","")
        var phone = ""
        var email = ""
        var bio = ""
        let index:Int = sender as! Int
        
        if(segue.identifier == "OfficeSegue") {
            (name, job, picture) = guidance[index]
            phone = guidancePhone[index]
            email = guidanceEmail[index]
        }
        else if (segue.identifier == "AdminSegue") {
            (name, job, picture) = admins[index]
            phone = adminPhone[index]
            email = adminEmail[index]
            bio = adminBio[index]
        }
        let nvc = (segue.destinationViewController as! OfficeViewController)
        
        nvc.pic = picture
        nvc.name = name
        nvc.job = job
        nvc.phone = phone
        nvc.email = email
        nvc.bio = bio
    }
    
    // Return no adaptive presentation style. Used to make popover not fullscreen.
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
}

