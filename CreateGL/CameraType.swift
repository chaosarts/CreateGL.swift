//
//  Camera.swift
//  CreateGL
//
//  Created by Fu Lam Diep on 12/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation
import ChaosMath


public protocol CameraType {
    
    /// Provides the scene to observe
    var scene : Scene? {get set}
    
    /// Provides the view box of the camera
    var viewVolume: ViewVolume {get set}
    
    /// Provides the projection matrix of the camera
    var projection : mat4 {get}
}
