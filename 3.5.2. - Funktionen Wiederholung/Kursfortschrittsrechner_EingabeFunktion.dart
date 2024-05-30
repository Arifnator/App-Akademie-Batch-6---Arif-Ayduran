import 'dart:io';

void main() {
  int absoluteDays = 270;
  String dayOne = "Tage";
  String left = "bleiben";
  String leftDay = "Tage";

  print(
      "Willkommen zum Kursfortschrittsrechner!\n\nBitte gib die Anzahl der Tage ein, die du bereits im Kurs absolviert hast. Der Kurs dauert $absoluteDays Tage.");
  int completedDays = userInputBetween(0, absoluteDays);

  if (completedDays == absoluteDays - 1) {
    left = "bleibt nur";
    leftDay = "Tag";
  }
  if (completedDays == 1) {
    dayOne = "Tag";
  }

  print(
      "\nDu hast $completedDays $dayOne von $absoluteDays Tagen absolviert. \nDas entspricht einem Fortschritt von ${daysInPercent(completedDays, absoluteDays).toStringAsFixed(2)} %. \nEs $left noch ${daysLeft(absoluteDays, completedDays)} $leftDay\n\n${mileStone(daysInPercent(completedDays, absoluteDays))}");
}

double daysInPercent(int days, int absoluteDays) => days / absoluteDays * 100;

int userInputBetween(int a, int b) {
  String? input = stdin.readLineSync();
  if (input!.isEmpty) {
    print("Keine Eingabe. Bitte geben Sie eine Zahl zwischen $a und $b ein:");
    return userInputBetween(a, b);
  } else if (int.tryParse(input) == null ||
      int.parse(input) < a ||
      int.parse(input) > b) {
    print("Falsche Eingabe. Bitte geben Sie eine Zahl zwischen $a und $b ein:");
    return userInputBetween(a, b);
  } else {
    return int.parse(input);
  }
}

int daysLeft(int absoluteDays, int days) => absoluteDays - days;

String mileStone(double percent) {
  switch (percent) {
    case 0:
      return "Na du hast ja mal eine Eile, fang doch erstmal an.";
    case < 25:
      return "Du hast noch keinen Meilenstein erreicht.";
    case >= 25 && < 50:
      return "Du hast ein Viertel des Kurses schon hinter dir.";
    case >= 50 && < 75:
      return "Du hast die Hälfte des Kurses schon hinter dir.";
    case >= 75 && < 100:
      return "Du hast drei Viertel des Kurses schon hinter dir.";
    default:
      return "Du bist ja schon Fertig.";
  }
}
