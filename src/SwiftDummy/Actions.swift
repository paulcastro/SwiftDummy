//
//
//  Actions.swift
//  SwiftDummy
//
//  Created by Paul Castro on 7/1/16.
//  Copyright © 2016 IBM. All rights reserved.
//

import Foundation

// Action declarations
class TimeAction: WhiskAction
{
    func run(args: [String:Any]) -> [String:Any] {
        
        let date = Date()
        let calendar = Calendar.current

        let components = calendar.dateComponents([Calendar.Component.hour, Calendar.Component.minute], from: date)
        let hour = components.hour
        let minutes = components.minute
        
        return ["time":"\(hour!):\(minutes!)"]
    }
    
    func dummy() {
        // just a dummy
    }
}

class HelloWorldAction: WhiskAction {
    func run(args: [String:Any]) -> [String:Any] {
        
        var msg = ""
        
        if let date = args["time"] as? String {
            msg = "On date \(date): "
        }
        
        if let name = args["name"] as? String {
            
            msg = msg + "I say hello \(name)"
            return ["greeting":msg]
        } else {
            
            msg = msg + "I say hello friend"
            return ["greeting": msg]
        }
    }
}

// triggers
let myTrigger = WhiskTrigger()
let anotherTrigger = WhiskTrigger()

// rules
let myRule = WhiskRule(trigger: myTrigger, action: HelloWorldAction())

// sequences
let mySequence = WhiskSequence(actions: [HelloWorldAction(), TimeAction()])





