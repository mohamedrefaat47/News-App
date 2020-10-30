//
//  DetailsViewController.swift
//  News App
//
//  Created by mohamed refaat on 10/30/20.
//  Copyright © 2020 mohamed refaat. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var article : Article = Article(articleTitle: "",publishedByLabel: "",publishedDateLabel: "")

    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var publishedBy: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    
    
    var articleImg : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        
        
        articleImage.image = articleImg
        articleTitle.text = article.articleTitle
        publishedBy.text = article.publishedByLabel
        publishedDate.text = article.publishedDateLabel

        
    }



}
