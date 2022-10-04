//
//  GameView.swift
//  WordsGame
//
//  Created by Alexey Manokhin on 04.10.2022.
//

import SwiftUI

struct GameView: View {
    @State private var word = ""
    var viewModel: GameViewModel
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button {
                    print("Quit")
                } label: {
                    Text("Выход")
                        .padding(6)
                        .padding(.horizontal)
                        .background(Color("Orange"))
                        .cornerRadius(12)
                        .padding(6)
                        .foregroundColor(.white)
                        .font(.custom("AvenirNext-Bold",
                                      size: 18))
                }
                
                Spacer()
            }
            
            
            Text(viewModel.word)
                .font(.custom("AvenirNext-Bold",
                              size: 30))
                .foregroundColor(.white)
            
            HStack(spacing: 12) {
                
                
                VStack {
                    
                    Text("\(viewModel.player1.score)")
                        .font(.custom("AvenirNext-Bold",
                                      size: 60))
                        .foregroundColor(.white)
                    Text("\(viewModel.player1.name)")
                        .font(.custom("AvenirNext-Bold",
                                      size: 24))
                        .foregroundColor(.white)
                    
                }.padding(20)
                    .frame(width: screen.width / 2.2 ,
                           height: screen.width / 2.2)
                    .background(Color("FirstPlayer"))
                    .cornerRadius(40)
                    .shadow(color: .red, radius: 4)
                VStack {
                    
                    Text("\(viewModel.player2.score)")
                        .font(.custom("AvenirNext-Bold",
                                      size: 60))
                        .foregroundColor(.white)
                    Text("\(viewModel.player2.name)")
                        .font(.custom("AvenirNext-Bold",
                                      size: 24))
                        .foregroundColor(.white)
                    
                }.padding(20)
                    .frame(width: screen.width / 2.2 ,
                           height: screen.width / 2.2)
                    .background(Color("SecondPlayer"))
                    .cornerRadius(40)
                    .shadow(color: .purple, radius: 4)
            }
            WordsTextField(word: $word, placeHolder: "Ваше слово...")
                .padding(.horizontal)
                .padding(.vertical)
            Button {
               let score = viewModel.check(word: word)
                if score > 0 {
                    self.word = ""
                }
            } label: {
                Text("Готово")
                    .padding(12)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color("Orange"))
                    .cornerRadius(20)
                    .font(.custom("AvenirNext-Bold",
                                  size: 27))
                    .padding(.horizontal)
                
            }
            List {
                
            }.listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .colorMultiply(.clear)
            
        }.background(Image("background"))
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(player1: Player(name: "Игрок1"),
                                          player2: Player(name: "Игрок2"),
                                          word: "Слово"))
    }
}
