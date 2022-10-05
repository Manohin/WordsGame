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
    @State var isAlersPresentShort = false
    @State var isAlersPresentNone = false
    @State var isAlersPresentDigit = false
    @State var isShowedGame = false
    var digit: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
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

                if bigWord.contains(digit) {
                    self.isAlersPresentDigit.toggle()
                    return
                }

                if bigWord.count == 0 {
                    self.isAlersPresentNone.toggle()
                    return
                }

                if bigWord.count > 7 {
                    isShowedGame.toggle()
                } else { self.isAlersPresentShort.toggle()
                }
            }
        label: {
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
            .alert("Слово слишком короткое", isPresented: $isAlersPresentShort, actions: {
                Text("OK!")
            })
            .alert("Введите слово", isPresented: $isAlersPresentNone, actions: {
                Text("OK!")
            })
            .alert("Слово не должно содержать цифры", isPresented: $isAlersPresentDigit, actions: {
                Text("OK!")
            })
            .fullScreenCover(isPresented: $isShowedGame) {

                let name1 = player1 == "" ? "Игрок 1" : self.player1
                let name2 = player2 == "" ? "Игрок 2" : self.player2

                let player1 = Player(name: name1)
                let player2 = Player(name: name2)
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
