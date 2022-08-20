extension DeleteLastCharacterOfString on String {
  String get deleteLastCharacter {
    List<String> splittedList = split("");
    splittedList.removeLast();
    return splittedList.join();
  }
}

extension ParseAndRoundNumberTo2Level on String {
  String get parseAndRound => double.parse(toString()).toStringAsFixed(2);
}
