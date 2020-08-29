//
//  ViewController.swift
//  SimpleBox
//
//  Created by Alexander on 29.08.2020.
//  Copyright © 2020 Alexander Nuzhnyi. All rights reserved.
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
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        // Adding a 3D object
        addObject()
        
        // Adding some default lighting
        configureLighting()
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
    
    // Adding an object
    func addObject() {
        
        // Adding some 3D text
        let text = SCNText(string: "Hello ARKit!", extrusionDepth: 1.0)
        text.firstMaterial?.diffuse.contents = UIColor.green
        text.chamferRadius = 0.01
        
        let textNode = SCNNode(geometry: text)
        textNode.position = SCNVector3(0, 0, -0.5)
        textNode.scale = SCNVector3(0.05, 0.05, 0.05)
        
        sceneView.scene.rootNode.addChildNode(textNode)
    }
    
    // Adding Basic Lighting
    func configureLighting() {
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
    }

}
