//
//  NewsViewModel.swift
//  News App
//
//  Created by mohamed refaat on 10/30/20.
//  Copyright © 2020 mohamed refaat. All rights reserved.
//

import Foundation

class NewsViewModel : NSObject {
    
    private var apiService : APIService!
    
    private(set) var newsData : NewsRequest! {
           didSet {
               self.bindNewsViewModelToController()
           }
       }
       
       var bindNewsViewModelToController : (() -> ()) = {}
       
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetNewsData()
    }
    
    func callFuncToGetNewsData() {
        self.apiService.apiToGetNewsData { (newsData) in
            print(newsData)
            self.newsData = newsData
        }
    }
}
