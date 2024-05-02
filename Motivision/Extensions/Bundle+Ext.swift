//
//  Bundle+Ext.swift
//  Motivision
//
//  Created by MacBook Pro on 02/05/24.
//

import Foundation

// Gunanya untuk decode data json sebagai bundle (lokal data)
// Jadi bisa di reuse anytime anywhere all at once

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // 1. Menentukan lokasi dari file json
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        //2. Kita set data nya
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) form bundle.")
        }
        
        // Buat decode nya
        let decoder = JSONDecoder()
        
        // 4. Simpan sebagai property dari hasil data json yang sudah di decode
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        // 5. Return data yang sudah di dcode dan ready-to-use
        return loaded
    }
}
