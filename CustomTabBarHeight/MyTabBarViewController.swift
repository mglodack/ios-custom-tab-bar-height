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
}

/*
 Original source: https://stackoverflow.com/a/50346008/2994271
 
 This extension on UITabBar will adjust the height for all UITabBar instances.
 It is responsible for create a size that automatically calculates dimensions, so the
 viewControllers of the UITabBarController don't have to be manually adjusted when
 the height of the tabBar changes.
*/
extension UITabBar {
    static let tabBarHeight: CGFloat = 71.0
  
    /*
     Asks the view to calculate and return the size that best fits the specified size.
     
     Docs: https://developer.apple.com/documentation/uikit/uiview/1622625-sizethatfits
    */
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        guard let window = UIApplication.shared.keyWindow else {
            return super.sizeThatFits(size)
        }
        var sizeThatFits = super.sizeThatFits(size)
        if #available(iOS 11.0, *) {
            sizeThatFits.height = UITabBar.tabBarHeight + window.safeAreaInsets.bottom
        } else {
            sizeThatFits.height = UITabBar.tabBarHeight
        }
        return sizeThatFits
    }
}
