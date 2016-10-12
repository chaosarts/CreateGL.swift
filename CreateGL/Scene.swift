//
//  Scene.swift
//  CreateGL
//
//  Created by Fu Lam Diep on 11/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation
import ChaosMath

public class Scene : Container {
    
    /// Provides the absolute position of the scene, which is the null vector
    public override var absolutePosition: vec3 {
        return vec3()
    }
}
