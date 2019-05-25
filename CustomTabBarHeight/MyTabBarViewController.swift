//
//  MyTabBarViewController.swift
//  CustomTabBarHeight
//
//  Created by Mathew Glodack on 5/25/19.
//  Copyright © 2019 glodack. All rights reserved.
//

import UIKit

class MyTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Add some basic buttons
        
        viewControllers = [
            ViewController(backgroundColor: .blue),
            ViewController(backgroundColor: .yellow)
        ]
    }
}
