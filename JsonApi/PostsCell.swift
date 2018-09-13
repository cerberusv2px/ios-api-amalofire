//
//  Post.swift
//  JsonApi
//
//  Created by Sujin Shrestha on 9/12/18.
//  Copyright © 2018 Sujin Shrestha. All rights reserved.
//

import Foundation
import UIKit

class PostsCell: UITableViewCell {
    
    @IBOutlet weak var textTitle: UILabel!
    
    @IBOutlet weak var textDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
