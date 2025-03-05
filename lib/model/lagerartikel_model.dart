class Lagerartikel {
  final int id;
  final String name;
  final int quantity;
  final String pic;
  final String description;

  Lagerartikel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.pic,
    required this.description,
  });

  // Factory method to create a Lagerartikel object from JSON
  factory Lagerartikel.fromJson(Map<String, dynamic> json) {
    return Lagerartikel(
      id: json['la_id'],
      name: json['la_name'],
      quantity: json['la_anzahl'],
      pic: json['la_pic'],
      description: json['la_description'],
    );
  }

  // Method to convert a Lagerartikel object to JSON
  Map<String, dynamic> toJson() {
    return {
      'la_id': id,
      'la_name': name,
      'la_anzahl': quantity,
      'la_pic': pic,
      'la_description': description,
    };
  }
}