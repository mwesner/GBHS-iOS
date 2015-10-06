import UIKit
import TwitterKit

class TweetsViewController: TWTRTimelineViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "GrandBlancPride", APIClient: client)
        
        
        //Prevent translucent nav bar from covering tweets
        self.edgesForExtendedLayout = UIRectEdge.None
    }
}