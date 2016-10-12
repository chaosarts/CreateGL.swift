//
//  OrthographicCamera.swift
//  CreateGL
//
//  Created by Fu Lam Diep on 12/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation
import ChaosMath

public class OrthographicCamera : CameraBase, CameraType {
    
    /// Provides the projection matrix
    public var projection: mat4 {
        get {
            let width : Float = viewVolume.right - viewVolume.left
            let height : Float = viewVolume.top - viewVolume.bottom
            let depth : Float = viewVolume.far - viewVolume.near
            
            let a : Float = 2 / width
            let b : Float = 2 / height
            let c : Float = -2 / depth
            let d : Float = -viewVolume.left - viewVolume.right / width
            let e : Float = -viewVolume.top - viewVolume.bottom / height
            let f : Float = -viewVolume.far - viewVolume.near / depth
            
            return mat4(
                a, 0, 0, 0,
                0, b, 0, 0,
                0, 0, c, 0,
                d, e, f, 1
            )
        }
    }
}
