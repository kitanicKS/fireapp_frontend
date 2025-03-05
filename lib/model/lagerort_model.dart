class Lagerort {
  final int id;
  final String name;
  final String box;
  final String ablage;
  final String raum;
  final String flaeche;
  final String pic;
  final String description;

  Lagerort({
    required this.id,
    required this.name,
    required this.box,
    required this.ablage,
    required this.raum,
    required this.flaeche,
    required this.pic,
    required this.description,
  });

  // Factory method to create a Lagerort object from JSON
  factory Lagerort.fromJson(Map<String, dynamic> json) {
    return Lagerort(
      id: json['lo_id'],
      name: json['lo_name'],
      box: json['lo_box'],
      ablage: json['lo_ablage'],
      raum: json['lo_raum'],
      flaeche: json['lo_flaeche'],
      pic: json['lo_pic'],
      description: json['lo_description'],
    );
  }

  // Method to convert a Lagerort object to JSON
  Map<String, dynamic> toJson() {
    return {
      'lo_id': id,
      'lo_name': name,
      'lo_box': box,
      'lo_ablage': ablage,
      'lo_raum': raum,
      'lo_flaeche': flaeche,
      'lo_pic': pic,
      'lo_description': description,
    };
  }
}