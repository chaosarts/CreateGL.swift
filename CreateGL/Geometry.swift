//
//  Geometry.swift
//  CreateGL
//
//  Created by Fu Lam Diep on 12/10/2016.
//  Copyright © 2016 Fu Lam Diep. All rights reserved.
//

import Foundation
import ChaosMath

public struct Geometry : Sequence {
    
    /// The iterator of this struct
    public struct Iterator : IteratorProtocol {
        
        /// Provids the geometry to iterate through
        private var _geometry : Geometry
        
        /// Provides the current position of the iterator
        private var _index : Int = 0
        
        /// Initializes the geometry
        /// - parameter geometry
        public init (_ geometry: Geometry) {
            _geometry = geometry
        }
        
        /// Returns the next position of the geometry
        public mutating func next() -> vec3? {
            if _index >= _geometry.count {
                return nil
            }
            _index += 1
            return _geometry[_index - 1]
        }
    }
    
    /// Provides a list of vertex positions
    private var _positions : [vec3] = []
    
    /// Provides the index list
    public private(set) var indices : [Int]
    
	/// Indicates, if the positions of the geometry are shared or not
    public let shared : Bool = true
    
    /// Returns the count vertex positions
    public var count : Int {
        return shared ? _positions.count : indices.count
    }
    
    /// Subcriipt to acces the position of the vertex at given index
    public subscript (_ index: Int) -> vec3 {
    	get {return _positions[index]}
        set {
            if index >= 0 && index < _positions.count {_positions[index] = newValue}
        }
    }
    
    /// Returns the iterator for this geometry
    /// - returns: The iterator of this geometry
    public func makeIterator() -> Iterator {
        let iterator : Iterator = Iterator(self)
        return iterator
    }
}
