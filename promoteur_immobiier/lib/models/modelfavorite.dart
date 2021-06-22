class Modelfavorite {
  String nomProjet;
  String nbAppartement;
  String nbEtage;
  String photo;
  String description;
  String plan;
  String etat;
  String id;
  Modelfavorite({
    this.nomProjet,
    this.nbAppartement,
    this.nbEtage,
    this.photo,
    this.description,
    this.plan,
    this.etat,
    this.id,
  });

  Modelfavorite.fromJson(Map<String, dynamic> json) {
    nomProjet = json['NomProjet'];
    nbAppartement = json['NbAppartement'];
    nbEtage = json['NbEtage'];
    photo = json['Photo'];
    description = json['description'];
    plan = json['plan'];
    etat = json['Etat'];
    id = json['uIdProjet'];
  }

  Map<String, dynamic> toMap() {
    return {
      'NomProjet': nomProjet,
      'NbAppartement': nbAppartement,
      'NbEtage': nbEtage,
      'Photo': photo,
      'description': description,
      'plan': plan,
      'Etat': etat,
      'uIdProjet': id,
    };
  }
}
