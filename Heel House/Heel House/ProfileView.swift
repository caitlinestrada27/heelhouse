//
//  ProfileView.swift
//  Heel House
//
//  Created by Sanjana G on 2/24/24.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @State private var presentMatchView = false
    @State private var presentProfileView = false
    @State private var presentContentView = false
    
    // User attributes
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var age: String = ""
    @State private var housing: String = ""
    @State private var major: String = ""
    @State private var sleepSchedule: Int = 0
    @State private var bio: String = ""
    
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
            
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(.black)
                .padding()
                .background(Color.white)
                .edgesIgnoringSafeArea(.all)
            
            // User Info
            VStack(alignment: .leading) {
                TextField("First Name", text: $firstName)
                    .disableAutocorrection(true)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Last Name", text: $lastName)
                    .disableAutocorrection(true)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Age",text: $age)
                    .disableAutocorrection(true)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Housing",text: $housing)
                    .disableAutocorrection(true)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Major", text: $major)
                    .disableAutocorrection(true)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Bio",text: $bio)
                    .disableAutocorrection(true)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Spacer()
            
            HStack(spacing: 50){
                Button(action: {
                    presentMatchView = true
                }) {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                }
                Button(action: {
                    presentContentView = true
                }) {
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                }
                Button(action: {
                    presentProfileView = true
                }) {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                }
            }
            
            //SHOWCASE MATCHES HERE
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .fullScreenCover(isPresented: $presentMatchView) {
            MatchView()
        }
        .fullScreenCover(isPresented: $presentProfileView) {
            ProfileView()
        }
        .fullScreenCover(isPresented: $presentContentView) {
            ContentView()
        }    }

}

#Preview {
    ProfileView()
}
