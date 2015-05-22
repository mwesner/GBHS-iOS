import UIKit

class NavigationController: UINavigationController, UIViewControllerTransitioningDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let primaryUIColor = UIColor( red: CGFloat(104/255.0), green: CGFloat(16/255.0), blue: CGFloat(8/255.0), alpha: CGFloat(1.0) )
        
        let navBar = self.navigationBar
        let tabBar = self.tabBarController!.tabBar
        
        navBar.backgroundColor = primaryUIColor
        
        tabBar.barTintColor = UIColor.whiteColor()
        tabBar.tintColor = primaryUIColor
    }
}
