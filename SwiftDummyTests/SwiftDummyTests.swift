//
//  SwiftDummyTests.swift
//  SwiftDummyTests
//
//  Created by Paul Castro on 7/1/16.
//  Copyright © 2016 IBM. All rights reserved.
//

import XCTest
@testable import SwiftDummy

class SwiftDummyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testHelloWorldAction() {
        let action = HelloWorldAction()
        
        let result = action.run(args: ["name": "Paul"])
        print("Got result \(result)")
        
        XCTAssert(result["greeting"] != nil)
    }
    
    func testTimeAction() {
        let action = TimeAction()
        
        let result = action.run(args: [String:Any]())
        print ("got result \(result)")
        
        
        XCTAssert(result["time"] != nil)
    }
    
    func testRule() {
        let trigger = WhiskTrigger()
        let action = HelloWorldAction()
        
        let rule = WhiskRule()
        rule.setRule(trigger: trigger, action: action)
        
        trigger.fire(args: ["name":"Paul"])
    }
    
    func testSequence() {
        let sequence = WhiskSequence()
        
        let timeAction = TimeAction()
        let helloAction = HelloWorldAction()
        
        sequence.setActions(actions: [timeAction, helloAction])
        
        let result = sequence.run(args: ["name":"Paul"])
        
        print("Sequence result is \(result)")
        
       XCTAssert(result["greeting"] != nil)
    }
    
}
