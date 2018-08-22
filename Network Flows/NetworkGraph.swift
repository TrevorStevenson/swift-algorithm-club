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
    var start: NetworkNode<T>?
    var next: NetworkPath<T>?
    
    var flow: Int = 0
    
    init(start: NetworkNode<T>?) {
        self.start = start
    }
}

class NetworkGraph<T> {
    var source: NetworkNode<T>?
    var target: NetworkNode<T>?
    
    var flow: [[Int]] = []
    
    init(source: NetworkNode<T>?, target: NetworkNode<T>?, nodes: Int) {
        self.source = source
        self.target = target
        
        flow = Array(count: nodes, repeatedValue: Array(count: nodes, repeatedValue: 0))
    }
    
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
    
    // Find path from source to target and return that path
    
    func findPath() -> NetworkPath<T>? {
        guard let start = source, let end = target else { return nil }
        
        var stack = [start]
        var path = NetworkPath<T>(start: start)
        let head = path
        
        while stack.count > 0 {
            let top = stack.popLast()
            path.next = NetworkPath<T>(start: top)
            
            if top == target { return head }
        }
        
        return nil
    }
    
    // Augment the graph with a flow
    
    func augmentPath(path: NetworkPath<T>, flow: Int) {
        
    }
    
    // Get the total current flow of the graph
    
    func getFlowValue() -> Int {
        
    }
}
