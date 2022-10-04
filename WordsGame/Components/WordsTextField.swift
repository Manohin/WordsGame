//
//  WordsTextField.swift
//  WordsGame
//
//  Created by Alexey Manokhin on 04.10.2022.
//

import SwiftUI

struct WordsTextField: View {
    
    @State var word: Binding<String>
    var placeHolder: String
    var body: some View {
            
            TextField(placeHolder,
                      text: word)
            .font(.title2)
            .padding()
            .background(.white)
            .cornerRadius(12)
    }
}


