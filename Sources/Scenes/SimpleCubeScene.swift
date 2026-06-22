import RealityKit
import simd

@MainActor
enum SimpleCubeScene {
    static func makeScene() -> Entity {
        let rootEntity = Entity()

        rootEntity.addChild(makeCamera())
        rootEntity.addChild(makeLight())
        rootEntity.addChild(makeCube())
        rootEntity.addChild(makeFloor())

        return rootEntity
    }

    private static func makeCamera() -> Entity {
        let cameraEntity = Entity()
        cameraEntity.components.set(PerspectiveCameraComponent())
        cameraEntity.position = [0, 2, 8]
        return cameraEntity
    }

    private static func makeLight() -> Entity {
        let lightEntity = Entity()
        lightEntity.components.set(
            DirectionalLightComponent(
                color: .white,
                intensity: 3_000
            )
        )
        lightEntity.orientation = simd_quatf(angle: -.pi / 3, axis: [1, 0, 0])
        lightEntity.orientation *= simd_quatf(angle: .pi / 4, axis: [0, 1, 0])
        return lightEntity
    }

    private static func makeCube() -> Entity {
        let mesh = MeshResource.generateBox(size: 1.0)
        let material = SimpleMaterial(color: .red, roughness: 0.15, isMetallic: false)
        let cubeEntity = ModelEntity(mesh: mesh, materials: [material])
        cubeEntity.position = [0, 0.5, 0]
        return cubeEntity
    }

    private static func makeFloor() -> Entity {
        let mesh = MeshResource.generatePlane(width: 12, depth: 12)
        let material = SimpleMaterial(color: .green, roughness: 1.0, isMetallic: false)
        let floorEntity = ModelEntity(mesh: mesh, materials: [material])
        floorEntity.position = [0, 0, 0]
        return floorEntity
    }
}
