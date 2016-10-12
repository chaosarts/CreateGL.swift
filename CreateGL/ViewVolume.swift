//
//  ViewVolume.swift
//  CreateGL
//
//  Created by Fu Lam Diep on 12/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation
import ChaosMath

/// Struct to use for camera view boxes
public struct ViewVolume {
    
    /// Provides the left side of the view box
    public var left : Float
    
    /// Provides the right side of the view box
    public var right : Float
    
    /// Provides the top side of the view box
    public var top : Float
    
    /// Provides the bottom side of the view box
    public var bottom : Float
    
    /// Provides the near plane of the view box
    public var near : Float
    
    /// Provides the far side of the view box
    public var far : Float

    /// Provides the width of the near plane
    public var width : Float {
        get {return right - left}
        set {
            let half : Float = newValue / 2
            left = -half
            right = half
        }
    }

    /// Provides the height of the near plane
    public var height : Float {
        get {return top - bottom}
        set {
            let half : Float = newValue / 2
            bottom = -half
            top = half
        }
    }

    /// Provides the depth of the view box
    public var depth : Float {
        get {return far - near}
        set {
            near = 1.0
            far = near + newValue
        }
    }

    /// Provides the aspect of `width` and `height`
    public var aspect : Float {
        return width / height
    }

    /// Provides the center of the view box
    public var center : vec3 {
        return vec3((right - left) / 2, (top - bottom) / 2, (far - near) / 2)
    }


    /// Initializes the view box with the given plane parameters
    /// - parameter left: the left side of the view box
    /// - parameter right: the right side of the view box
    /// - parameter top: the top side of the view box
    /// - parameter bottom: the bottom side of the view box
    /// - parameter near: the near plane of the view box
    /// - parameter far: the far side of the view box
    public init (_ left: Float, _ right: Float, _ top: Float, _ bottom: Float, _ near: Float, _ far: Float)  {
        self.left = left
        self.right = right
        self.top = top
        self.bottom = bottom
        self.near = near
        self.far = far
    }
}
