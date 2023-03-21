class Contact {
  int? id;
  String marca;
  String plate;
  bool isFavorite;

  Contact({
    this.id,
    required this.marca,
    required this.plate,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "marca": marca,
      "plate": plate,
      "isFavorite": (isFavorite) ? 1 : 0,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map["id"] ?? 0,
      marca: map["marca"] as String,
      plate: map["lastName"] as String,
      isFavorite: map["isFavorite"] == 1,
    );
  }
}
