//
//  Article.swift
//  News App
//
//  Created by mohamed refaat on 10/30/20.
//  Copyright © 2020 mohamed refaat. All rights reserved.
//

import Foundation

class Article: NSObject {
    var articleTitle: String?
    var publishedByLabel: String?
    var publishedDateLabel: String?
    
     init(articleTitle: String,publishedByLabel: String,publishedDateLabel: String) {
        self.articleTitle = articleTitle
        self.publishedByLabel = publishedByLabel
        self.publishedDateLabel = publishedDateLabel
       
    }
    
}

