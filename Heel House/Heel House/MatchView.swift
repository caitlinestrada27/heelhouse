//
//  MatchView.swift
//  Heel House
//
//  Created by Sanjana G on 2/24/24.
//

import Foundation
import SwiftUI

struct MatchView: View {
    @State private var isPresentingScreen = false
    var body: some View {
        //user can view matches they swiped right on here
        // create list from matches where card.x > 500
        VStack{
            HStack {
                Button(action: {}) {
                    Image("HeelHouseLogo")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 45)
                    
                }
            }.padding(.horizontal)
            
            Text("Matches")
                .font(.largeTitle)
                .foregroundColor(.black)
                .padding()
                .background(Color.white)
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                isPresentingScreen = true
            }) {
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding()
            }
            
            //SHOWCASE MATCHES HERE
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .fullScreenCover(isPresented: $isPresentingScreen) {
            ContentView()
        }
    }
    static var matches: [Card] {
        [
            Card(name: "Caitlin", imageName: "caitlin", age: 18, housing: "Granville, Shortbread", major: "CS and Business", compatibility: 94, bio: "Freshman from New Orleans, LA."),
            Card(name: "Sanjana", imageName: "sanjana", age: 18, housing: "Granville, Union", major: "CS and AD/PR", compatibility: 65, bio: "Freshman from Cary, NC."),
            Card(name: "Sadie", imageName: "sadie", age: 18, housing: "Granville, Shortbread", major: "CS and Economics", compatibility: 78, bio: "Freshman from Detroit, MI."),
            Card(name: "Caroline", imageName: "caroline", age: 19, housing: "Eringhaus, Phi Mu House", major: "CS", compatibility: 88, bio: "Freshman from Chicago, IL.")
        ]
    }
}
