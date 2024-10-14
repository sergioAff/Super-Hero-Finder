//
//  SuperheroSerarcher.swift
//  CursoAris
//
//  Created by Sergio Fernández on 26/8/24.
//

import SwiftUI

struct SuperheroSerarcher: View {
    @State var superHeroName:String=""
    @State var wrapper:Structs.Wrapper? = nil
    @State var loading:Bool = false
    var body: some View {
        VStack{
            TextField("",text: $superHeroName, prompt: Text("Buscar hero").foregroundStyle(.gray).bold().font(.title3))
                .padding(20)
                .border(.purple, width: 3)
                .cornerRadius(5)
                .foregroundColor(.white)
                .bold()
                .font(.title2)
                .padding(10)
                .autocorrectionDisabled()
                .onSubmit {
                    loading=true
                    Task{
                        do{
                            
                            wrapper = try await ApiNetwork().getHeroByQuery(query: superHeroName)
                        }
                        catch{
                            print("Error")
                        }
                        loading = false
                    }
                }
            if loading {
                ProgressView().tint(.white)
            }
            
            NavigationStack {
                List(wrapper?.results ?? []){ superhero in
                    ZStack{
                        SuperHeroItem(superHero: superhero)
                        NavigationLink(destination:{superHeroDetail(id:superhero.id)}){EmptyView()}.opacity(0)
                    }.listRowBackground(Color.bgColorApp)
                    
                }.listStyle(.plain)}
            Spacer()
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(.bgColorApp)
    }
}



#Preview {
    SuperheroSerarcher()
}

