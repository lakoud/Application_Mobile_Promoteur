class ModelAdressProjet {
  String idProjet;
  String lienMap;

  String pays;
  String rue;
  String ville;
  ModelAdressProjet({
    this.idProjet,
    this.lienMap,
    this.pays,
    this.rue,
    this.ville,
  });

  ModelAdressProjet.fromJson(Map<String, dynamic> json) {
    ville = json['ville'];
    idProjet = json['IdProjet'];
    lienMap = json['LienMap'];

    pays = json['pays'];
    rue = json['rue'];
  }

  Map<String, dynamic> toMap() {
    return {
      'ville': ville,
      'IdProjet': idProjet,
      'rue': rue,
      'pays': pays,
      'LienMap': lienMap,
    };
  }
}
