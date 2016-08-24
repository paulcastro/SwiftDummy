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
    func run(_ args: [String:Any]) -> [String:Any]
}


// WhiskKit implementations
class WhiskRule {
    func setRule(_ trigger: WhiskTrigger, _ action: WhiskAction) {
        trigger.mapAction(action)
    }
}

class WhiskTrigger {
    
    var actions = [WhiskAction]()
    
    func mapAction(_ action: WhiskAction) {
        actions.append(action)
    }
    
    func fire(_ args: [String:Any]) {
        for action in actions {
            let _ = action.run(args)
        }
    }
}

class WhiskSequence {
    
    var actions = [WhiskAction]()

    func setActions(_ actions: [WhiskAction]) {
        self.actions = actions
    }
    
    func run(_ args:[String:Any]) -> [String:Any] {
        
        var result = args
        for action in actions {
            result = action.run(result)
        }
        
        return result
    }
}
