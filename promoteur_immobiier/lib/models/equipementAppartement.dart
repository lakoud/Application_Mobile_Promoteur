class EquipementModel {
  String nom;
  String idProjet;
  String icon;

  EquipementModel({this.icon, this.nom, this.idProjet});

  EquipementModel.fromJson(Map<String, dynamic> json) {
    nom = json['Nom'];

    icon = json['icon'];

    idProjet = json['IdProjet'];
  }

  Map<String, dynamic> toMap() {
    return {
      'Nom': nom,
      'icon': icon,
      'IdProjet': idProjet,
    };
  }
}
