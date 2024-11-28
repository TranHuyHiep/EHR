// use patient_appointment_management

// // Test to ensure appointment request is successful
// test request_appointment_test() {
//   request_appointment("patient1", "doctor1", 1633072800)
//   Appointments["patient1-doctor1-1633072800"] == 
//     Appointment { patientId = "patient1", doctorId = "doctor1", timestamp = 1633072800, status = "Requested" }
// }

// // Test to ensure appointment acceptance changes status correctly
// test accept_appointment_test() {
//   request_appointment("patient2", "doctor2", 1633072800)
//   accept_appointment("patient2-doctor2-1633072800")
//   Appointments["patient2-doctor2-1633072800"].status == "Accepted"
// }

// // Test to create a treatment record successfully
// test create_treatment_record_test() {
//   let appointmentId = "patient2-doctor2-1633072800"
//   accept_appointment(appointmentId) // Ensure the appointment is accepted
//   create_treatment_record(appointmentId, "Check-up", "Healthy", "None")
//   TreatmentRecords[appointmentId] == 
//     TreatmentRecord { appointmentId = appointmentId, treatmentDetails = "Check-up", diagnosis = "Healthy", procedures = "None" }
// }

// // Test to upload treatment information to IPFS
// test upload_to_ipfs_test() {
//   let appointmentId = "patient2-doctor2-1633072800"
//   create_treatment_record(appointmentId, "Check-up", "Healthy", "None")
//   let result = upload_to_ipfs(appointmentId)
//   result != None
// }

// // Test to upload treatment information to Cardano
// test upload_to_cardano_test() {
//   let appointmentId = "patient2-doctor2-1633072800"
//   create_treatment_record(appointmentId, "Check-up", "Healthy", "None")
//   let result = upload_to_cardano(appointmentId)
//   result != None
// }

// // Test to view treatment information
// test view_treatment_info_test() {
//   let appointmentId = "patient2-doctor2-1633072800"
//   create_treatment_record(appointmentId, "Check-up", "Healthy", "None")
//   let record = view_treatment_info(appointmentId)
//   record != None
// }

// test foo() {
//     1 + 1 == 2
// }
