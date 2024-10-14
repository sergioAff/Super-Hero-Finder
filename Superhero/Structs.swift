//
//  Structs.swift
//  CursoAris
//
//  Created by Sergio Fernández on 30/8/24.
//

import Foundation

class Structs{
    struct Wrapper:Codable{
        let response:String
        let results:[Superhero]
    }
    struct Superhero:Codable,Identifiable{
        let id:String
        let name:String
        let image:Image
    }
    struct Image:Codable {
        let url:String
    }

    struct SuperHeroCompleted:Codable {
        let id:String
        let name:String
        let image:Image
        let powerstats:Powerstats
        let biography:Biography
    }

    struct Powerstats:Codable {
        let intelligence:String
        let strength:String
        let speed:String
        let durability:String
        let power:String
        let combat:String
    }
    
    struct Biography:Codable {
        let alignment:String
        let publisher:String
        let aliases:[String]
        let fullName:String
        
        enum CodingKeys:String, CodingKey {
            case fullName = "full-name"
            case alignment = "alignment"
            case publisher = "publisher"
            case aliases = "aliases"
        }
    }

}

