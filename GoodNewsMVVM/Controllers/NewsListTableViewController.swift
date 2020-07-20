//
//  NewsListTableViewController.swift
//  GoodNewsMVVM
//
//  Created by mohamed  habib on 20/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
     private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true

       //change the date from=2020-04-04 By current date
               let url = URL(string: "http://newsapi.org/v2/everything?q=bitcoin&from=2020-20-07&sortBy=publishedAt&apiKey=eb10f138ce4c4fa7b4187ddefc69bb67")!
        WebService().getArticles(url: url) { _ in
            
        }
    }
}
