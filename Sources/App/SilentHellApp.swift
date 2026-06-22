import SwiftUI

@main
struct SilentHellApp: App {
    var body: some Scene {
        WindowGroup {
            SimpleCubeSceneView()
        }
        .windowStyle(.automatic)
    }
}
