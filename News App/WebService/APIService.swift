//
//  APIService.swift
//  News App
//
//  Created by mohamed refaat on 10/30/20.
//  Copyright © 2020 mohamed refaat. All rights reserved.
//

import Foundation

class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/emailed/1.json?api-key=wpiIxOAw104xBSa0ytUdSmMoKsqVMHT7")!
    
    func apiToGetNewsData(completion : @escaping (NewsRequest) -> ()){
        
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let newsData = try! jsonDecoder.decode(NewsRequest.self, from: data)
            
                    completion(newsData)
            }
            
        }.resume()
    }
    
}
