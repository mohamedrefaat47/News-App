//
//  ViewController.swift
//  News App
//
//  Created by mohamed refaat on 10/30/20.
//  Copyright © 2020 mohamed refaat. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController,UITableViewDelegate {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    private var newsViewModel : NewsViewModel!
    
    private var dataSource : NewTableViewDataSource<NewTableViewCell,Results>!
    

    @IBOutlet weak var indecator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
        indecator.isHidden = false
        indecator.startAnimating()
        newsTableView.delegate = self
    }
    
    func callToViewModelForUIUpdate(){
        
        self.newsViewModel =  NewsViewModel()
        self.newsViewModel.bindNewsViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        
        self.dataSource = NewTableViewDataSource(cellIdentifier: "NewTableViewCell", items: self.newsViewModel.newsData.results ?? [], configureCell: { (cell, evm) in
            cell.titleLabel.text = evm.title
            cell.publishedByLabel.text = evm.source
            cell.publishedDateLabel.text = evm.published_date
            cell.articleImg.load(url: URL(string: evm.media?.first?.media_metadata?.first?.url ?? "") ??  URL(string: "https://static01.nyt.com/images/2020/10/29/opinion/29bruniWeb/merlin_178687026_2944ebe2-4411-4d45-9eab-7951f9a495b8-mediumThreeByTwo210.jpg")! )

        })
        
        DispatchQueue.main.async {
            self.indecator.isHidden = true
            self.indecator.stopAnimating()
            self.newsTableView.dataSource = self.dataSource
            self.newsTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell : NewTableViewCell = tableView.cellForRow(at: indexPath) as! NewTableViewCell

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let vc = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.article = Article(articleTitle: cell.titleLabel.text ?? "",
                             publishedByLabel: cell.publishedByLabel.text ?? "",
                             publishedDateLabel: cell.publishedDateLabel.text ?? ""
                             )
        vc.articleImg = cell.articleImg.image
        
        self.navigationController?.pushViewController(vc, animated: true)
        
            
        }
  

}

