import UIKit
import Flutter
import GoogleMaps
// import GooglePlaces
import flutter_config

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // GMSPlacesClient.provideAPIKey(FlutterConfigPlugin.env(for: "GOOGLE_MAP_API_KEY"))
    GMSServices.provideAPIKey(FlutterConfigPlugin.env(for: "GOOGLE_MAP_API_KEY"))
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
