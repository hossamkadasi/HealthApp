import Foundation
import SwiftData

@Model
class OperativeNote {
    var date: Date
    var procedure: String
    var surgeon: String
    var diagnosis: String
    var findings: String
    
    // 🔗 الرابط: هذه العملية تابعة لمريض معين
    var patient: Patient?
    
    init(date: Date, procedure: String, surgeon: String, diagnosis: String, findings: String) {
        self.date = date
        self.procedure = procedure
        self.surgeon = surgeon
        self.diagnosis = diagnosis
        self.findings = findings
    }
}
