import UIKit
import Fabric
import Crashlytics
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Fabric.with([Twitter(), Crashlytics()])
        GMSServices.provideAPIKey("AIzaSyC98teasbFadBynAmoxxB0q_qHPVFgYRds")
        return true
    }
}

