//
//  PersistenceManager.swift
//  github-clone
//
//  Created by Muhammed Hanifi Alma on 2.06.2021.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GitError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retriveFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retriveFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites )
                        return
                    }
                    retriveFavorites.append(favorite)
                case .remove:
                    retriveFavorites.removeAll { $0.login == favorite.login}
            
                }
                completed(save(favorites: retriveFavorites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GitError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
        
    }
    
    static func save(favorites: [Follower]) -> GitError? {
        
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
            
        } catch {
            return .unableToFavorite
        }
    }
}
