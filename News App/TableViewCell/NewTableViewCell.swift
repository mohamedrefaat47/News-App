//
//  NewTableViewCell.swift
//  News App
//
//  Created by mohamed refaat on 10/30/20.
//  Copyright © 2020 mohamed refaat. All rights reserved.
//

import UIKit


class NewTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedByLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var articleImg: UIImageView!
    
    
    var imgUrl : String!

    var new : Results? {
        didSet {
            titleLabel.text = new?.title
            publishedByLabel.text = new?.source
            publishedDateLabel.text = new?.published_date
            articleImg.load(url: URL(string: new?.media?.first?.media_metadata?.first?.url ?? "") ??  URL(string: "")! )
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
