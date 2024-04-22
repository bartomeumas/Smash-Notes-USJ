//
//  Note.swift
//  Smash Notes
//
//  Created by Bartomeu Mas Castillo on 20/4/24.
//

import Foundation
import SwiftData

@Model
class Stage: Identifiable {
    var id: String
    var name: String = ""
    var note: Note?

    init(id: String, name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
}
