//
//  Step.swift
//  My Path Forward
//
//  Created by Petshack Dev on 10/13/18.
//  Copyright © 2018 Petshack Dev. All rights reserved.
//

import Foundation

struct Step: Decodable {
    var title: String?
    var description: String?
    var pointsOfContact: [User]?
}
