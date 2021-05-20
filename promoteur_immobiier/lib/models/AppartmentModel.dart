class AppartementrModel {
  String typeAppartement;
  String aVendre;
  String nomDeProjet;
  String surface;
  String prix;
  String description;
  String plan;
  String photo; //badlha list ??
  String uIdProjet;
  AppartementrModel({
    this.typeAppartement,
    this.aVendre,
    this.nomDeProjet,
    this.surface,
    this.prix,
    this.description,
    this.photo,
    this.plan,
    this.uIdProjet,
  });

  AppartementrModel.fromJson(Map<String, dynamic> json) {
    typeAppartement = json['typeAppartement'];
    aVendre = json['aVendre'];
    nomDeProjet = json['nomDeProjet'];
    photo = json['photo'];
    description = json['description'];
    prix = json['prix'];
    uIdProjet = json['IdProjet'];
    plan = json['plan'];
    surface = json['surface'];
  }

  Map<String, dynamic> toMap() {
    return {
      'plan': plan,
      'typeAppartement': typeAppartement,
      'aVendre': aVendre,
      'nomDeProjet': nomDeProjet,
      'photo': photo,
      'description': description,
      'prix': prix,
      'surface': surface,
      'IdProjet': uIdProjet,
    };
  }
}
