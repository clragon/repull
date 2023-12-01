dynamic yamlToDart(dynamic value) {
  if (value is Map) {
    List<MapEntry<String, dynamic>> entries = [];
    for (final key in value.keys) {
      entries.add(MapEntry(key, yamlToDart(value[key])));
    }
    return Map.fromEntries(entries);
  } else if (value is List) {
    return List.from(value.map(yamlToDart));
  } else {
    return value;
  }
}
