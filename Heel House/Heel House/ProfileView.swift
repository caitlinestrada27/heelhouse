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
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var age: String = ""
    @State var housing: String = ""
    @State var major: String = ""
    @State var sleepSchedule: Int = 0
    @State var bio: String = ""
    
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
                Text("First Name: \(firstName)")
                TextField("First Name", text: $firstName)
                    .disableAutocorrection(true)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Last Name: \(lastName)")
                TextField("Last Name", text: $lastName)
                    .disableAutocorrection(true)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Age: \(age)")
                TextField("Age",text: $age)
                    .disableAutocorrection(true)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Housing: \(housing)")
                TextField("Housing",text: $housing)
                    .disableAutocorrection(true)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Major: \(major)")
                TextField("Major", text: $major)
                    .disableAutocorrection(true)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Bio: \(bio)")
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
