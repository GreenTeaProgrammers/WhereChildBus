import UIKit
import Flutter
import GoogleMaps
import GooglePlaces
import FlutterConfig

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey(FlutterConfigPlugin.env(for: "GOOGLE_MAP_API_KEY"))
    GMSPlacesClient.provideAPIKey(FlutterConfigPlugin.env(for: "GOOGLE_MAP_API_KEY"))
    GMSServices.setMetalRendererEnabled(true)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
