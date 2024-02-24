//
//  ProfileView.swift
//  Heel House
//
//  Created by Caitlin Estrada on 2/24/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var isPresentingScreen = false
    var body: some View {
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
            Button(action: {
                isPresentingScreen = true
            }) {
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding()
            }
            
            //SHOWCASE PROFILE HERE
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .fullScreenCover(isPresented: $isPresentingScreen) {
            ContentView()
        }
    }
}

#Preview {
    ProfileView()
}
