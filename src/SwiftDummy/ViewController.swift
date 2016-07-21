//
//  ViewController.swift
//  SwiftDummy
//
//  Created by Paul Castro on 7/1/16.
//  Copyright © 2016 IBM. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let helloAction = HelloWorldAction()
        let timeAction = TimeAction()
        
        let sequence = WhiskSequence()
        
        sequence.setActions(actions: [timeAction,helloAction])
        let resp = sequence.run(args: ["name":"Paul"])
        
        print("Response from sequence is \(resp)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

