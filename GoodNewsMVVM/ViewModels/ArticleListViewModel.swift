//
//  ArticleListViewModel.swift
//  GoodNewsMVVM
//
//  Created by mohamed  habib on 20/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

//MARK: ArticleListViewModel
// List of Article
struct ArticleListViewModel {
    let articles : [Article]
}

extension ArticleListViewModel {
    var numberOfSections : Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}
