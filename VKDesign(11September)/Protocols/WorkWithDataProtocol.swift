//
//  WorkWithDataProtocol.swift
//  VKDesign(11September)
//
//  Created by BLVCK on 29/10/2017.
//  Copyright © 2017 blvvvck production. All rights reserved.
//

import Foundation

protocol WorkWithDataProtocol {
    associatedtype T
    
    func syncSave(with: T)
    func asyncSave(with: T, completionBlock: @escaping (Bool) -> ())
    func syncGetAll() -> [T]
    func asyncGetAll(completionBlock: @escaping ([T]) -> ())
    func syncFind(id: String) -> T?
    func asyncFind(id: String, completionBlock: @escaping (T?) -> ())
}
