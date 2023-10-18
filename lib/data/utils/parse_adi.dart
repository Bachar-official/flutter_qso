/// Cuts file content with <EOH> tag from [source]
String? _cutHeader(String source) {
  String upperAdi = source.toUpperCase();
  const header = '<EOH>';
  int index = upperAdi.indexOf(header);
  if (index != -1) {
    return upperAdi.substring(index + header.length).trim();
  }
}

/// Returns records ends with '<eor>' tag from [source]
List<String> _getAdiRecords(String source) {
  RegExp pattern = RegExp(r'<.*?<EOR>', dotAll: true);
  List<String?> result =
      pattern.allMatches(source).map((match) => match.group(0)).toList();
  result.removeWhere((str) => str == null);
  return List<String>.from(result);
}

/// Returns Map with key as field and value as value from [source]
Map<String, dynamic> _adiRecordToMap(String source) {
  Map<String, String> resultMap = {};
  RegExp pattern = RegExp(r'<([^:]+):([^>]+)>([^<]+)');
  for (RegExpMatch match in pattern.allMatches(source)) {
    String key = match.group(1)!;
    String value = match.group(3)!;

    resultMap[key] = value;
  }

  return resultMap;
}
