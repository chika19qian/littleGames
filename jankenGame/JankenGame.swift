//
//  JankenGame.swift
//  jankenGame
//
//  Created by chika on 2024/12/10.
//

import Foundation

struct JankenGame<JankenContent> {
    private(set) var gestures: Array<Ges>
    private(set) var rivalGestures: Array<Rival> //
    
    private(set) var jankenNumber: Int = Int.random(in: 0...2)
    
    init(JankenContentFactory: (Int) -> JankenContent) {
        gestures = []
        rivalGestures = []
        
        for index in 0...2 {
            let content = JankenContentFactory(index)
            let rivalContent = JankenContentFactory(index)
            gestures.append(Ges(content: content, id:"\(index)"))
            rivalGestures.append(Rival(rivalContent: rivalContent, id: "\(index)"))

        }
    }
    
    struct Ges: Identifiable{
        let content: JankenContent
        var isFaceUp = true
        
        var id: String
    }
    
    struct Rival: Identifiable{ //
        let rivalContent: JankenContent
        
        var id: String
    }
    
    var currentRivalGesture: Rival {
            rivalGestures[jankenNumber]
        }
    
    mutating func choose(_ gesture: Ges) {
        if let chosenIndex = gestures.firstIndex(where: { $0.id == gesture.id }) {
                // 将所有元素的 isFaceUp 设置为 false
                gestures.indices.forEach { gestures[$0].isFaceUp = false }
                print("set false")
                
                // 只将选中的元素 isFaceUp 设置为 true
                gestures[chosenIndex].isFaceUp = true
            }
    }
    
    mutating func startGame() {
        
        gestures.indices.forEach { gestures[$0].isFaceUp = true }
    }
}
