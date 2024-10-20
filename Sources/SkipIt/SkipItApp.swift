import Foundation
import OSLog
import SwiftUI

let logger: Logger = .init(subsystem: "com.example.SkipIt", category: "SkipIt")

let androidSDK = ProcessInfo.processInfo.environment["android.os.Build.VERSION.SDK_INT"].flatMap { Int($0) }

public struct RootView: View {
    public init() {}

    public var body: some View {
        ContentView()
            .task {
                logger.log("Welcome to Skip on \(androidSDK != nil ? "Android" : "iOS")!")
                logger.warning("Skip app logs are viewable in the Xcode console for iOS; Android logs can be viewed in Studio or using adb logcat")
            }
    }
}

#if !SKIP
public protocol SkipItApp: App {}

public extension SkipItApp {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
#endif
