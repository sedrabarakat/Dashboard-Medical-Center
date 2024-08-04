class Session {
  final int id;
  final int patientId;
  final bool closed;
  final String total;
  final String createdDate; // New field for created date
  final int createdTimestamp; // New field for created timestamp

  Session({
    required this.id,
    required this.patientId,
    required this.closed,
    required this.total,
    required this.createdDate,
    required this.createdTimestamp,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id'],
      patientId: json['patient_id'],
      closed: json['closed'] == 1,
      total: json['total'],
      createdDate: json['created_date'], // Parsing the created date
      createdTimestamp: json['created_timestamp'], // Parsing the created timestamp
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_id': patientId,
      'closed': closed ? 1 : 0,
      'total': total,
      'created_date': createdDate, // Adding the created date to the JSON map
      'created_timestamp': createdTimestamp, // Adding the created timestamp to the JSON map
    };
  }
}
