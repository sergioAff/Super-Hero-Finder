//
//  SuperHeroStats.swift
//  CursoAris
//
//  Created by Sergio Fernández on 30/8/24.
//

import SwiftUI
import Charts

struct SuperHeroStats: View {
    let stats:Structs.Powerstats
    var body: some View {
        VStack{
            Chart{
                SectorMark(angle: .value("Count", Int(stats.combat) ?? 0), innerRadius: .ratio(0.6), angularInset: 2).cornerRadius(5).foregroundStyle(by: .value("Category", "Combat"))
                SectorMark(angle: .value("Count", Int(stats.durability) ?? 0), innerRadius: .ratio(0.6), angularInset: 2).cornerRadius(5).foregroundStyle(by: .value("Category", "Durability"))
                SectorMark(angle: .value("Count", Int(stats.intelligence) ?? 0), innerRadius: .ratio(0.6), angularInset: 2).cornerRadius(5).foregroundStyle(by: .value("Category", "Intelligence"))
                SectorMark(angle: .value("Count", Int(stats.power) ?? 0), innerRadius: .ratio(0.6), angularInset: 2).cornerRadius(5).foregroundStyle(by: .value("Category", "Power"))
                SectorMark(angle: .value("Count", Int(stats.speed) ?? 0), innerRadius: .ratio(0.6), angularInset: 2).cornerRadius(5).foregroundStyle(by: .value("Category", "Speed"))
                SectorMark(angle: .value("Count", Int(stats.strength) ?? 0), innerRadius: .ratio(0.6), angularInset: 2).cornerRadius(5).foregroundStyle(by: .value("Category", "Strength"))
            }
        }.padding().frame(maxWidth: .infinity, maxHeight: 350).background(.white).cornerRadius(16).padding(24)
    }
}

