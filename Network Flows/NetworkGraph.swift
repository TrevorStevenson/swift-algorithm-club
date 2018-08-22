//
//  NetworkGraph.swift
//  
//
//  Created by Trevor Stevenson on 8/20/18.
//

import Foundation

class NetworkNode<T> {
    var value: T?
    var neighbors: [NetworkNode: Int] = []
    
    init(value: T, neighbors: [NetworkNode: Int] = []) {
        self.value = value
        self.neighbors = neighbors
    }
}

class NetworkPath<T> {
    var start: NetworkNode?
    var next: NetworkPath<T>?
    
    var flow: Int = 0
}

class NetworkGraph<T> {
    var source: NetworkNode<T>?
    var target: NetworkNode<T>?
    
    // Recursive DFS implementation
    
    func depthFirstSearchRecursive(startNode: NetworkNode<T>?, targetValue: T?) -> NetworkNode? {
        guard let start = startNode, let value = targetValue else { return nil }
        
        if start.value == value { return start }
        
        for (neighbor, _) in start.neighbors {
            depthFirstSearch(startNode: neighbor, targetValue: value)
        }
    }
    
    // Iterative DFS implementation
    
    func depthFirstSearch(startNode: NetworkNode<T>?, targetValue: T?) -> NetworkNode? {
        guard let start = startNode, let value = targetValue else { return nil }
        
        var stack = [start]
        
        while stack.count > 0 {
            let top = stack.popLast()
            if top.value == value { return top }
            
            for (neighbor, _) in top.neighbors {
                stack.append(neighbor)
            }
        }

        return nil
    }
}
