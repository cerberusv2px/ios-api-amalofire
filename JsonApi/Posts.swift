//
//  Posts.swift
//  JsonApi
//
//  Created by Sujin Shrestha on 9/12/18.
//  Copyright © 2018 Sujin Shrestha. All rights reserved.
//

import Foundation
import UIKit

class Posts: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}
