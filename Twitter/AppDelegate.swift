//
//  AppDelegate.swift
//  Twitter
//
//  Created by 余語憲太 on 2017/08/04.
//  Copyright © 2017年 yogoken. All rights reserved.
//

import UIKit
import NCMB

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    //********** APIキーの設定 **********
    let applicationkey = "1e677f9fe6ed2acfa53e900f0ab639c289bb981734fbf5af68f93432836ceda4"
    let clientkey      = "523bf0891261378a1e825d8a6ee3c7a1731ba351b84c34c010774751fcc9c89d"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //********** SDKの初期化 **********
        NCMB.setApplicationKey(applicationkey, clientKey: clientkey)
        //▼▼▼起動時に処理される▼▼▼
        // データストアにデータを保存
        let obj = NCMBObject(className: "TestClass")
        obj?.setObject("Hello, NCMB!", forKey: "message")
        obj?.saveInBackground({ (error) in
            if error != nil {
                // 保存に失敗した場合の処理
            } else {
                // 保存に成功した場合の処理
            }
        })
        //▲▲▲起動時に処理される▲▲▲
        return true
    }
}
