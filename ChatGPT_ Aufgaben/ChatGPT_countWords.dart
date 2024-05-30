/* Aufgabe: Erstelle ein Programm in Dart, das die häufigsten Wörter in einem vom Benutzer eingegebenen Text zählt und ausgibt.

Anforderungen:

Das Programm soll eine Funktion Map<String, int> countWords(String text) enthalten, die die Häufigkeit der Wörter im Text zählt und als Map zurückgibt.
Die main-Funktion soll den Benutzer nach einem Text fragen, den Text einlesen und die Häufigkeiten der Wörter ausgeben. */

import "dart:io";

void main() {
  do {
    print("'ende' fürs beenden\nGeben Sie einen Text ein:");
    String? inputText = stdin.readLineSync();
    Map<String, int> countedWords = {};

    if (inputText == null || inputText.isEmpty) {
      print("Keine Eingabe. Geben Sie einen Text ein:");
    } else if (inputText.toLowerCase() == "ende") {
      break;
    } else {
      countedWords = countWords(inputText);
      print("Wort-Häufigkeiten:");
      countedWords.forEach((word, count) {
        print("$word: $count");
      });
    }
  } while (true);
}

Map<String, int> countWords(String text) {
  text = text.replaceAll(RegExp(r'[^\w\s]'), '').toLowerCase();
  Map<String, int> wordCount = {};
  List<String> words = text.split(RegExp(r'\s+'));

  for (String word in words) {
    if (wordCount.containsKey(word)) {
      wordCount[word] = wordCount[word]! + 1;
    } else {
      wordCount[word] = 1;
    }
  }

  return wordCount;
}
