//
//  Path.swift
//  My Path Forward
//
//  Created by Petshack Dev on 10/13/18.
//  Copyright © 2018 Petshack Dev. All rights reserved.
//

import Foundation

struct Path: Decodable {
    var title: String?
    var description: String?
    var steps: [Step]?
    var done: Bool?
}
