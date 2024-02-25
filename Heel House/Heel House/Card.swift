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
    var score: [Int] = []
    var matches: [Card] = []
    
    static var data: [Card] {
        [
            Card(name: "Caitlin", imageName: "caitlin", age: 18, bio: "Freshman from New Orleans, LA."),
            Card(name: "Sanjana", imageName: "sanjana", age: 18, bio: "Freshman from Cary, NC."),
            Card(name: "Sadie", imageName: "sadie", age: 18, bio: "Freshman from Detroit, MI."),
            Card(name: "Caroline", imageName: "caroline", age: 19, bio: "Freshman from Chicago, IL.")
        ]
    }
    mutating func find_score(){
        print("Answer the following statements on a scale of 1 to 5:")
        print("I go to bed early (1); I go to bed late (5): ")
        self.score.append(Int(readLine()!)!)
        
        print("I wake up early (1); I wake up late (5): ")
        self.score.append(Int(readLine()!)!)
        
        print("I would prefer no guests in our room (1); the more the merrier (5): ")
        self.score.append(Int(readLine()!)!)
        
        print("I prefer to stay in most nights (1), I love going out (5): ")
        self.score.append(Int(readLine()!)!)
        
        print("My goal is to cohabit peacefully (1); I hope to be close with my roommate (5): ")
        self.score.append(Int(readLine()!)!)
    }
    
    func compatibility(match: Card) -> Double {
        var diff = 0
        var idx = 0
        while idx < score.count { // count means length
            // find abs value of difference
            diff += abs(match.score[idx] - self.score[idx])
            idx += 1
        }
        var percent = Double (100 * (diff/(5 * (score.count-1))))
        percent = 100 - percent
        return percent
    }
    
    // to put matches in order:
    // check that both said yes
    // order based on highest percentage
    
    mutating func matched() {
        // see if the people
        // add all of person
        
    }
    
    mutating func insertCompat() {
        // order stuff based on compatibility
        // call compatibility on each user
        // after decision
    }
}
