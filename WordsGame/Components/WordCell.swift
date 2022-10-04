//
//  WordCell.swift
//  WordsGame
//
//  Created by Alexey Manokhin on 05.10.2022.
//

import SwiftUI

struct WordCell: View {
    
    
    let word: String
    var body: some View {
        HStack {
            Text(word)
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding()
            Text("\(word.count)")
                .padding()
        }.font(.custom("AvenirNext-Bold", size: 22))
            .foregroundColor(.white)
    }
}

struct WordCell_Previews: PreviewProvider {
    static var previews: some View {
        WordCell(word: "Магнит")
    }
}
