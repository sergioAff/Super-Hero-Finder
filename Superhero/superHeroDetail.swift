//
//  superHeroDetail.swift
//  CursoAris
//
//  Created by Sergio Fernández on 30/8/24.
//

import SwiftUI

struct superHeroDetail: View {
    let id:String
    @State var superHero:Structs.SuperHeroCompleted? = nil
    @State var loading:Bool = true
    var body: some View {
        VStack{
            if loading{
                ProgressView().tint(.white)
            }else if let superHero = superHero{
                AsyncImage(url: URL(string: "\(superHero.image.url)")){ image in
                    image.resizable().scaledToFill().frame(height: 250).clipped()
                } placeholder: {
                    ProgressView()
                }.frame(width: 300, height: 300)
                Text(superHero.name).bold().font(.title).foregroundColor(.white)
                ForEach(superHero.biography.aliases, id: \.self){ alias in
                    Text(alias).foregroundColor(.gray).italic()
                }
                SuperHeroStats(stats:superHero.powerstats)
                Spacer()
            }

        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.bgColorApp).onAppear{
            
            Task{
                do{
                    superHero = try await ApiNetwork().getHeroById(id:id)
                    
                }catch{
                    superHero = nil
                    print(error)
                }
                loading = false
            }
        }
    }
}
