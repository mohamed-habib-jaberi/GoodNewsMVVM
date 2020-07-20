//
//  WebService.swift
//  GoodNewsMVVM
//
//  Created by mohamed  habib on 20/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
class WebService {
    
    func getArticles(url: URL, completion: @escaping ([Any]?) -> (Void))  {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                           print(error.localizedDescription)
                           completion(nil)
            }else if let data = data {
                print(data)
            }
        }.resume()
    }
}

