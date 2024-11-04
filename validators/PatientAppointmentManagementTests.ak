module PatientAppointmentManagementTests

import PatientAppointmentManagement

// Test to ensure appointment request is successful
test "should request an appointment" {
    // Given
    request_appointment("patient1", "doctor1", 1633072800)

    // When
    let appointmentExists = Appointments.contains("patient1-doctor1-1633072800")

    // Then
    return appointmentExists // Return true if appointment exists
}

// Test to ensure appointment acceptance changes status correctly
test "should accept an appointment" {
    // Given
    request_appointment("patient2", "doctor2", 1633072800)

    // When
    accept_appointment("patient2-doctor2-1633072800")
    let appointmentStatus = Appointments["patient2-doctor2-1633072800"].status

    // Then
    return appointmentStatus == "Accepted" // Return true if status is "Accepted"
}

// Test to create a treatment record successfully
test "should create a treatment record" {
    // Given
    let appointmentId = "patient2-doctor2-1633072800"
    accept_appointment(appointmentId) // Ensure the appointment is accepted

    // When
    create_treatment_record(appointmentId, "Check-up", "Healthy", "None")
    let recordExists = TreatmentRecords.contains(appointmentId)

    // Then
    return recordExists // Return true if treatment record exists
}

// Test to upload treatment information to IPFS
test "should upload treatment info to IPFS" {
    // Given
    let appointmentId = "patient2-doctor2-1633072800"
    create_treatment_record(appointmentId, "Check-up", "Healthy", "None")

    // When
    let result = upload_to_ipfs(appointmentId)

    // Then
    return result != None // Return true if upload was successful
}

// Test to upload treatment information to Cardano
test "should upload treatment info to Cardano" {
    // Given
    let appointmentId = "patient2-doctor2-1633072800"
    create_treatment_record(appointmentId, "Check-up", "Healthy", "None")

    // When
    let result = upload_to_cardano(appointmentId)

    // Then
    return result != None // Return true if upload was successful
}

// Test to view treatment information
test "should view treatment information" {
    // Given
    let appointmentId = "patient2-doctor2-1633072800"
    create_treatment_record(appointmentId, "Check-up", "Healthy", "None")

    // When
    let record = view_treatment_info(appointmentId)

    // Then
    return record != None // Return true if record is retrievable
}
