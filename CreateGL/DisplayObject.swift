//
//  DisplayObject.swift
//  CreateGL
//
//  Created by Fu Lam Diep on 20.09.16.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation
import ChaosMath

/// Provides a id to display object map
private var _objectPool : [UInt32 : DisplayObject] = [UInt32 : DisplayObject]()


public class DisplayObject
{
    /// Provides the current id count
    private static var _idCount : UInt32 = 0
    
    /// Provides the current id count
    private static var _currentIdCount : UInt32 {
        get {
            let id = _idCount
            _idCount += 1
            return id
        }
    }
    
    /// Provides the global display object pool
    internal var objectPool : [UInt32 : DisplayObject] {
        get {return _objectPool}
    }
    
    /// Registers the object to the object pool
    private static func _register (_ displayObject: DisplayObject) {
        _objectPool[displayObject.id] = displayObject
    }
    
    /// Unregisters the object from the object pool
    private static func _unregister (_ displayObject: DisplayObject) {
        _objectPool.removeValue(forKey: displayObject.id)
    }
    
    /*
	 +--------------------------------------------------------------------------
 	 | Stored properties
	 +--------------------------------------------------------------------------
 	 */
    
    /// Provides the parent container of the scene object
    public internal(set) var parent: Container?
    
    /// Provides the scene to which it belongs
    public internal(set) var scene : Scene?
    
    /// Provides the id of the object
    public let id : UInt32
    
    /// Provides the name of the display object
    public var name : String?
    
    /// Provide the poition of the object
    public var position : vec3 = vec3()
    
    /// Indicates whether the object is visible or not
    public var visible : Bool = true
    
    /// Provides the scale of the object in x, y and z direction
    public var scale : vec3 = vec3(1, 1, 1)
    
    /// Provides the rotation of the object
    private var _rotation : quaternion = quaternion(1, 0, 0, 0)
    
    /*
     +--------------------------------------------------------------------------
     | Derived properties
     +--------------------------------------------------------------------------
     */
    
    /// Provides the x position of the display object, relative to its parent
    public var x : Float {
        get {return position.x}
        set {position.x = newValue}
    }
    
    /// Provides the x position of the display object, relative to its parent
    public var y : Float {
        get {return position.y}
        set {position.y = newValue}
    }
    
    /// Provides the x position of the display object, relative to its parent
    public var z : Float {
        get {return position.z}
        set {position.z = newValue}
    }
    
    /// Provides the absolute position of the object in the scene
    public var absolutePosition : vec3 {
        return nil == parent ? position : parent!.absolutePosition + position
    }
    
    /*
     +--------------------------------------------------------------------------
     | Initializers
     +--------------------------------------------------------------------------
     */
    
    public required init () {
        id = DisplayObject._currentIdCount
        DisplayObject._register(self)
    }
    
    
    deinit {
        DisplayObject._unregister(self)
    }
}
