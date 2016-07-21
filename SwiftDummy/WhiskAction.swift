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
class WhiskRule {
    func setRule(trigger: WhiskTrigger, action: WhiskAction) {
        trigger.mapAction(action: action)
    }
}

class WhiskTrigger {
    
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

class WhiskSequence {
    
    var actions = [WhiskAction]()

    func setActions(actions: [WhiskAction]) {
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
