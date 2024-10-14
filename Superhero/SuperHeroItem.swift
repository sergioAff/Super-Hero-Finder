//
//  SuperHeroItem.swift
//  CursoAris
//
//  Created by Sergio Fernández on 29/8/24.
//

import SwiftUI

struct SuperHeroItem: View {
    let superHero:Structs.Superhero
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: "\(superHero.image.url)")){ image in
                image.resizable().scaledToFill()
            } placeholder: {
                ProgressView()
            }.frame(width: 300, height: 300)
            VStack{
                Spacer()
                Text(superHero.name).font(.title).foregroundStyle(.white).bold().padding().frame(maxWidth: .infinity).background(.white.opacity(0.5))
            }
        }.frame(height: 350).cornerRadius(20)
    }
}

 
