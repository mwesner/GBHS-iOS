import UIKit

class NavigationController: UINavigationController, UIViewControllerTransitioningDelegate {
    
    let primaryUIColor = UIColor( red: CGFloat(104/255.0), green: CGFloat(16/255.0), blue: CGFloat(8/255.0), alpha: CGFloat(1.0) )
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        let navBar = self.navigationBar
        let tabBar = self.tabBarController?.tabBar
        
        navBar.barTintColor = primaryUIColor
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    
        tabBar?.tintColor = UIColor.whiteColor()
        tabBar?.barTintColor = primaryUIColor
    }
}
