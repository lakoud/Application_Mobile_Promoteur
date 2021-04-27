class AppartementModel {
  String type, image, surface, prix, residence, description, plan;

  AppartementModel({
    this.type,
    this.image,
    this.surface,
    this.description,
    this.prix,
    this.residence,
    this.plan,
  });

  AppartementModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    type = map['Type'];
    image = map['Photo'];
    surface = map['Surface'];
    description = map['description'];
    prix = map['Prix'];
    residence = map['residence'];
    plan = map['plan'];
  }
  toJson() {
    return {
      'plan': plan,
      'Type': type,
      'Photo': image,
      'Surface': surface,
      'description': description,
      'Prix': prix,
      'residence': residence,
    };
  }
}
