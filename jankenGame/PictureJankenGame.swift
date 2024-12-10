//
//  PictureJankenGame.swift
//  jankenGame
//
//  Created by chika on 2024/12/10.
//

import SwiftUI

class PictureJankenGame: ObservableObject {
    private static let gestures = ["✊🏻", "✌🏻", "🖐🏻"]
    private static let images = ["gu","choki","pa"]
    
    private static func createJankenGame() -> JankenGame<String> {
        return JankenGame { index in
            if gestures.indices.contains(index){
                return gestures[index]
            } else {
                return "?"
            }
        }
    }
    
    
    @Published private var model = createJankenGame()
    

    
    var gestures: Array<JankenGame<String>.Ges> {
        return model.gestures
    }
    
    func choose(_ gesture: JankenGame<String>.Ges) {
        model.choose(gesture)
    }
    
    func startGame() {
        model.startGame()
    }
}
