class ProjetRealiserModel {
  String nomProjet;
  String nbAppartement;
  String nbEtage;
  String photo;

  ProjetRealiserModel({
    this.nomProjet,
    this.nbAppartement,
    this.nbEtage,
    this.photo,
  });

  ProjetRealiserModel.fromJson(Map<String, dynamic> json) {
    nomProjet = json['NomProjet'];
    nbAppartement = json['NbAppartement'];
    nbEtage = json['NbEtage'];
    photo = json['photo'];
  }

  Map<String, dynamic> toMap() {
    return {
      'NomProjet': nomProjet,
      'NbAppartement': nbAppartement,
      'NbEtage': nbEtage,
      'photo': photo,
    };
  }
}
