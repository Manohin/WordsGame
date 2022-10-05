//
//  GameView.swift
//  WordsGame
//
//  Created by Alexey Manokhin on 04.10.2022.
//

import SwiftUI

struct GameView: View {
    @State private var word = ""
    @State private var isAlertPresent = false
    @State var alertText = ""
    var viewModel: GameViewModel

    @Environment(\.dismiss) var dismiss
    @State private var confirmPresent = false
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button {
                    confirmPresent.toggle()

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
                    .shadow(color: viewModel.isFirst ? .red : .clear, radius: 6)
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
                    .shadow(color: viewModel.isFirst ? .clear : .purple, radius: 6)
            }
            WordsTextField(word: $word, placeHolder: "Ваше слово...")
                .padding(.horizontal)
                .padding(.vertical)
            Button {

                var score = 0
                do {
                    try score = viewModel.check(word: word)
                } catch WordError.beforeWord {

                    alertText = ("Прояви фантазию, придумай новое слово, которого еще не было!")
                    isAlertPresent.toggle()
                } catch WordError.littleWord {
                    alertText = ("Введи слово хотя бы из 2 букв")
                    isAlertPresent.toggle()
                } catch WordError.theSameWord {
                    alertText = ("Cамый умный? Составленное слово не должно быть исходным словом!")
                    isAlertPresent.toggle()
                } catch WordError.wrongWord {
                    alertText = ("Такое слово не может быть составлено!")
                    isAlertPresent.toggle()
                } catch {
                    alertText = ("Неизвестная ошибка")
                    isAlertPresent.toggle()
                }

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

                ForEach(0 ..< self.viewModel.words.count, id: \.description ) { item in
                    WordCell(word: self.viewModel.words[item])
                        .background(item % 2 == 0 ? Color("FirstPlayer") : Color("SecondPlayer"))
                        .listRowInsets(EdgeInsets())
                }

            }.listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color .clear)

        }.background(Image("background"))
            .confirmationDialog("Хочешь съебаться?",
                                isPresented: $confirmPresent,
                                titleVisibility: .visible) {
                Button(role: .destructive) {
                    self.dismiss()

                } label: {
                    Text("Уйти нахуй отседова")
                }
                Button(role: .cancel) {

                } label: {
                    Text("Остаюсь") }
            }

                                .alert(alertText,
                                       isPresented: $isAlertPresent) {
                                    Text("OK, понял")
                                }
    }

}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(player1: Player(name: "Игрок1"),
                                          player2: Player(name: "Игрок2"),
                                          word: "Слово"))
    }
}
