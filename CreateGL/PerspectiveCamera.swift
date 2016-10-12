//
//  PerspectiveCamera.swift
//  CreateGL
//
//  Created by Fu Lam Diep on 12/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation
import ChaosMath

public class PerspectiveCamera : CameraBase, CameraType {
 	
    /// Provides the projection matrix
    public var projection: mat4 {
        get {
            let width : Float = viewVolume.right - viewVolume.left
            let height : Float = viewVolume.top - viewVolume.bottom
            let depth : Float = viewVolume.far - viewVolume.near
            let doublenear : Float = viewVolume.near * 2
            
            let a : Float = doublenear / width
            let b : Float = doublenear / height
            let c : Float = viewVolume.right + viewVolume.left / width
            let d : Float = viewVolume.top + viewVolume.bottom / height
            let e : Float = -(viewVolume.far + viewVolume.near) / depth
            let f : Float = -1
            let g : Float = -(doublenear * viewVolume.far) / depth
            
            return mat4(
                a, 0, 0, 0,
                0, b, 0, 0,
                c, d, e, f,
                0, 0, g, 0
            )
        }
    }
}
