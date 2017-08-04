//
//  Tweet.swift
//  Twitter
//
//  Created by 余語憲太 on 2017/08/05.
//  Copyright © 2017年 yogoken. All rights reserved.
//

import UIKit
import NCMB

class Tweet: NSObject {
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    func save(callback: @escaping () -> Void) {
        let tweetObject = NCMBObject(className: "Tweet")
        tweetObject?.setObject(text, forKey: "text")
        tweetObject?.saveInBackground { (error) in
            if error == nil {
                callback()
            }
        }
    }
}
