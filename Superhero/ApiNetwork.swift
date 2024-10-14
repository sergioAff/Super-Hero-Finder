//
//  ApiNetwork.swift
//  CursoAris
//
//  Created by Sergio Fernández on 29/8/24.
//

import Foundation

class ApiNetwork{

    let token = "18e41ee33de4178fb0aac315a2c5e9e6"

    func getHeroByQuery(query:String) async throws-> Structs.Wrapper {

        let url  = URL(string: "https://superheroapi.com/api/\(token)/search/\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(Structs.Wrapper.self, from: data)

    }
    
    func getHeroById(id:String) async throws -> Structs.SuperHeroCompleted {
        let url  = URL(string: "https://superheroapi.com/api/\(token)/\(id)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(Structs.SuperHeroCompleted.self, from: data)
    }
}
