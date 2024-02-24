//
//  ContentView.swift
//  Heel House
//
//  Created by Caitlin Estrada, Sadie Sawyer, Caroline Bryan, Sanjana Gopalswamy on 2/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Text("No more roommates!")
                .font(.title)
                .foregroundColor(.blue)
                .zIndex(0) // puts behind other in view
            VStack {
                // Top Stack
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
                // Card
                ZStack {
                    ForEach(Card.data.reversed()) { card in
                        CardView(card: card).padding(8)
                    }
                }.zIndex(1.0)
                // Bottom Stack
                HStack(spacing: 50){
                    Button(action: {}) {
                        Image(systemName: "arrow.clockwise")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    Button(action: {}) {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    Button(action: {}) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    Button(action: {}) {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    Button(action: {}) {
                        Image(systemName: "bolt.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
            }

        }
    }
}

struct CardView: View {
    @State var card: Card
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                Image(card.imageName)
                    .resizable()
                LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
                VStack {
                    Spacer()
                    VStack(alignment: .leading){
                        HStack {
                            Text(card.name).font(.largeTitle).fontWeight(.bold)
                            Text(String(card.age)).font(.title)
                        }
                        Text(card.housing)
                        Text(card.major)
                        Text("\(card.compatibility)%")
                        Text(card.bio)
                    }
                }
                .padding()
                .foregroundColor(.white)
            }
            .cornerRadius(8)
            .offset(x: card.x, y: card.y)
            .rotationEffect(.init(degrees: card.degree))
            .gesture (
                DragGesture()
                    .onChanged { value in
                        withAnimation(.default) {
                            card.x = value.translation.width
                            card.y = value.translation.height
                            card.degree = 7 * (value.translation.width > 0 ? 1 : -1)
                        }
                    }
                    .onEnded { value in
                        withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                            // let screenEdgeX = geometry.size.width * 0.8
                            switch value.translation.width {
                                case 0...100:
                                    card.x = 0; card.degree = 0; card.y = 0
                                case let x where x > 100:
                                    card.x = 500; card.degree = 12 // Moved off to the right
                                case (-100)...(-1):
                                    card.x = -500; card.degree = -12 // Moved off to the left
                                case let x where x < -100:
                                card.x = -500; card.degree = -12
                                default:
                                    card.x = 0; card.y = 0
                            }
                        }
                    }
            )
            .opacity(card.x == 0 ? 1 : 0) // Hide the card if it's not at the center
        }
    }
}

#Preview {
    ContentView()
}
