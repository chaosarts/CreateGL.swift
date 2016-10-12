//
//  CameraBase.swift
//  CreateGL
//
//  Created by Fu Lam Diep on 12/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation
import ChaosMath


public class CameraBase {
    
    /// Provides the scene to observe
    var scene : Scene?
    
    /// Provides the view box of the camera
    var viewVolume: ViewVolume
    
    /// Intiializes the camera with given view box
    public init (box: ViewVolume) {
        self.box = box
    }
    
    /// Initializes the camera with default box
    public convenience init () {
        self.init(box: ViewVolume(-1, 1, -1, 1, 1, 2))
    }
}
