//
//
//  Actions.swift
//  SwiftDummy
//
//  Created by Paul Castro on 7/1/16.
//  Copyright © 2016 IBM. All rights reserved.
//

import Foundation


class TimeAction: WhiskAction
{
    func run(args: [String:Any]) -> [String:Any] {
        
        let date = Date()
        let calendar = Calendar.current

        let components = calendar.components([Calendar.Unit.hour, Calendar.Unit.minute], from: date)
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
            
            msg = msg + "I say hello stranger!"
            return ["greeting": msg]
        }
    }
}



