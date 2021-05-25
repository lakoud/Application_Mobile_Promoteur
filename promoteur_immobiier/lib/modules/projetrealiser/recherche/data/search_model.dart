class SearchModel {
  String name;
  String details;
  List<String> key;
  List<String> keys2; //honi

  SearchModel({this.name, this.details, this.key, this.keys2});

  toMap() => {
        "name": name,
        "details": details,
        "key": key,
        "keys2": keys2, //honi
      };

  SearchModel.fromMap(Map<String, dynamic> map)
      : name = map["name"],
        details = map["details"];
}
