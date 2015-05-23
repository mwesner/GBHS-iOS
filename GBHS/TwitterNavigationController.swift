import UIKit

class TwitterNavigationController: UINavigationController, UIViewControllerTransitioningDelegate {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        let twitterUIColor = UIColor( red: CGFloat(85/255.0), green: CGFloat(172/255.0), blue: CGFloat(238/255.0), alpha: CGFloat(1.0) )
        
        let navBar = self.navigationBar
        let tabBar = self.tabBarController!.tabBar
        
        navBar.backgroundColor = twitterUIColor
        tabBar.tintColor = twitterUIColor
    }
}
