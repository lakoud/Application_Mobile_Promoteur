class AdressseAppartementrModel {
  String idProjet;
  String lienMap;
  String code;
  String pays;
  String rue;
  String ville;
  AdressseAppartementrModel({
    this.idProjet,
    this.lienMap,
    this.code,
    this.pays,
    this.rue,
    this.ville,
  });

  AdressseAppartementrModel.fromJson(Map<String, dynamic> json) {
    ville = json['ville'];
    idProjet = json['IdProjet'];
    lienMap = json['LienMap'];
    code = json['num'];
    pays = json['pays'];
    rue = json['rue'];
  }

  Map<String, dynamic> toMap() {
    return {
      'ville': ville,
      'IdProjet': idProjet,
      'code': num,
      'rue': rue,
      'pays': pays,
      'LienMap': lienMap,
    };
  }
}
