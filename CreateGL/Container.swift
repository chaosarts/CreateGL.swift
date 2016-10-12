//
//  Container.swift
//  CreateGL
//
//  Created by Fu Lam Diep on 11/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation
import ChaosMath

public enum ContainerError : Error {
    case CircularRelation
}

public class Container : DisplayObject
{
    /*
	 +--------------------------------------------------------------------------
 	 | Stored properties
	 +--------------------------------------------------------------------------
 	 */
    
    /// Provides the children of the container
    public private(set) var children: Array<DisplayObject> = []
    
    /// Provides the scene to which this container belongs to
    public override var scene: Scene? {
        didSet {
            for child in children {
                child.scene = scene
            }
        }
    }
    
    
    /*
     +--------------------------------------------------------------------------
     | Derived properties
     +--------------------------------------------------------------------------
     */
    
    /// Provides the count of children within this container
    public var count : Int {
        get {return children.count}
    }
    
    
    /*
     +--------------------------------------------------------------------------
     | Methods
     +--------------------------------------------------------------------------
     */
    
    
    /// Returns the index of the given child if the container contains the child
    /// - parameter displayObject: The display object to search
    public func index (of displayObject: DisplayObject) -> Int? {
        for i in 0..<children.count {
            if children[i] === displayObject {return i}
        }
        return nil
    }
    
    
    /// Determines if the container contains the given display object
    public func contains (child: DisplayObject) -> Bool {
        return nil != index(of: child)
    }
    
    
    /// Adds a new child to the container
    /// - parameter child: The display object to add to the container
    public func add (child: DisplayObject) throws {
        let container : Container? = child as? Container
     	
        guard nil == container || container!.isAncestor(of: self) else {
            throw ContainerError.CircularRelation
        }
        
        if contains(child: child) {return}
        child.parent = self
        child.scene = scene
    	children.append(child)
    }
    
    
    /// Adds a new child to the container
    /// - parameter child: The display object to add to the container
    public func add (children: DisplayObject...) throws {
        for child in children {
            try add(child: child)
        }
    }
    
    
    /// Removes a child from the container
    /// - parameter child: The child object to remove
    public func remove (child: DisplayObject) -> Int? {
        let childIndex : Int? = index(of: child)
        if nil != childIndex {
            let _ = remove(at: childIndex!)
        }
        return childIndex
    }
    
    
    /// Removes the child object at given index, if `index` is a valid index
    /// - parameter index: The index of the child to remove
    /// - returns: The child at given index, if `index` was a valid index
    public func remove (at index: Int) -> DisplayObject? {
        var child : DisplayObject? = nil
    
        if index >= 0 && index < children.count {
            child = children.remove(at: index)
            child!.parent = nil
        }
        
        return child
    }
    
    
    /// Determines if the given container is an descendant of this container
    /// - parameter container: The container to check
    /// - returns: True if this containr is a descendant of the container
    public func isAncestor (of container: Container) -> Bool {
        var parent: Container? = container
        
        while nil != parent {
            if parent === self {return true}
            parent = parent?.parent
        }
        
        return false
    }
}
