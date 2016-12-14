import UIKit
import MessageUI

class FacultyViewController: UITableViewController, MFMailComposeViewControllerDelegate  {
    
    var index: Int?
    
    @IBOutlet weak var selectControl: UISegmentedControl!
    
    @IBAction func changeTypeSelected(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    let admins = [
        ("Jennifer Hammond", "Principal", "admin_hammond"),
        ("Allyson Walroth", "Assistant Principal", "admin_walroth"),
        ("Gary Goetzinger", "Assistant Principal", "admin_gz"),
        ("Lamanzer Williams", "Assistant Principal", "admin_williams"),
        ("Lori Jackson", "Student Advisor - East Campus", "admin_jackson"),
        ("Jerrod Dohm", "Athletic Director-Asst. Principal", "admin_dohm"),
        ("Kevin Keilitz", "Student Advisor - West Campus", "admin_keilitz"),
        ("Janet Roberts", "College and Career Specialist/Student Advocate", "admin_roberts"),
    ]
    
    let guidance = [
        ("Mary Gardner", "O-Z", "guidance_gardner"),
        ("John Hentes", "CSS", "guidance_hentes"),
        ("Pamela Hall", "9th Grade", "guidance_hall"),
        ("Nicole Kernen", "Ge-N", "guidance_kernen"),
        ("Phyllis Mol", "A-Ga", "guidance_mol"),
        ("Kendra Vanover", "Counseling Office Secretary", "guidance_vanover"),
    ]
    
    let staff = [
        "Allswede, Stacey",
        "Applebee, Stephen",
        "Arakelyan, Natalya",
        "Babiasz, Todd",
        "Bailey, Bradd",
        "Baker, Tami",
        "Barker, Steven",
        "Barnes, Kimberly",
        "Barnowsky, Nicholas",
        "Bas, Adriana",
        "Bauermeister, Marie",
        "Belill, Valerie",
        "Benaway, Karen",
        "Bieda, Sara",
        "Blackett, Patricia",
        "Blake, Justin",
        "Blakley, Sarah",
        "Bleicher, Dana",
        "Botzki, Denise",
        "Bradley, Zachary",
        "Briggs, Tisha",
        "Bruin, Amanda",
        "Brunskole, Lori",
        "Butzu, Ava",
        "Buxbaum, Nina",
        "Calo, Ron",
        "Carmody, Charlie",
        "Carney, Chad",
        "Church, Katie",
        "Clark, Daniel",
        "Clark, Kari",
        "Clark, Matthew",
        "Clement, David",
        "Coffman, Ryan",
        "Coon, Robert",
        "Cottrill, ",
        "Cozad, Colleen",
        "Cuccia, Kubda",
        "Cushman, Jeffrey",
        "Davis, Marcia",
        "DeArmond, Jennifer",
        "Decker, Cynthia",
        "Delaney, Joseph",
        "Doering, Meagan",
        "Dohm, Jerrod",
        "Dunk, Steve",
        "Dunning, Amy",
        "Ejak, Nicholas",
        "Elias, Elizabeth",
        "Ender, Nicholas",
        "Franzel, Mary",
        "Fritzsching, Kaylinda",
        "Gardner, Mary",
        "Garey, Kolette",
        "Gaudet, Karen",
        "Gibbs-Halm, Deborah",
        "Giddings, Tonya",
        "Goetzinger, Gary",
        "Goncz, Caleb",
        "Graves, Megan",
        "Green, Alan",
        "Grzymkowski, Heather",
        "Gualdoni, Laura",
        "Guerrya, Amy ",
        "Guigear, Nate",
        "Hall, Pamela ",
        "Hammond, Jenny",
        "Hassenzhal, Beth ",
        "John, Hentes",
        "Histed, Craig",
        "Holt, Denny ",
        "Howell, Katheen",
        "Hubbs, Laura",
        "Hugo, Brian",
        "Hugo, Matthew ",
        "Hutchison, Corbin ",
        "Jackson, Lori",
        "Jacobson, Amy",
        "Jeffers, Ashley",
        "Johnson, Amy ",
        "Johnson, Sarah",
        "Khen, Bonnie",
        "Keilitz, Kevin",
        "Kenney, Rachel ",
        "Kernen, Nicole",
        "Kildee, Meghann",
        "King, Irving",
        "Kish, Kaitlyn",
        "Knapp, Donald ",
        "Lawrence, Jenalyn ",
        "Lemaster, Thomas",
        "Li, Snow",
        "Londrigan, Aimee ",
        "Lundy, Andrea ",
        "Lunn, Scott",
        "Mareski, Shannon",
        "Mather, Brenda ",
        "McNair, Lyniece",
        "Melton, Marcie",
        "Meyer, Lindsay",
        "Mol, Phyllis",
        "Moore, Karen",
        "Moore, Patrick",
        "Morris, Krista",
        "Mueller, Tina",
        "Sara, Naddeo",
        "Newman, Maureen",
        "Dana, Newton",
        "Nicholson, James",
        "O'Toole, Lia",
        "Ousnamer, Karen ",
        "Overmyer, Emily ",
        "Padgett, David ",
        "Paris, Micheal",
        "Parish, Lindsay",
        "Pearce, Jill ",
        "Pearce, Matthew ",
        "Pendergrass, Erik ",
        "Piggott, Sally ",
        "Popadich, Nicholas",
        "Pottenger, Troy ",
        "Powers, Suzanne ",
        "Raab, Lisa ",
        "Ragland, Jeffery ",
        "Ralbusky, Elizabeth",
        "Read, Rachel ",
        "Reed, Adam ",
        "Reik, Kathleen",
        "Reik, Nathan",
        "Roberts, Janet ",
        "Robertson, Joan ",
        "Russian, Tanya ",
        "Saffron, Danida ",
        "Salem, Jon ",
        "Schramm, Charles ",
        "Schwegler, Shannon",
        "Schweitzer, Amy",
        "Scott, Sarah",
        "Seeds, Rebecca",
        "Sellers, Autumn ",
        "Sharkey, Becky ",
        "Shaver, Dana",
        "Shaw, Susan ",
        "Shebak, Bodhi ",
        "Shuster, Mike ",
        "Smith, Gary ",
        "Smith, Karen ",
        "Stockton, Sarah ",
        "Stockton, Susan ",
        "Stuck, James ",
        "Tait, Rachael ",
        "Taneyhill, Daniel ",
        "Taylor, Justin ",
        "Thurlow, Leslie ",
        "Thurlow, Scott ",
        "Urbanik, Phillip ",
        "Vanitvelt, Marcie ",
        "Vanover, Kendra ",
        "Walroth, Allyson",
        "Cody, Wangler",
        "Webb, Jennifer ",
        "Wesner, Michael ",
        "Williams, Lemanzer",
        "Willing, Heather",
        "Wilson, Jessica ",
        "Wiltse, Wes ",
        "Wray, Peggy ",
        "Wyatt, Mary",
        "Youngs, Jason",
        "Yunker, Karen ",
        "Zacek, Tom ",
]
    
    let guidanceEmail = [
        "mgardner@grandblancschools.org",
        "jhentes@grandblancschools.org",
        "phall@grandblancschools.org",
        "nkernen@grandblancschools.org",
        "pmol@grandblancschools.org",
        "kvanover@grandblancschools.org"
    ]
    
    let guidancePhone = [
        "810-591-6652",
        "810-591-6651",
        "810-591-6649",
        "810-591-6651",
        "810-591-6648",
        "810-591-6647"
    ]
    
    let adminEmail = [
        "jhammond@grandblancschools.org",
        "awalroth@grandblancschools.org",
        "ggoetzin@grandblancschools.org",
        "lwilliam@grandblancschools.org",
        "ljackson@grandblancschools.org",
        "jdohm@grandblancschools.org",
        "kkeilitz@grandblancschools.org",
        "jroberts@grandblancschools.org",
        
    ]
    
    let adminPhone = [
        "810-591-6637",
        "810-591-6659",
        "810-591-2667",
        "810-591-6353",
        "810-591-6644",
        "810-591-4301",
        "810-591-6645",
        "810-591-6035"
    ]
    
    let adminBio = [
    //HAMMOND
        "As the principal of Grand Blanc High School, my responsibilities include supervising the overall building operations, overseeing curriculum development and improvement, evaluating and monitoring instructional staff by visiting classrooms on a daily basis, planning and executing professional development for staff, monitoring the building budget, developing and implementing the school improvement plan, overseeing the high school testing program, and supervising the career and technical education department. What I love most about my position is being around our students and staff. With a large campus, it is often difficult to get to know individual students but I visit classrooms regularly and enjoy seeing them learning, collaborating, and building relationships with their teachers and one another. \n\nI began my career in education over 20 years ago as a high school math teacher in Houston, Texas. I also taught middle school and high school math in Hamtramck and at Troy Athens High School. I served as an assistant principal at Troy High School for eight years prior to coming to Grand Blanc. My educational experiences include a bachelor\'s degree from Michigan State University, a master\'s degree from Wayne State University and an education specialist degree and doctorate of philosophy degree from Oakland University.",
    //Walroth
        "I am very excited to be one of the assistant principals at Grand Blanc High School! I have great ties to this district, as I was with Grand Blanc for eleven years as both a teacher and a student advisor before moving into administration. I am a Bobcat through and through, and I am honored to be continuing my leadership here.\nMy responsibilities include attendance contracts, discipline, staff development, and supervision of curriculum and instruction. I commit to making sure that the education the students at Grand Blanc High School receive is exactly what I would want for my own children. I view discipline in the same way and will work with each child to problem solve and learn how to make better choices in the future. I also firmly believe in the power of communication. If you have concerns, questions, or suggestions, please take the time to express them to me. I value your experiences and feedback, and I would love to know what you need from me.",
    //GARY
        "An assistant principal since 1999 at GBHS, I have a broad background in public school administration as a school administrator for thirty-plus years, including most areas of K-12 education and community college, as well as a five-year private business experience as an educational consultant. I have had the opportunity to be a teacher, coach, assistant principal, principal, athletic director, community education director, technology director, and school consultant. I have earned a Bachelor Degree from Alma College and a Masters Degree from Central Michigan University.\nDuring my tenure at GBHS, I have demonstrated the ability to be an effective educational leader in the areas of student achievement, strategic planning, school improvement, student attendance and behavior, staff development, and community/parent involvement.  I build strong relationships with staff, students and parents.  I am truly committed to the success of all students.",
    //L WILLIAM
        "I am excited to begin as Assistant Principal here at Grand Blanc High School. Last year I served as Dean of students at a small charter school in Detroit, prior to that I spent three years at Ypsilanti Community Schools. During my time at Ypsilanti I was assistant principal/Athletic director at the high school and Dean of students at the middle school. I have over 15 years of experience in administration including a discipline and athletic background. I have coached football the last 15 years also been a track coach. I attended the University of Minnesota on a football scholarship from 1993-1997.\nI received my bachelor’s degree in Kinesiology from Eastern Michigan. I acquired a master’s degree from Concordia Chicago University in athletic administration and Leadership. Earlier this year I completed my second master’s degree in Educational Leadership with a principal certification and currently working on my Education Specialist degree, both of these at Grand Valley State University. I am truly blessed and honored to be at such a successful district with so many people that are great at what they do for students.\nI am originally from Greensboro Alabama where I was born. I moved to Ypsilanti Michigan when I was 4 years old, attended Willow Run high school and played basketball, football, and ran track. In my spare time I enjoy training football players, playing basketball, going to the bookstore, listening to music, and attending comedy shows. I am truly here to be a resource for the students of Grand Blanc high school and also the people that I work with.",
    //JACKSON
        "Hello students, parents, and community members. My name is Lori Jackson. I have been in education for over 17 years. I hold a Bachelor of Science from the University of Michigan-Flint with a major in biology and minor in general science with a teaching certification. In addition I have a masters in educational leadership from Marygrove College and have attended the Aspiring Principal’s Program through Oakland Schools.\nThroughout my career I have taught high school science in Goodrich, Grand Blanc, Mt. Morris and Troy Athens. During my years at each school I enjoyed serving on various committees as well as helping to develop new programs to help students acclimate and succeed in high school.\nOutside of school I enjoy spending time with my husband and three children. We enjoy attending sporting events, traveling and spending time with our extended family.\nAs a member of the Grand Blanc community, I am committed to making a positive impact on our students’ academic and community achievements. ",
    //DOHM
        "I am eager to start a new year as Athletic Director/Assistant Principal at Grand Blanc High School. Prior to serving at Grand Blanc, I spent eleven years at Alanson Public Schools. During my time at Alanson I taught high school science, physical education, and health and served as the district's Athletic Director for both middle and high school sports. I am thrilled to be coming to a school district with such a rich academic and athletic tradition.\nI am originally from Owosso, Michigan. I attended Owosso High School and played football, wrestling, and baseball. I am a 2002 graduate of Alma College. While there I played one year of football and four years of baseball. I later attended Michigan State University where I obtained a Masters of Arts degree in education.\nIn my spare time I enjoy spending time with my family. I always look forward to working with the students, staff, and parents of Grand Blanc High School and helping to continue the strong academic and athletic tradition.",
        //KELITZ
        "As the Student Advisor at West Campus I am responsible for our Center for Student Success (CSS) program and all 9th grade discipline and attendance issues.   I am looking forward to meeting this year's freshman class and helping them to successfully transition into Grand Blanc High School.\nWhen I am not at the high school, I enjoy spending as much time with my family as I can.  In the summer you can usually find us at our family cottage on Harsens Island either boating, jet skiing, or just sunbathing in Musamoot Bay.",
        //ROBERTS
        "I’m honored to work at Grand Blanc High School, serving the students, parents, staff and the Grand Blanc community.  My husband and I have been residents of Grand Blanc since 2002 and have 2 daughters in the district at the middle school and high school level.\nMy responsibilities at the high school include the oversight of the Grand Blanc Early College, Career and Technical Education programs, Career Resource Center, west campus discipline, 9th grade attendance and graduation planning.  In addition, I serve as the administrative liaison for the post-grad party, 2018 Class Sponsor and for the past 3 years I’ve served as the Summer School Supervisor.\nI have 14 years of experience in secondary education which includes 6 years of classroom instruction, 8 years of curriculum and state compliance and 5 years in an administrator capacity.\nI earned a Masters of Public Administration from the University of Michigan, Masters of Curriculum and Instruction from the University of Phoenix, and Bachelor of Business Administration from Detroit College of Business.\nI have dedicated my career to serving students, mentoring staff, collaborating with stakeholders, and supporting the surrounding community with a single focus in mind - ensuring that the students of Grand Blanc Community Schools receive the best educational experience possible.  I’ve found this to be extremely rewarding, both personally and professionally.  I look forward to assisting the students of Grand Blanc High School to actualize their own unique genius.\nGo Bobcats!"
    ]
    
    let staffEmail = [
        "sAllswed@grandblancschools.org",
        "sApplebe@grandblancschools.org",
        "nArakely@grandblancschools.org",
        "tBabiasz@grandblancschools.org",
        "bBailey@grandblancschools.org",
        "tBaker@grandblancschools.org",
        "sBarker@grandblancschools.org",
        "kBarnes@grandblancschools.org",
        "nBarnows@grandblancschools.org",
        "aBas@grandblancschools.org",
        "mBauerme@grandblancschools.org",
        "vBelill@grandblancschools.org",
        "kBenaway@grandblancschools.org",
        "sBieda@grandblancschools.org",
        "pBlacket@grandblancschools.org",
        "jBlake@grandblancschools.org",
        "sBlakley@grandblancschools.org",
        "dBleiche@grandblancschools.org",
        "dBotzki@grandblancschools.org",
        "zBradley@grandblancschools.org",
        "tBriggs@grandblancschools.org",
        "aBruin@grandblancschools.org",
        "lBrunsko@grandblancschools.org",
        "aButzu@grandblancschools.org",
        "nBuxbaum@grandblancschools.org",
        "rCalo@grandblancschools.org",
        "cCarmody@grandblancschools.org",
        "cCarney@grandblancschools.org",
        "kChurch@grandblancschools.org",
        "dClark@grandblancschools.org",
        "kClark@grandblancschools.org",
        "mClark@grandblancschools.org",
        "dClement@grandblancschools.org",
        "rCoffman@grandblancschools.org",
        "rCoon@grandblancschools.org",
        "ACottril@grandblancschools.org",
        "CCozad@grandblancschools.org",
        "kCuccia@grandblancschools.org",
        "jCushman@grandblancschools.org",
        "mDavis@grandblancschools.org",
        "jDeArmon@grandblancschools.org",
        "cDecker@grandblancschools.org",
        "jDelaney@grandblancschools.org",
        "mDoering@grandblancschools.org",
        "jDohm@grandblancschools.org",
        "sDunk@grandblancschools.org",
        "aDunning@grandblancschools.org",
        "nEjak@grandblancschools.org",
        "eElias@grandblancschools.org",
        "nEnder@grandblancschools.org",
        "mFranzel@grandblancschools.org",
        "kFritzsc@grandblancschools.org",
        "mGardner@grandblancschools.org",
        "kGarey@grandblancschools.org",
        "kGaudet@grandblancschools.org",
        "dGibbs-Halm@grandblancschools.org",
        "tGidding@grandblancschools.org",
        "gGoetzin@grandblancschools.org",
        "cGoncz@grandblancschools.org",
        "mGraves@grandblancschools.org",
        "aGreen@grandblancschools.org",
        "hGrzymkoi@grandblancschools.org",
        "LGualdon@grandblancschools.org",
        "aGuerrya,@grandblancschools.org",
        "nGuigear@grandblancschools.org",
        "pHall@grandblancschools.org",
        "jHammond@grandblancschools.org",
        "bHassenz@grandblancschools.org",
        "hJohn@grandblancschools.org",
        "cHisted@grandblancschools.org",
        "dHolt@grandblancschools.org",
        "kHowell@grandblancschools.org",
        "lHubbs@grandblancschools.org",
        "bHugo@grandblancschools.org",
        "mHugo@grandblancschools.org",
        "hHutchis@grandblancschools.org",
        "jJackson@grandblancschools.org",
        "aJacobso@grandblancschools.org",
        "AJeffers@grandblancschools.org",
        "AJohnson@grandblancschools.org",
        "SJohnson@grandblancschools.org",
        "bKhen@grandblancschools.org",
        "kKeilitz@grandblancschools.org",
        "rKenney@grandblancschools.org",
        "nKernen@grandblancschools.org",
        "MKildee@grandblancschools.org",
        "IKing@grandblancschools.org",
        "KKish@grandblancschools.org",
        "DKnapp@grandblancschools.org",
        "JLawrenc@grandblancschools.org",
        "TLemaster@grandblancschools.org",
        "SLi@grandblancschools.org",
        "ALondrig@grandblancschools.org",
        "ALundy@grandblancschools.org",
        "SLunn@grandblancschools.org",
        "SMareski@grandblancschools.org",
        "BMather@grandblancschools.org",
        "LMcNair@grandblancschools.org",
        "MMelton@grandblancschools.org",
        "LMeyer@grandblancschools.org",
        "PMol@grandblancschools.org",
        "KMoore@grandblancschools.org",
        "PMoore@grandblancschools.org",
        "MMorris@grandblancschools.org",
        "MMueller@grandblancschools.org",
        "sNaddeo@grandblancschools.org",
        "NNewman@grandblancschools.org",
        "dnewton@grandblancschools.org",
        "JNichols@grandblancschools.org",
        "LOToole@grandblancschools.org",
        "KOusname@grandblancschools.org",
        "EOvermye@grandblancschools.org",
        "DPadgett@grandblancschools.org",
        "MParis@grandblancschools.org",
        "LParish@grandblancschools.org",
        "JPearce@grandblancschools.org",
        "MPearce@grandblancschools.org",
        "EPenderg@grandblancschools.org",
        "SPiggott@grandblancschools.org",
        "NPopadic@grandblancschools.org",
        "TPotteng@grandblancschools.org",
        "SPowers@grandblancschools.org",
        "LRaab@grandblancschools.org",
        "JRagland@grandblancschools.org",
        "ERalbusky@grandblancschools.org",
        "RRead@grandblancschools.org",
        "AReed@grandblancschools.org",
        "KReik@grandblancschools.org",
        "NReik@grandblancschools.org",
        "JRoberts2@grandblancschools.org",
        "JRoberts@grandblancschools.org",
        "TRussian@grandblancschools.org",
        "DSaffron@grandblancschools.org",
        "JSalem@grandblancschools.org",
        "CSchramm@grandblancschools.org",
        "SSchwegl@grandblancschools.org",
        "ASchweit@grandblancschools.org",
        "SScott@grandblancschools.org",
        "RSeeds@grandblancschools.org",
        "ASellers@grandblancschools.org",
        "BSharkey@grandblancschools.org",
        "DShaver@grandblancschools.org",
        "SShaw@grandblancschools.org",
        "BShebak@grandblancschools.org",
        "MShuster@grandblancschools.org",
        "GSmith@grandblancschools.org",
        "KSmith@grandblancschools.org",
        "SStockto@grandblancschools.org",
        "SStockt2@grandblancschools.org",
        "JStuck@grandblancschools.org",
        "RTait@grandblancschools.org",
        "DTaneyhi@grandblancschools.org",
        "JTaylor@grandblancschools.org",
        "LThurlow@grandblancschools.org",
        "SThurlow@grandblancschools.org",
        "PUrbanik@grandblancschools.org",
        "MVanitve@grandblancschools.org",
        "KVanover@grandblancschools.org",
        "AWalroth@grandblancschools.org",
        "WCody@grandblancschools.org",
        "JWebb@grandblancschools.org",
        "MWesner@grandblancschools.org",
        "LWilliam@grandblancschools.org",
        "HWilling@grandblancschools.org",
        "JWilson@grandblancschools.org",
        "WWiltse@grandblancschools.org",
        "PWray@grandblancschools.org",
        "MWyatt@grandblancschools.org",
        "JYoungs@grandblancschools.org",
        "KYunker@grandblancschools.org",
        "TZacek@grandblancschools.org",


    ]
    
    let staffPhone = [
        "810-591-6505",
        "810-591-6428",
        "NONE",
        "810-591-6487",
        "NONE",
        "810-591-1679",
        "810-591-1575",
        "810-591-1572",
        "810-591-6452",
        "810-591-6466",
        "810-591-6492",
        "810-591-6315",
        "810-591-6931",
        "810-591-1579",
        "810-591-1675",
        "NONE",
        "810-591-6482",
        "810-591-6072",
        "810-591-1606",
        "810-591-6494",
        "810-591-6671",
        "810-591-6061",
        "810-591-6429",
        "810-591-6427",
        "810-591-6066",
        "810-591-1585",
        "810-591-6679",
        "810-591-6438",
        "810-591-1587",
        "810-591-6043",
        "810-591-6639",
        "810-591-6467",
        "810-591-6500",
        "810-591-6343",
        "810-591-6361",
        "810-591-6060",
        "810-591-1584",
        "NONE",
        "NONE",
        "810-591-6662",
        "NONE",
        "810-591-6468",
        "810-591-4302",
        "810-591-647-5591 x6474",
        "NONE",
        "NONE",
        "810-591-6071",
        "NONE",
        "810-591-6678",
        "810-591-1663",
        "NONE",
        "NONE",
        "NONE",
        "810-591-6365",
        "810-591-6643",
        "810-591-2668",
        "NONE",
        "NONE",
        "810-591-6949",
        "810-591-6697",
        "810-591-6669",
        "810-591-6495",
        "NONE",
        "810-591-6503",
        "810-591-1592",
        "NONE",
        "810-591-6638",
        "810-591-6483",
        "NONE",
        "NONE",
        "810-591-6656",
        "810-591-6664",
        "810-591-1674",
        "NONE",
        "NONE",
        "810-591-6102",
        "NONE",
        "810-591-1583",
        "NONE",
        "810-591-6474",
        "NONE",
        "810-591-6635",
        "NONE",
        "810-591-6042",
        "810-591-6651",
        "810-591-6667",
        "810-591-6486",
        "810-591-1573",
        "810-591-6698",
        "NONE",
        "810-591-1589",
        "810-591-1571",
        "810-591-1577",
        "810-591-6480",
        "810-591-6066",
        "NONE",
        "810-591-6068",
        "810-591-6657",
        "NONE",
        "810-591-6434",
        "NONE",
        "NONE",
        "810-591-6479",
        "NONE",
        "810-591-6430",
        "NONE",
        "810-591-6107",
        "NONE",
        "810-591-1603",
        "810-591-1581",
        "810-591-1574",
        "NONE",
        "810-591-6346",
        "810-591-6070",
        "810-591-6044",
        "NONE",
        "810-591-6376",
        "810-591-6449",
        "NONE",
        "810-591-6677",
        "810-591-6332",
        "810-591-1586",
        "810-591-6497",
        "810-591-6040",
        "810-591-1576",
        "810-591-1680",
        "810-591-6491",
        "810-591-6041",
        "810-591-6344",
        "810-591-6035",
        "810-591-6653",
        "NONE",
        "810-591-1588",
        "810-591-6504",
        "NONE",
        "810-591-6666",
        "810-591-6450",
        "810-591-6688",
        "NONE",
        "810-591-6683",
        "NONE",
        "810-591-6069",
        "810-591-6469",
        "810-591-6108",
        "810-591-1582",
        "810-591-6063",
        "NONE",
        "810-591-6444",
        "810-591-6465",
        "810-591-6047",
        "NONE",
        "NONE",
        "810-591-6640",
        "NONE",
        "NONE",
        "NONE",
        "810-591-6485",
        "810-591-1676",
        "810-591-6647",
        "810-591-6659",
        "810-591-6655",
        "810-591-1591",
        "NONE",
        "NONE",
        "810-591-1560",
        "810-591-6663",
        "810-591-6638",
        "NONE",
        "810-591-6641",
        "NONE",
        "NONE",

    ]

    
    //Set the styling for the view.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (self.tableView.indexPathForSelectedRow != nil) {
            self.tableView.deselectRow(at: self.tableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    //Number of sections in table
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of rows in table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var staffcell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "StaffCell") 
        
        var officecell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "OfficeCell") 
        
