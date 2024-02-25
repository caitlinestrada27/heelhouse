//
//  ProfileView.swift
//  Heel House
//
//  Created by Sanjana G on 2/24/24.
//

import Foundation
import SwiftUI

class UserData: ObservableObject {
    // User attributes
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var age: String = ""
    @Published var housing: String = ""
    @Published var major: String = ""
    @Published var sleepSchedule: Int = 0
    @Published var bio: String = ""
}

struct ProfileView: View {
    @StateObject var userData = UserData()
    @State private var presentMatchView = false
    @State private var presentProfileView = false
    @State private var presentContentView = false
    
    var body: some View {
        //user can view matches they swiped right on here
        // create list from matches where card.x > 500
        VStack{
            Spacer()
            HStack {
                Button(action: {}) {
                    Image("HeelHouseLogo")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 45)
                }
            }.padding(.horizontal)
            
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(.black)
                .background(Color.white)
                .edgesIgnoringSafeArea(.all)
            
            HStack{
                Spacer()
                // User Info
                VStack(alignment: .leading) {
                    Text("First Name: \(userData.firstName)")
                    TextField("First Name", text: $userData.firstName)
                        .disableAutocorrection(true)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Last Name: \(userData.lastName)")
                    TextField("Last Name", text: $userData.lastName)
                        .disableAutocorrection(true)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Age: \(userData.age)")
                    TextField("Age",text: $userData.age)
                        .disableAutocorrection(true)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Housing: \(userData.housing)")
                    TextField("Housing",text: $userData.housing)
                        .disableAutocorrection(true)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Major: \(userData.major)")
                    TextField("Major", text: $userData.major)
                        .disableAutocorrection(true)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Bio: \(userData.bio)")
                    TextField("Bio",text: $userData.bio)
                        .disableAutocorrection(true)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Spacer()
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
