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
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                Spacer()
                Button(action: {}) {
                    Image("HeelHouseLogo")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 45)
                    
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "message.badge")
                        .resizable()
                        .frame(width: 30, height: 30)
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

}
