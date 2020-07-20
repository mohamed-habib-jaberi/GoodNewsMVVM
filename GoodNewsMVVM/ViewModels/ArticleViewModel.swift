//
//  ArticleViewModel.swift
//  GoodNewsMVVM
//
//  Created by mohamed  habib on 20/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

//MARK: ArticleViewModel
// Single Article

struct ArticleViewModel {
    private let article : Article
    
    var title : String {
           return self.article.title
       }
    var description : String {
           return self.article.description
       }
}
extension ArticleViewModel {
    init(_ article : Article) {
        self.article = article
    }
}