        if staffcell == nil {
            staffcell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "StaffCell")
        }
        
        if officecell == nil {
            officecell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "OfficeCell")
        }
        
        switch selectControl.selectedSegmentIndex {
        case 0:
            
            let staffName = staff[indexPath.row]
            let selectedStaffEmail = staffEmail[indexPath.row]
            
            if (UIDevice.current.userInterfaceIdiom == .pad) {
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
    func showDialog(_ indexPath: IndexPath) {
        
        let row = indexPath.row
        
        let actionSheetController: UIAlertController
            
        actionSheetController = UIAlertController(title: staff[row], message: "Phones ring into the classroom so please make an effort to call before/after school or during a conference period.", preferredStyle: .actionSheet)
        
        if (staffPhone[row] != "NONE") {
            let callAction: UIAlertAction = UIAlertAction(title: "Call " + staffPhone[row], style: .default) { action -> Void in
                self.call(row)
            }
            actionSheetController.addAction(callAction)
        }
       
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            if (self.tableView.indexPathForSelectedRow != nil) {
                self.tableView.deselectRow(at: self.tableView.indexPathForSelectedRow!, animated: true)
            }
        }
        
        actionSheetController.addAction(cancelAction)
        
        if (staffEmail[row] != "NONE") {
            let emailAction: UIAlertAction = UIAlertAction(title: staffEmail[row], style: .default) { action -> Void in
                    self.email(row)
            }
            actionSheetController.addAction(emailAction)
        }
        
        if let popoverController = actionSheetController.popoverPresentationController {
            let cell = tableView.cellForRow(at: indexPath)
            popoverController.sourceView = cell
            popoverController.sourceRect = CGRect(x: 80, y: 0, width: 50, height: 50)
        }
        self.present(actionSheetController, animated: true, completion: nil)
    
    }
    
    //Call the staff member when pressed.
    func call(_ row: Int) {
        let phoneCall = "tel://" + self.staffPhone[row]
        let number = phoneCall.replacingOccurrences(of: "-", with: "", options: NSString.CompareOptions.literal, range: nil)
        
        //Execute the call
        UIApplication.shared.openURL(URL(string: number)!)

    }
    
    //Email the staff member when pressed.
    func email(_ row: Int) {
        let mailComposeViewController = configuredMailComposeViewController(row)
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        }
    }
    
    func configuredMailComposeViewController(_ row: Int) -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients([staffEmail[row]])
        
        return mailComposerVC
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

    
    //Called when an item is selected. Open action sheet for staff, OfficeView for others.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexSelected = indexPath.row
        
        switch selectControl.selectedSegmentIndex {
        case 0:
            if (UIDevice.current.userInterfaceIdiom == .phone) {
                //Device is an iPhone
                showDialog(indexPath)
            }else{
                email(indexSelected)
            }
        case 1:
            performSegue(withIdentifier: "OfficeSegue", sender: indexSelected)
        case 2:
            performSegue(withIdentifier: "AdminSegue", sender: indexSelected)
        default:
            performSegue(withIdentifier: "OfficeSegue", sender: nil)
        }
    }
    
    //Transfer the variables into the next view that are needed for the person selected.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
        let nvc = (segue.destination as! OfficeViewController)
        
        nvc.pic = picture
        nvc.name = name
        nvc.job = job
        nvc.phone = phone
        nvc.email = email
        nvc.bio = bio
    }
    
    // Return no adaptive presentation style. Used to make popover not fullscreen.
    func adaptivePresentationStyleForPresentationController(_ controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

