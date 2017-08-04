//
//  TweetManager.swift
//  Twitter
//
//  Created by 余語憲太 on 2017/08/05.
//  Copyright © 2017年 yogoken. All rights reserved.
//

import UIKit
import NCMB

class TweetManager: NSObject {
    static let sharedInstance = TweetManager()
    var tweets: [Tweet] = []
    
    func fetchTweets(callback: @escaping () -> Void) {
        let query = NCMBQuery(className: "Tweet")
        query?.order(byDescending: "createDate")
        query?.findObjectsInBackground { (objects, error) in
            if error == nil {
                self.tweets = []
                for object in objects! {
                    let text = (object as AnyObject).object(forKey: "text") as! String
                    let tweet = Tweet(text: text)
                    self.tweets.append(tweet)
                    callback()
                }
            }
        }
    }
}
