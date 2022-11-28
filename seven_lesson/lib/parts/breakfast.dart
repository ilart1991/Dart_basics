class Breakfast {
  final List nameList;
  final List linkList;
  final List aboutList;

  Breakfast({
    required this.nameList,
    required this.linkList,
    required this.aboutList,
  });

  factory Breakfast.fromJson(Map<String, dynamic> parsedJson) {
    // var procedureFromJson = parsedJson['procedure'];

    // List<String> procedureList = procedureFromJson.cast<String>();

    return Breakfast(
      nameList: parsedJson['name'],
      linkList: parsedJson['link'],
      aboutList: parsedJson['about'],
      // time: parsedJson['time'],
      // procedure: procedureList,
    );
  }
}
