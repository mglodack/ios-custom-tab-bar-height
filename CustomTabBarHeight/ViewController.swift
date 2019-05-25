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
    
    public init(backgroundColor: UIColor) {
        self._backgroundColor = backgroundColor
        
        super.init(nibName: nil, bundle: nil)
        
        self.tabBarItem = UITabBarItem(
            title: "\(self._backgroundColor)",
            image: nil,
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

