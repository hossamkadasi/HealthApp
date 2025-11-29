import SwiftUI
import SwiftData

struct PatientList: View {
    // هذه الكلمة السحرية @Query تجلب البيانات من قاعدة البيانات وتحدثها تلقائياً
    @Query var patients: [Patient]
    
    var body: some View {
        NavigationStack {
            List(patients) { patient in
                HStack {
                    VStack(alignment: .leading) {
                        Text(patient.name)
                            .font(.headline)
                        Text("Age: \(patient.age) | \(patient.gender)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    // سنضيف هنا لاحقاً حالة المريض أو لون يعبر عنها
                }
            }
            .navigationTitle("All Patients")
            .toolbar {
                Button("Add Patient", systemImage: "plus") {
                    // سنبرمج زر الإضافة لاحقاً
                }
            }
        }
    }
}

#Preview {
    PatientList()
        .modelContainer(for: Patient.self, inMemory: true)
}
