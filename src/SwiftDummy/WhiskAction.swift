//
//  WhiskAction.swift
//  SwiftDummy
//
//  Created by Paul Castro on 7/1/16.
//  Copyright © 2016 IBM. All rights reserved.
//

import Foundation

// WhiskKit protocols
protocol WhiskAction {
    func run(args: [String:Any]) -> [String:Any]
}


// WhiskKit implementations
public class WhiskRule {
    init(trigger: WhiskTrigger, action: WhiskAction) {
        trigger.mapAction(action: action)
    }
}

public class WhiskTrigger {
    
    var actions = [WhiskAction]()
    
    func mapAction(action: WhiskAction) {
        actions.append(action)
    }
    
    func fire(args: [String:Any]) {
        for action in actions {
            let _ = action.run(args: args)
        }
    }
}

public class WhiskSequence {
    
    var actions: [WhiskAction]!
    
    init(actions: [WhiskAction]) {
        self.actions = actions
    }
    
    func run(args:[String:Any]) -> [String:Any] {
        
        var result = args
        for action in actions {
            result = action.run(args: result)
        }
        
        return result
    }
}
