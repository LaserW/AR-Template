//
//  ViewController.swift
//  AR Template
//
//  Created by Березин Дмитрий Борисович on 22/01/2019.
//  Copyright © 2019 Dmitry Berezin. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    
    @IBOutlet var sceneView: ARSCNView!
    
    let scene = SCNScene()
    var turn1 : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        scene.rootNode.addChildNode(loadDragon())
        sceneView.scene = scene
        // Create a new scene
        //(named: "art.scnassets/ship.scn")!
 //BGE_Dragon_2.5_Blender_Game_Engine_new.dae
        
    }
    
    @IBAction func go(_ sender: UIButton) {
        //let scene = SCNScene()
        scene.rootNode.addChildNode(loadShip())
        
        // Set the scene to the view
        sceneView.scene = scene
        
    }
    
    @IBAction func minion(_ sender: UIButton) {
        //let scene = SCNScene()
        scene.rootNode.addChildNode(loadMinion())
        
        // Set the scene to the view
        sceneView.scene = scene
        
    }
    
    @IBAction func turn1(_ sender: UIButton) {
        if turn1 == false {
            turn1 = true
        }
        else {
            turn1 = false
        }
        
    }
    
    func loadShip() -> SCNNode {
        //let material = SCNMaterial()
        //material.diffuse.contents = UIColor.green
        
        let node = SCNScene(named: "art.scnassets/ship.scn")!.rootNode.clone()
        //node.geometry?.materials = [material]
        
        node.runAction(SCNAction.moveBy(x: 0, y: 0, z: 10, duration: 10))
        if turn1 == true {
            node.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 3.0, y: 0.0, z: 0.0, duration: 6)))
            //node.rotation = SCNVector4(0.0,0.0,1.0,Double.pi / 2)
        }
        return node
        
    }
    
    func loadMinion() -> SCNNode {
        let node = SCNScene(named: "art.scnassets/Minion.dae")!.rootNode.clone()
        //node.runAction(SCNAction.scale(by: 10.0 ))
        node.scale = SCNVector3(0.1,0.1,0.1)
        node.runAction(SCNAction.moveBy(x: 0, y: 0, z: -1, duration: 0))
        node.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0.0, y: 3.0, z: 0.0, duration: 3)))
        return node
    }
    
    func loadDragon() -> SCNNode {
        let node = SCNScene(named: "art.scnassets/BGE_Dragon_2.5_Blender_Game_Engine_new.dae")!.rootNode.clone()
        node.scale = SCNVector3(0.1,0.1,0.1)
   //     node.runAction(SCNAction.moveBy(x: 0, y: 1.5, z: -1, duration: 0))
//        node.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0.0, y: 3.0, z: 0.0, duration: 3)))
        return node
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
    

    
    
    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
