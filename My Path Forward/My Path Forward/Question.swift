//
//  Question.swift
//  My Path Forward
//
//  Created by Petshack Dev on 10/14/18.
//  Copyright © 2018 Petshack Dev. All rights reserved.
//

import Foundation

struct Question {
    var title: String
    var numVotes: Int
    var numAnswers: Int
    var daysSincePosted: String
    var tags: String
    
    init(title: String, numVotes: Int, numAnswers: Int, daysSincePosted: String, tags: String) {
        self.title = title
        self.numVotes = numVotes
        self.numAnswers = numAnswers
        self.daysSincePosted = daysSincePosted
        self.tags = tags
    }
}
