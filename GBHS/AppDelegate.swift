import UIKit
import Fabric
import Crashlytics
import TwitterKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Fabric.with([Twitter(), Crashlytics()])
        
        //TODO: Replace this key with the production maps API key before release.
        GMSServices.provideAPIKey("AIzaSyC98teasbFadBynAmoxxB0q_qHPVFgYRds")
        
        return true
    }
}

