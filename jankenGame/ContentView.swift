//
//  ContentView.swift
//  jankenGame
//
//  Created by chika on 2024/12/10.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: PictureJankenGame
    
    var body: some View {
        VStack {
            Image(.gu)
                .resizable()
                .frame(width: 200, height: 200)
                .transition(.opacity)
                // Add Picture
            Spacer()
            Button(action: {
                print("Tapped")
                viewModel.startGame()
            }, label: {
                Text("ゲームを始めましょう")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(.pink)
                    .foregroundColor(.white)})
            Spacer()
            HStack {
                gestures
            }.padding()
            
            
        }
    }
    
    var rivalGesture: some View {
        Image(.gu)
    }
    
    var gestures: some View {
        ForEach(viewModel.gestures){
            gesture in GesView(gesture)
                .aspectRatio(2/3, contentMode: .fit)
                .padding(2)
                .onTapGesture {
                    viewModel.choose(gesture)
                    print("choose")
                }
        }.foregroundColor(Color(red: 255/255, green: 130/255, blue: 140/255))
    }
    
    
}

struct GesView: View {
    var gesture: JankenGame<String>.Ges
    
    init(_ gesture: JankenGame<String>.Ges) {
        self.gesture = gesture
    }
    
    var body: some View {
        ZStack {
            let base: RoundedRectangle =
                RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth:3)
                Text(gesture.content)
                    .font(.system(size: 80))
            }
            .opacity(gesture.isFaceUp ? 1:0)
        }
        
        
    }
}

struct ImageView: View {
    var rivalGesture: JankenGame<String>.Rival
    
    init(_ rivalGesture: JankenGame<String>.Rival) {
        self.rivalGesture = rivalGesture
    }
    
    var body: some View {
        
        Image(rivalGesture.rivalContent)
            .resizable()
            .frame(width: 200, height: 200)
            .transition(.opacity)
            
                    
    }
}

#Preview {
    ContentView(viewModel: PictureJankenGame())
}
