//
//  Comment.swift
//  My Path Forward
//
//  Created by Petshack Dev on 10/14/18.
//  Copyright © 2018 Petshack Dev. All rights reserved.
//

import Foundation

struct Comment {
    var upvoteCount: Int
    var name: String
    var timeOfPost: String
    var comment: String
    
    init(upvoteCount: Int, name: String, timeOfPost: String, comment: String) {
        self.upvoteCount = upvoteCount
        self.name = name
        self.timeOfPost = timeOfPost
        self.comment = comment
    }
}
