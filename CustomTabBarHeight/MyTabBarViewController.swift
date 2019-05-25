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
        
        viewControllers = [
            ViewController(backgroundColor: .blue, tabBarTitle: "blue"),
            ViewController(backgroundColor: .yellow, tabBarTitle: "yellow")
        ]
        
        self.tabBar.isTranslucent = false
    }
    
    /*
     This tabBarHeight is used to customize the height of the tabBar.
    */
    let tabBarHeight: CGFloat = 180.0;
    
    /*
     This allows us to use the custom tabBarHeight and adjust the tabBar height.
     In doing so, we have to adjust the height and y position to account for the change in height.
    */
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = tabBarHeight
        tabFrame.origin.y = self.view.frame.size.height - tabBarHeight;

        self.tabBar.frame = tabFrame;
    }
}
