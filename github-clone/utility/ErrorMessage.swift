//
//  ErrorMessage.swift
//  github-clone
//
//  Created by Muhammed Hanifi Alma on 2.06.2021.
//

import Foundation

enum GitError: String, Error {
    case invalidUsername    = "This username created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
    case unableToFavorite   = "There was an error getting favorites "
    case alreadyInFavorites = "You've already favoried this user"
}

