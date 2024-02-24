//
//  Card.swift
//  Heel House
//
//  Created by Caitlin Estrada on 2/24/24.
//

import SwiftUI
import UIKit

struct Card: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let age: Int
    let housing: String
    let major: String
    @State var compatibility: Int
    let bio: String
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
    
    static var data: [Card] {
        [
            Card(name: "Caitlin", imageName: "caitlin", age: 18, housing: "Granville, Shortbread", major: "CS and Business", compatibility: 94, bio: "Freshman from New Orleans, LA."),
            Card(name: "Sanjana", imageName: "sanjana", age: 18, housing: "Granville, Union", major: "CS and AD/PR", compatibility: 65, bio: "Freshman from Cary, NC."),
            Card(name: "Sadie", imageName: "sadie", age: 18, housing: "Granville, Shortbread", major: "CS and Economics", compatibility: 78, bio: "Freshman from Detroit, MI."),
            Card(name: "Caroline", imageName: "caroline", age: 19, housing: "Eringhaus, Phi Mu House", major: "CS", compatibility: 88, bio: "Freshman from Chicago, IL.")
        ]
    }
}
