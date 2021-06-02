//
//  TabBar.swift
//  github-clone
//
//  Created by Muhammed Hanifi Alma on 2.06.2021.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers          = [createSearchNC(), createFavoritesNC()]
        
    }
    
    func createSearchNC() -> UINavigationController {
           let search        = Search()
           search.title      = "Search"
           search.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
           
           return UINavigationController(rootViewController: search)
       }
       
    
    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
    }
       
       func createFavoritesNC() -> UINavigationController {
           let favoritesList         = Favorites()
           favoritesList.title       = "Favorites"
           favoritesList.tabBarItem  = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
           
           return UINavigationController(rootViewController: favoritesList)
       }
       
       
       

 

}

