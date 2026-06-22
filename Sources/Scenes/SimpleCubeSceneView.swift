import RealityKit
import SwiftUI

struct SimpleCubeSceneView: View {
    var body: some View {
        RealityView { content in
            let rootEntity = SimpleCubeScene.makeScene()
            content.add(rootEntity)
        }
    }
}
