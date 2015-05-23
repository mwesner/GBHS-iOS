import UIKit

class MainNavigationController: UINavigationController, UIViewControllerTransitioningDelegate {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        let primaryUIColor = UIColor( red: CGFloat(104/255.0), green: CGFloat(16/255.0), blue: CGFloat(8/255.0), alpha: CGFloat(1.0) )
        
        let navBar = self.navigationBar
        let tabBar = self.tabBarController!.tabBar
        
        navBar.backgroundColor = primaryUIColor
        tabBar.tintColor = primaryUIColor
    }
}
