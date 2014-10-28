//
//  ViewController.swift
//  ParseDemo
//
//  Created by Joel Castillo on 10/21/14.
//  Copyright (c) 2014 Joel Castillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var gameScore = PFObject(className:"Game")
        gameScore["numberOfPlayers"] = 3
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

