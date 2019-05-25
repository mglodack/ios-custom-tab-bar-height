# ios-custom-tab-bar-height

## Goals

* Identify a solution that will customize the UITabBarController.tabBar height that supports all devices.
* Identify a solution that will customize the vertical position of the UITabBarItem.

## UITabBarItem learnings

* The UITabBarItem does not extend from UIView so there is no frame to adjust. Instead, the APIs that are provided allow you to adjust the UITabBarItem title position Offsets and the imageInsets.
