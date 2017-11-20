//
//  NewsManager.swift
//  VKDesign(11September)
//
//  Created by BLVCK on 29/10/2017.
//  Copyright © 2017 blvvvck production. All rights reserved.
//

import Foundation

class NewsManager: WorkWithDataProtocol {
    typealias T = News
    
    static let sharedInstance = NewsManager()
    
    @objc var news = [News]()
    
    init() {

        if let currentNewsData = UserDefaults.standard.data(forKey: #keyPath(NewsManager.news)){
            
            guard let currentNews = NSKeyedUnarchiver.unarchiveObject(with: currentNewsData) as? [News] else { return }
            
            news = currentNews
        } 
    }
    
    func syncSave(with news: News) {
        self.news.append(news)
        let archiver = NSKeyedArchiver.archivedData(withRootObject: news)
        UserDefaults.standard.set(archiver, forKey: #keyPath(NewsManager.news))
    }
    
    func asyncSave(with news: News, completionBlock: @escaping (Bool) -> ()) {
        let operationQueue = OperationQueue()
        operationQueue.addOperation {
            self.syncSave(with: news)
            completionBlock(true)
        }
    }
    
    func syncGetAll() -> [News] {
        return news
    }
    
    func asyncGetAll(completionBlock: @escaping ([News]) -> ()) {
        let operationQueue = OperationQueue()
        operationQueue.addOperation {
            completionBlock(self.news)
        }
    }
    
    func syncFind(id: String) -> News? {
        for news in self.news {
            if news.id == id {
                return news
            }
        }
        return nil
    }
    
    func asyncFind(id: String, completionBlock: @escaping (News?) -> ()) {
        let operationQueue = OperationQueue()
        operationQueue.addOperation {
            for news in self.news {
                if news.id == id {
                    completionBlock(news)
                }
            }
            completionBlock(nil)
        }
    }
    
    
   
}


