//
//  RepoItem.swift
//  github-clone
//
//  Created by Muhammed Hanifi Alma on 2.06.2021.
//

import UIKit

class RepoItem: ItemInfo {
    
     override func viewDidLoad() {
           super.viewDidLoad()
           configureItems()
       }
       
       
       private func configureItems() {
           itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
           itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
           actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
       }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}


