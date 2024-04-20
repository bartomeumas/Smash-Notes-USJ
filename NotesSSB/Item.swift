//
//  Item.swift
//  NotesSSB
//
//  Created by Bartomeu Mas Castillo on 20/4/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}