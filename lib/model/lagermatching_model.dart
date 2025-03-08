class Lagermatching {
  final int id;
  final int laId;
  final int loId;

  Lagermatching({
    required this.id,
    required this.laId,
    required this.loId,
  });

  // Factory method to create a Lagermatching object from JSON
  factory Lagermatching.fromJson(Map<String, dynamic> json) {
    return Lagermatching(
      id: json['lm_id'],
      laId: json['lm_la_id'],
      loId: json['lm_lo_id'],
    );
  }

  // Method to convert a Lagermatching object to JSON
  Map<String, dynamic> toJson() {
    return {
      'lm_id': id,
      'lm_la_id': laId,
      'lm_lo_id': loId,
    };
  }
}