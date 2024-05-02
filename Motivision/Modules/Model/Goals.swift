//
//  Motivation.swift
//  Motivision
//
//  Created by MacBook Pro on 02/05/24.
//

import Foundation

enum Goals: String, CaseIterable, Identifiable {
    case bekerja = "Bekerja"
    case menikah = "Menikah"
    case keturunan = "Memiliki keturunan"
    case rumah = "Memiliki Rumah"
    case mobil = "Memiliki Mobil"
    case haji = "Beribadah Haji"
    var id: Goals { self }
}

enum Motivator: String, CaseIterable, Identifiable {
    case indonesia = "Indonesia"
    case internasional = "Internasional"
    case anime = "Anime"
    var id: Motivator { self }
}

