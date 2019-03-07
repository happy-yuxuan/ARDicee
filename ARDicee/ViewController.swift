//
//  ViewController.swift
//  ARDicee
//
//  Created by Victor Wu on 2019/3/7.
//  Copyright © 2019 Victor Wu. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // 自己创建的模型
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)    //通过SCNBox创建一个正方体的形状，这个正方体是个类型，是SCNNode.geometry的属性，到时候可以作用到SCNNode上，这个Node就是正方形的了
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.red // 物体的材料是红色的
        
        cube.materials = [material] // 这个正方体的材料是 material变量给的
        
        let node = SCNNode()
        
        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)   // 这个物体的位置， z的位置要留意，-是朝向自己的箭头
        
        node.geometry = cube    // 这个node几何上表示是什么
        
        sceneView.scene.rootNode.addChildNode(node) // 屏幕是一个sceneView中的scene的rootNode中增加一个节点在屏幕上
        
        // 增加这个防止东西是平面，增加一句可以增加物体的3D效果
        sceneView.autoenablesDefaultLighting = true
        
        
//        // Create a new scene（系统自带的飞机模型）
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

}
