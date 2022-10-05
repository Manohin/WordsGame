//
//  TitleText.swift
//  WordsGame
//
//  Created by Alexey Manokhin on 04.10.2022.
//

import SwiftUI

struct TitleText: View {
    @State var text: String
    var body: some View {
        Text(text)
            .padding()
            .font(.custom("AvenirNext-Bold", size: 42))
            .cornerRadius(16)
            .frame(maxWidth: .infinity)
            .background(Color("FirstPlayer"))
            .foregroundColor(.white)
    }
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        TitleText(text: "Магнитотерапия")
    }
}
