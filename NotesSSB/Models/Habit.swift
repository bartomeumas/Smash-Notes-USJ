//
//  Note.swift
//  Smash Notes
//
//  Created by Bartomeu Mas Castillo on 20/4/24.
//

import Foundation
import SwiftData

@Model
class Habit: Identifiable {
    var id: String
    var text: String = ""
    var situation: HabitSituation? = nil
    var note: Note?
    
    init(id: String, text: String) {
        self.id = UUID().uuidString
        self.text = text
    }
}
