//
//  Note.swift
//  Smash Notes
//
//  Created by Bartomeu Mas Castillo on 20/4/24.
//

import Foundation
import SwiftData

@Model
class Note: Identifiable {
    var id: String = UUID().uuidString
    var playerName: String = ""
    var winCondition: String = ""
    var extraDetails: String = ""
    var characters: [Character] = []
    var habits: [Habit] = []
    var stages: [Stage] = []
    
    init(id: String, playerName: String, winCondition: String, extraDetails: String) {
        self.id = id
        self.playerName = playerName
        self.winCondition = winCondition
        self.extraDetails = extraDetails
    }

    init() {
        self.id = UUID().uuidString
        self.playerName = ""
        self.winCondition = ""
        self.extraDetails = ""
    }
}
