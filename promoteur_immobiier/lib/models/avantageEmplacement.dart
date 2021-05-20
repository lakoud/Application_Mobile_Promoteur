class AvantageEmplacementModel {
  String nom;
  String distance;
  String icon;
  String type;
  String idProjet;
  AvantageEmplacementModel(
      {this.type, this.distance, this.icon, this.nom, this.idProjet});

  AvantageEmplacementModel.fromJson(Map<String, dynamic> json) {
    nom = json['Nom'];
    distance = json['distance'];
    icon = json['icon'];
    type = json['type'];
    idProjet = json['IdProjet'];
  }

  Map<String, dynamic> toMap() {
    return {
      'Nom': nom,
      'distance': distance,
      'icon': icon,
      'type': type,
      'IdProjet': idProjet,
    };
  }
}
