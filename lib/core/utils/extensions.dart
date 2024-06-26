extension StringUtilsX on String {
  String get toCamelCase {
    List<String> words = this.split(RegExp(r'\s+'));
    for (int i = 1; i < words.length; i++) {
      words[i] = words[i].substring(0, 1).toUpperCase() + words[i].substring(1).toLowerCase();
    }
    return words.join('');
  }

  String get toKebabCase {
    List<String> words = this.toLowerCase().split(RegExp(r'\s+'));
    return words.join('-');
  }

  String get toSnakeCase {
    List<String> words = this.toLowerCase().split(RegExp(r'\s+'));
    return words.join('_');
  }
} 

extension NonNullMapExtension<K, V> on Map<K, V?> {
  /// Returns a new map with all key-value pairs where the value is not null.
  Map<K, V> whereNotNull() {
    var nonNullMap = <K, V>{};
    for (var entry in this.entries) {
      if (entry.value != null) {
        nonNullMap[entry.key] = entry.value!;
      }
    }
    return nonNullMap;
  }
}

extension NearestLowerMultipleOfTen on double {
  double nearestLowerMultipleOfTen() {
    // Find the nearest lower multiple of ten
    int multipleOfTen = (this / 10).floor() * 10;
    return multipleOfTen.toDouble();
  }
}