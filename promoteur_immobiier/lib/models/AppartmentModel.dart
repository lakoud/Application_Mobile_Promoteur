class AppartementrModel {
  String ville;
  String pays;
  String typeAppartement;
  String aVendre;
  String nomDeProjet;
  String surface;
  String prix;
  String description;
  String plan;
  String photo; //badlha list ??
  String uIdProjet;
  String numeroEtage;
  String idAppartment;
  AppartementrModel({
    this.ville,
    this.pays,
    this.idAppartment,
    this.typeAppartement,
    this.aVendre,
    this.nomDeProjet,
    this.surface,
    this.prix,
    this.description,
    this.photo,
    this.plan,
    this.uIdProjet,
    this.numeroEtage,
  });

  AppartementrModel.fromJson(Map<String, dynamic> json) {
    ville = json['ville'];
    pays = json['pays'];
    typeAppartement = json['typeAppartement'];
    aVendre = json['aVendre'];
    nomDeProjet = json['nomDeProjet'];
    photo = json['photo'];
    description = json['description'];
    prix = json['prix'];
    uIdProjet = json['IdProjet'];
    plan = json['plan'];
    surface = json['surface'];
    numeroEtage = json['numeroEtage'];
    numeroEtage = json['numetage'];
    idAppartment = json['idAppartment'];
  }

  Map<String, dynamic> toMap() {
    return {
      'idAppartment': idAppartment,
      'plan': plan,
      'typeAppartement': typeAppartement,
      'aVendre': aVendre,
      'nomDeProjet': nomDeProjet,
      'photo': photo,
      'description': description,
      'prix': prix,
      'surface': surface,
      'IdProjet': uIdProjet,
      'numeroEtage': numeroEtage,
    };
  }
}
