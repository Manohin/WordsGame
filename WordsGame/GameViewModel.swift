//
//  GameViewModel.swift
//  WordsGame
//
//  Created by Alexey Manokhin on 04.10.2022.
//

import Foundation

class GameViewModel: ObservableObject {
    
    @Published var player1: Player
    @Published var player2: Player
    @Published var words = [String]()
    
    let word: String
    var isFirst = true
    
    init(player1: Player, player2: Player, word: String) {
        self.player1 = player1
        self.player2 = player2
        self.word = word.uppercased()
    }
    
    func validate (word:String) -> Bool {
        let word = word.uppercased()
        guard word != self.word else {
            print("Думаешь самый умный? Составленное слово не должно быть исходным словом!")
            return false
        }
        
        guard !(words.contains(word)) else {
            print("Прояви фантазию, придумай новое слово, которого еще не было!")
            return false
        }
        guard word.count > 1 else {
            print("Слишком короткое слово")
            return false
        }
        return true
    }
    
}
