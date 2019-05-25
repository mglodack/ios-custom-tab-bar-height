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
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        UITabBarExtensions.setTitlePositionAdjustment()
        
        // NOTE: This is needed to perform adjustments to the tabBarItem insets
        self.tabBar.layoutSubviews()
        
        UITabBarExtensions.setImageInsetsFor(self.tabBar.items ?? [])
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

public class UITabBarExtensions {
    fileprivate static let _titleVerticalOffset: CGFloat = -10.0
    fileprivate static let _imageBottomInset: CGFloat = 5
    fileprivate static var _imageTopInset: CGFloat {
        return -_imageBottomInset
    }
    
    /*
     This method adjusts the Offset for the title of the UITabBarItem.
     
     Since UIWindow.safeAreaInsets on newer devices support swiping up from the bottom
     we have don't need to adjust the Offset since those are already accounted for.
     
     For older devices we want to adjust the UITabBarItem titlePosition upwards.
    */
    public static func setTitlePositionAdjustment() {
        guard let window = UIApplication.shared.keyWindow else { return }
        if window.safeAreaInsets.bottom > 0 { return }
        
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(
            horizontal: 0,
            vertical: _titleVerticalOffset)
    }
    
    /*
     This method adjusts the imageInsets of the UITabBarItem.
     
     Since UIWindow.safeAreaInsets on newer devices support swiping up from the bottom
     we have don't need to adjust the imageInsets since those are already accounted for.
     
     For older devices we want to adjust the UITabBarItem imageInsets upwards.
     */
    public static func setImageInsetsFor(_ tabBarItems: [UITabBarItem]) {
        guard let window = UIApplication.shared.keyWindow else { return }
        if window.safeAreaInsets.bottom > 0 { return }
        
        for tabBarItem in tabBarItems {
            tabBarItem.imageInsets = UIEdgeInsets(
                top: _imageTopInset,
                left: 0,
                bottom: _imageBottomInset,
                right: 0)
        }
    }
}
