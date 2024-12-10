//
//  ContentView.swift
//  jankenGame
//
//  Created by chika on 2024/12/10.
//

import SwiftUI

struct ContentView: View {
    
    @State var jankenNumber = 0
    
    var body: some View {
        VStack {
            
            Spacer()
            
            if jankenNumber == 0 {
                Text("これからじゃんけんをします！")
                    .padding()
            } else if jankenNumber == 1 {
                Image(.gu)
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text("グー")
                    .font(.largeTitle)
                    .padding()
                
            } else if jankenNumber == 2 {
                Image(.choki)
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text("チョキ")
                    .font(.largeTitle)
                    .padding()
            } else {
                Image(.pa)
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text("パー")
                    .font(.largeTitle)
                    .padding()
                
            }
            
            
            Button (action: {
                var newJankenNumber = 0
                
                repeat {
                    newJankenNumber = Int.random(in: 1...3)
                } while jankenNumber == newJankenNumber
                
                jankenNumber = newJankenNumber
            }, label: {
                Text("じゃんけんをする！")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(.pink)
                    .foregroundColor(.white)
            })
        }
        
    }
}

#Preview {
    ContentView()
}
