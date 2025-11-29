import Foundation
import SwiftData

@Model
class Patient {
    // --- 1. البيانات الشخصية الأساسية ---
    var name: String
    var age: Int
    var gender: String // Male, Female, Other
    var phone: String
    var address: String
    var recordID: String // Medical Record Number
    
    // --- 2. الملف الطبي (Clinical Profile) ---
    var chiefComplaint: String
    var historyOfPresentIllness: String // HPI
    var pastMedicalHistory: String
    var familyHistory: String
    var socialHistory: String
    
    // --- 3. الفحص العام (General Examination) - خيارك الذكي ---
    var generalAppearance: String
    // جعلناها اختيارية (؟) لأنها قد لا تُقاس دائماً
    var bloodPressureSystolic: Int?  // الرقم العلوي
    var bloodPressureDiastolic: Int? // الرقم السفلي
    var heartRate: Int?              // نبضات القلب
    var respiratoryRate: Int?        // معدل التنفس
    var oxygenSaturation: Double?    // نسبة الأكسجين
    
    var provisionalDiagnosis: String
    
    // --- 4. العلاقات ---
    @Relationship(deleteRule: .cascade) var operativeNotes: [OperativeNote] = []
    
    // دالة الإنشاء (تضع قيم افتراضية فارغة لتسهيل الإدخال)
    init(name: String, age: Int, gender: String = "Male", phone: String = "", address: String = "", recordID: String = "") {
        self.name = name
        self.age = age
        self.gender = gender
        self.phone = phone
        self.address = address
        self.recordID = recordID
        
        // القيم الافتراضية للنصوص هي فراغ ""
        self.chiefComplaint = ""
        self.historyOfPresentIllness = ""
        self.pastMedicalHistory = ""
        self.familyHistory = ""
        self.socialHistory = ""
        self.generalAppearance = ""
        self.provisionalDiagnosis = ""
        
        // القيم الرقمية تترك فارغة (nil) عند الإنشاء
        self.bloodPressureSystolic = nil
        self.bloodPressureDiastolic = nil
        self.heartRate = nil
        self.respiratoryRate = nil
        self.oxygenSaturation = nil
    }
}
