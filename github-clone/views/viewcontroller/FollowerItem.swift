//
//  FollowerItem.swift
//  github-clone
//
//  Created by Muhammed Hanifi Alma on 2.06.2021.
//

import UIKit

class FollowerItem: ItemInfo {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapFollowers(for: user)
    }
}
 

