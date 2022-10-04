//
//  ContentView.swift
//  WordsGame
//
//  Created by Alexey Manokhin on 04.10.2022.
//

import SwiftUI

struct StartView: View {
    @State var bigWord = ""
    @State var player1 = ""
    @State var player2 = ""
    
    @State var isShowedGame = false
    
    var body: some View {
        VStack {
            
       TitleText(text: "Words Game")
            
            WordsTextField(word: $bigWord, placeHolder: "Введите длинное слово")
            .padding(20)
            .padding(.top, 32)
            
            WordsTextField(word: $player1, placeHolder: "Игрок1")
            .cornerRadius(12)
            .padding(.horizontal, 20)
            
            WordsTextField(word: $player2, placeHolder: "Игрок2")
            .cornerRadius(12)
            .padding(.horizontal, 20)
            
            Button {
                isShowedGame.toggle()
            } label: {
                Text("Старт")
                    .font(.custom("AvenirNext-Bold", size: 30))
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 64)
                    .background(Color("FirstPlayer"))
                    .cornerRadius(40)
                    .padding(.top)
            }

        }.background(Image("background"))
            .fullScreenCover(isPresented: $isShowedGame) {
                
                let player1 = Player(name: self.player1)
                let player2 = Player(name: self.player2)
                let gameViewModel = GameViewModel(player1: player1, player2: player2, word: bigWord)
                
                GameView(viewModel: gameViewModel)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
