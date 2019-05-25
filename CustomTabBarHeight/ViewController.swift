//
//  ViewController.swift
//  CustomTabBarHeight
//
//  Created by Mathew Glodack on 5/25/19.
//  Copyright © 2019 glodack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate let _backgroundColor: UIColor
    fileprivate let _tabBarTitle: String
    
    public init(backgroundColor: UIColor, tabBarTitle: String) {
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "American Typewriter", size: 14)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "American Typewriter", size: 14)!], for: .selected)
        
        self._backgroundColor = backgroundColor
        self._tabBarTitle = tabBarTitle
        
        super.init(nibName: nil, bundle: nil)
        
        self.tabBarItem = UITabBarItem(
            title: _tabBarTitle,
            image: UIImage(named: "tab_bar_icon"),
            selectedImage: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = _backgroundColor
    }
}

