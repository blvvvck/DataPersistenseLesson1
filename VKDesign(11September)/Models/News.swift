//
//  News.swift
//  VKDesign(11September)
//
//  Created by BLVCK on 09/10/2017.
//  Copyright © 2017 blvvvck production. All rights reserved.
//

import Foundation
import UIKit

class News: NSObject, NSCoding {

    @objc let text: String
    var image: UIImage?
    let likesCount: String
    let commentsCount: String
    let repostsCount: String
    let name: String
    let surname: String
    let date: String
    let id: String
    
    init(text: String, image: UIImage?, likesCount: String, commentsCount: String, repostsCount: String, name: String, surname: String, date: String, id: String) {
        
        self.text = text
        self.image = image
        self.likesCount = likesCount
        self.commentsCount = commentsCount
        self.repostsCount = repostsCount
        self.name = name
        self.surname = surname
        self.date = date
        self.id = id
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: #keyPath(News.text))
        aCoder.encode(image, forKey: #keyPath(News.image))
        aCoder.encode(likesCount, forKey: #keyPath(News.likesCount))
        aCoder.encode(commentsCount, forKey: #keyPath(News.commentsCount))
        aCoder.encode(repostsCount, forKey: #keyPath(News.repostsCount))
        aCoder.encode(name, forKey: #keyPath(News.name))
        aCoder.encode(surname, forKey: #keyPath(News.surname))
        aCoder.encode(date, forKey: #keyPath(News.date))
        aCoder.encode(id, forKey: #keyPath(News.id))
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let text = aDecoder.decodeObject(forKey: #keyPath(News.text)) as? String else { return nil }
        guard let image = aDecoder.decodeObject(forKey: #keyPath(News.image)) as? UIImage else { return nil }
        guard let likesCount = aDecoder.decodeObject(forKey: #keyPath(News.likesCount)) as? String else { return nil }
        guard let commentsCount = aDecoder.decodeObject(forKey: #keyPath(News.commentsCount)) as? String else { return nil }
        guard let repostsCount = aDecoder.decodeObject(forKey: #keyPath(News.repostsCount)) as? String else { return nil }
        guard let name = aDecoder.decodeObject(forKey: #keyPath(News.name)) as? String else { return nil }
        guard let surname = aDecoder.decodeObject(forKey: #keyPath(News.surname)) as? String else { return nil }
        guard let date = aDecoder.decodeObject(forKey: #keyPath(News.date)) as? String else { return nil }
        guard let id = aDecoder.decodeObject(forKey: #keyPath(News.id)) as? String else { return nil }
        
        
        self.init(
            text: text,
            image: image,
            likesCount: likesCount,
            commentsCount: commentsCount,
            repostsCount: repostsCount,
            name: name,
            surname: surname,
            date: date,
            id: id
        )
    }
    
}
