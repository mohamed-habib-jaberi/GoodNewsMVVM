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
    
    private var articleListVM : ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        //change the date from=2020-04-04 By current date
        let url = URL(string: "http://newsapi.org/v2/everything?q=bitcoin&from=2020-20-07&sortBy=publishedAt&apiKey=eb10f138ce4c4fa7b4187ddefc69bb67")!
        
        WebService().getArticles(url) { (articles) -> (Void) in
            
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else { fatalError("ArticleTableViewCell is not found")  }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
}
