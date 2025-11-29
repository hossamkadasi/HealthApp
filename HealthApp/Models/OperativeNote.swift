import Foundation
import SwiftData

@Model
class OperativeNote {
    // 1. تفاصيل الطاقم والوقت
    var date: Date
    var surgeon: String
    var assistants: String
    var anesthesiologist: String
    var anesthesiaType: String
    
    // 2. التشخيصات والدواعي
    var preOpDiagnosis: String
    var postOpDiagnosis: String
    var indication: String
    
    // 3. تفاصيل العملية
    var operativeFindings: String      // ما وجدته أثناء العملية
    var procedureDescription: String   // وصف الخطوات
    
    // 4. خطة ما بعد العملية
    var postOpMonitoring: String
    var medications: String
    
    // 🔗 الرابط مع المريض
    var patient: Patient?
    
    // دالة الإنشاء مع قيم افتراضية لتسريع الكتابة
    init(date: Date = Date(), 
         surgeon: String = "Dr. Hossam Al-Qudsi", // الاسم الافتراضي للجراح
         assistants: String = "",
         anesthesiologist: String = "",
         anesthesiaType: String = "",
         preOpDiagnosis: String = "",
         postOpDiagnosis: String = "",
         indication: String = "",
         operativeFindings: String = "",
         procedureDescription: String = "",
         postOpMonitoring: String = "",
         medications: String = "") {
        
        self.date = date
        self.surgeon = surgeon
        self.assistants = assistants
        self.anesthesiologist = anesthesiologist
        self.anesthesiaType = anesthesiaType
        self.preOpDiagnosis = preOpDiagnosis
        self.postOpDiagnosis = postOpDiagnosis
        self.indication = indication
        self.operativeFindings = operativeFindings
        self.procedureDescription = procedureDescription
        self.postOpMonitoring = postOpMonitoring
        self.medications = medications
    }
}
