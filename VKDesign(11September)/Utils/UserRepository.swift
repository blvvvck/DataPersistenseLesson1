//
//  UserRepository.swift
//  VKDesign(11September)
//
//  Created by BLVCK on 30/10/2017.
//  Copyright © 2017 blvvvck production. All rights reserved.
//

import Foundation

class UserRepository {
    
    static let sharedInstance = UserRepository()
    private init() {}
    
    var users =  [UserRegistration]()
    
    func save(with user: UserRegistration) {
        users.append(user)
    }
    
    func get() -> UserRegistration? {
        if let user = users.first {
            return user
        }
        return nil
    }
}
