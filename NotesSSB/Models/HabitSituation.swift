import Foundation
import SwiftData

@Model
class HabitSituation: Identifiable {
    var id: String
    var name: String = ""
    
    @Relationship var habit: Habit?
    
    init(id: String, name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
}
