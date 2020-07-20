//
//  WebService.swift
//  GoodNewsMVVM
//
//  Created by mohamed  habib on 20/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
class WebService {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> (Void))  {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                           print(error.localizedDescription)
                           completion(nil)
            }else if let data = data {
                
              //  try? JSONDecoder().decode([Article].self, from: data) => return nil because article array inside dictionnary
                  let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                             if let articleList = articleList {
                                 completion(articleList.articles)
                             }
                             print(articleList?.articles)
            }
        }.resume()
    }
}

