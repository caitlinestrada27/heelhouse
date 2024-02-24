//
//  Card.swift
//  Heel House
//
//  Created by Caitlin Estrada on 2/24/24.
//

import UIKit

struct Card: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let age: Int
    let bio: String
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
    
    static var data: [Card] {
        [
        Card(name: "Caitlin", imageName: "", age: 18, bio: "Freshman from New Orleans, LA."),
        Card(name: "Sanjana", imageName: "", age: 18, bio: "Freshman from Cary, NC."),
        Card(name: "Sadie", imageName: "", age: 18, bio: "Freshman from Detroit, MI."),
        Card(name: "Caroline", imageName: "", age: 19, bio: "Freshman from Chicago, IL.")
        ]
    }
}
