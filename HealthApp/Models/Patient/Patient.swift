import Foundation
import SwiftData

@Model
class Patient {
    // 1. تعريف البيانات
    var name: String
    var age: @Relationship(deleteRule: .cascade) var operativeNotes: [OperativeNote] = []
Int
    
    // 2. دالة الإنشاء (عشان نقدر نسوي مريض جديد لاحقاً)
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
