import 'dart:io';

int absoluteDays = 270;

void main() {
  int? completedDays;
  String dayOne = "Tage";
  String left = "bleiben";
  String leftDay = "Tage";

  do {
    print(
        "Willkommen zum Kursfortschrittsrechner!\n\nBitte gib die Anzahl der Tage ein, die du bereits im Kurs absolviert hast:");
    completedDays = int.tryParse(stdin.readLineSync()!);
    if (completedDays != null &&
        completedDays >= 0 &&
        completedDays <= absoluteDays) {
      if (completedDays == absoluteDays - 1) {
        left = "bleibt nur";
        leftDay = "Tag";
      }
      if (completedDays == 1) {
        dayOne = "Tag";
      }
      print(
          "\nDu hast $completedDays $dayOne von $absoluteDays Tagen absolviert. \nDas entspricht einem Fortschritt von ${daysInPercent(completedDays, absoluteDays).toStringAsFixed(2)} %. \nEs $left noch ${daysLeft(completedDays)} $leftDay\n\n${mileStone(daysInPercent(completedDays, absoluteDays))}");
    }
  } while (completedDays == null ||
      completedDays < 0 ||
      completedDays > absoluteDays);
}

double daysInPercent(int days, int absoluteDays) => days / absoluteDays * 100;
int daysLeft(int days) => absoluteDays - days;
String mileStone(double percent) {
  switch (percent) {
    case 0:
      return "Du hast ja mal eine Eile, fang doch erstmal an...";
    case < 25:
      return "Du hast noch keinen Meilenstein erreicht.";
    case >= 25 && < 50:
      return "Du hast ein Viertel schon hinter dir";
    case >= 50 && < 75:
      return "Du hast die Hälfte schon hinter dir";
    case >= 75 && < 100:
      return "Du hast drei Viertel schon hinter dir";
    default:
      return "Du bist ja schon Fertig";
  }
}
