//
//  ContentView.swift
//  Heel House
//
//  Created by Caitlin Estrada on 2/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Top Stack
            HStack {
                Button(action: {}) {
                    Image(systemName: "person.crop.circle")
                }
                Spacer()
                Button(action: {}) {
                    Image("HeelHouseLogo")
                        .resizable().aspectRatio(contentMode: .fit).frame(height: 45)
                    
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "message.badge")
                }
            }.padding(.horizontal)
            // Card
            ZStack {
                ForEach(Card.data.reversed()) { card in
                    CardView(card: card).padding(8)
                }
            }.zIndex(1.0)
            // Bottom Stack
            HStack(spacing: 0){
                    Button(action: {}) {
                        Image(systemName: "arrow.clockwise")
                    }
                    Button(action: {}) {
                        Image(systemName: "xmark")
                    }
                    Button(action: {}) {
                        Image(systemName: "star.fill")
                    }
                    Button(action: {}) {
                        Image(systemName: "heart.fill")
                    }
                    Button(action: {}) {
                        Image(systemName: "bolt.fill")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    @State var card: Card
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(card.imageName).resizable()
            LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
            VStack {
                Spacer()
                VStack(alignment: .leading){
                    HStack {
                        Text(card.name).font(.largeTitle).fontWeight(.bold)
                        Text(String(card.age)).font(.title)
                    }
                    Text(card.bio)
                }
            }
            .padding()
            .foregroundColor(.white)
        }
        // match or nope
        HStack {
            Image("match") // Replace with match icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
                .opacity(Double(card.x/10 - 1))
            Spacer()
            Image("pass") // Replace with nope icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
                .opacity(Double(card.x/10 * -1 - 1))
        }
        .cornerRadius(8)
        // Step 1 - ZStack follows the coordinates of the card model
        .offset(x: card.x, y: card.y)
        .rotationEffect(.init(degrees: card.degree))
        // Step 2 - gesture recognizer updaets the coordinate values of the card model
        .gesture ( // Google how to implement .gesture
            
            DragGesture()
            
                .onChanged { value in
                    // user is dragging the view
                    withAnimation(.default) {
                        card.x = value.translation.width
                        card.y = value.translation.height
                        card.degree = 7 * (value.translation.width > 0 ? 1 : -1)
                    }
                }
            
                .onEnded { value in
                    // do something when the user stops dragging
                    withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) { // creates bouncing effect
                        switch value.translation.width {
                            case 0...100: // if value is 0-100, card returns to original position
                                card.x = 0; card.degree = 0; card.y = 0;
                            case let x where x > 100: // if user swipes right, card leaves screen
                                card.x = 500; card.degree = 12
                            case (-100)...(-1): // if user swipes left, card leaves screen
                                card.x = -500; card.y = 0
                            default: card.x = 0; card.y = 0
                        }
                    }
                }
        )
    }
}
