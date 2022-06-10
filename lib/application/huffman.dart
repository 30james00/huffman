Map<String, int> count(String phrase) {
  Map<String, int> result = <String, int>{};
  for (int c in phrase.runes) {
    result.update(String.fromCharCode(c), (value) => value + 1, ifAbsent: () => 1);
  }
  return result;
}
