//
//  TimeLineTableViewController.swift
//  Twitter
//
//  Created by 余語憲太 on 2017/08/05.
//  Copyright © 2017年 yogoken. All rights reserved.
//

import UIKit
import NCMB

class TimeLineTableViewController: UITableViewController {
    @IBOutlet weak var textField: UITextField!
    let tweetManager = TweetManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        // セルの登録
        tableView.register(UINib(nibName: "TweetTableViewCell", bundle: nil), forCellReuseIdentifier: "TweetTableViewCell")
        tweetManager.fetchTweets { () in
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "投稿", style: .plain, target: self, action: #selector(TimeLineTableViewController.post))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(TimeLineTableViewController.logout))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if NCMBUser.current() == nil {
            performSegue(withIdentifier: "modalLoginViewController", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // セクション数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tweetManager.tweets.count
    }
    
    // セル数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // セルの内容
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath) as! TweetTableViewCell
        let tweet = tweetManager.tweets[indexPath.row]
        cell.nameLabel.text = "けいた"
        cell.tweetLabel.text = tweet.text
        return cell
    }
    
    //セルの高さ
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func post() {
        let tweet = Tweet(text: textField.text!)
        tweet.save{ () in
            self.tweetManager.fetchTweets { () in
                self.tableView.reloadData()
            }
        }
    }
    
    func logout() {
        NCMBUser.logOut()
        performSegue(withIdentifier: "modalLoginViewController", sender: self)
    }
}
