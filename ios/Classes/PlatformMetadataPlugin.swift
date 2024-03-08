import Flutter
import UIKit

public class PlatformMetadataPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "platform_metadata", binaryMessenger: registrar.messenger())
        let instance = PlatformMetadataPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        switch call.method {
        case "getMetaData":
            let arg = call.arguments as! String
            let apiURL = Bundle.infoPlistValue(forKey: arg)
            result(apiURL)
            
        default:
            result(nil)
        }
    }
    
}

extension Bundle {
    static func infoPlistValue(forKey key: String) -> Any? {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key) else {
           return nil
        }
        return value
    }
}
