/*
Erstelle eine Dart-Klasse namens Bankkonto, die die folgenden Eigenschaften und Methoden hat:

Eigenschaften:

kontonummer: Eine eindeutige Kontonummer für das Bankkonto.
kontostand: Der aktuelle Kontostand des Bankkontos.
Methoden:

einzahlen(): Eine Methode, die einen Betrag auf das Bankkonto einzahlt und den neuen Kontostand aktualisiert.
abheben(): Eine Methode, die einen Betrag vom Bankkonto abhebt, vorausgesetzt, dass genügend Guthaben vorhanden ist, und den neuen Kontostand aktualisiert.
kontostand_anzeigen(): Eine Methode, die den aktuellen Kontostand des Bankkontos anzeigt.
Verwende diese Klasse, um ein Bankkonto-Objekt zu erstellen und verschiedene Operationen wie Einzahlung, Abhebung und Anzeige des Kontostands durchzuführen.
*/

import 'dart:io';

class bankkonto {
  static Map<String, double> userData = {
    "1982831": 123.13,
    "1880130": 130928.31,
    "9200103": 110.31
  };
  String Kontolegitimation;
  double kontostand;

  bankkonto(this.Kontolegitimation, this.kontostand);

  double einzahlen(double e) {
    kontostand += e;
    print(
        "\nDie Einzahlung von $e € war erfolgreich. Aktueller Kontostand: $kontostand €");
    return kontostand;
  }

  double abheben(double a) {
    if (kontostand >= a) {
      kontostand -= a;
      print(
          "\nDie Auszahlung von $a € war erfolgreich. Aktueller Kontostand: $kontostand €");
      return kontostand;
    } else {
      print(
          "\nSie haben nicht genug Geld auf dem Konto. Aktueller Kontostand: $kontostand €");
      return kontostand;
    }
  }

  void kontostand_anzeigen() {
    print("\nAktueller Kontostand: $kontostand €");
  }

  static bool newReg() {
    print(
        "\nWillkommen bei der Bank Arifmethrisch.\n\nWas möchten Sie tun?\n- 'neu' um ein neues Bankkonto anzulegen,\n- 'login' um auf Ihr Konto zuzugreifen\n- 'ende' um zu beenden.\n");
    String? inputLogin = stdin.readLineSync();
    if (inputLogin == null || inputLogin.isEmpty) {
      print("Keine Eingabe.");
      return newReg();
    } else if (inputLogin.toLowerCase() == "ende") {
      exit(0);
    } else if (inputLogin.toLowerCase() == "neu") {
      return true;
    } else if (inputLogin.toLowerCase() == "login") {
      return false;
    } else {
      print("Falsche eingabe.");
      return newReg();
    }
  }

  static Map<String, double> neuesKonto() {
    print(
        "\nBitte geben Sie eine Kontolegitimation ein! ('ende' um zu beenden.)");
    String? inputNewLegit = stdin.readLineSync();
    if (inputNewLegit == null || inputNewLegit.isEmpty) {
      print("Keine Eingabe.");
      return neuesKonto();
    } else if (inputNewLegit.toLowerCase() == "ende") {
      exit(0);
    } else {
      print(
          "\nBitte geben Sie ihr Startguthaben ein! Format: '213.41' ('ende' um zu beenden.)");
      String? inputFund = stdin.readLineSync();
      if (inputFund == null || inputFund.isEmpty) {
        print("Keine Eingabe. Die Registrierung wird neu begonnen.");
        return neuesKonto();
      } else if (inputNewLegit.toLowerCase() == "ende") {
        exit(0);
      } else if (double.tryParse(inputFund) == null) {
        print("\nUngültiges Format. Die Registrierung wird neu begonnen.");
        return neuesKonto();
      } else {
        userData.addAll({inputNewLegit: double.parse(inputFund)});
        print("\nRegistrierung abgeschlossen.");
        return {inputNewLegit: double.parse(inputFund)};
      }
    }
  }

  static String login() {
    print(
        "\nBitte geben Sie ihre Kontolegitimation ein! ('ende' um zu beenden.)");
    String? inputLegit = stdin.readLineSync();
    if (inputLegit == null || inputLegit.isEmpty) {
      print("\nKeine Eingabe.");
      return login();
    } else if (inputLegit.toLowerCase() == "ende") {
      exit(0);
    } else {
      if (userData.containsKey(inputLegit)) {
        return inputLegit;
      } else {
        print("\nKeine Übereinstimmung.");
        return login();
      }
    }
  }

  static void mainMenu() {
    if (newReg() == true) {
      neuesKonto();
      return mainMenu();
    } else {
      String currentAcc = login();
      bankkonto konto = bankkonto(currentAcc, userData[currentAcc]!);

      while (true) {
        print(
            "\n\nWas möchten Sie tun?\n- 'einzahlen' um Geld einzuzahlen,\n- 'abheben' um Geld abzuheben,\n- 'kontostand' um den Kontostand anzuzeigen,\n- 'logout' um sich auszuloggen,\n- 'ende' um zu beenden,\n- 'test' für die Gesamten konten.\n");
        String? auswahl = stdin.readLineSync();
        if (auswahl == null || auswahl.isEmpty) {
          print("\nKeine Eingabe.");
          continue;
        } else if (auswahl.toLowerCase() == "logout") {
          return mainMenu();
        } else if (auswahl.toLowerCase() == "ende") {
          exit(0);
        } else if (auswahl.toLowerCase() == "einzahlen") {
          print(
              "\nBitte geben Sie den Betrag ein, den Sie einzahlen möchten(Format '123.45'):");
          String? betragEin = stdin.readLineSync();
          double? betrag = double.tryParse(betragEin ?? '');
          if (betrag != null) {
            bankkonto.userData[currentAcc] = konto.einzahlen(betrag);
          } else {
            print("Ungültiges Format.");
          }
        } else if (auswahl.toLowerCase() == "abheben") {
          print(
              "\nBitte geben Sie den Betrag ein, den Sie abheben möchten(Format '123.45'):");
          String? betragAbh = stdin.readLineSync();
          double? betrag = double.tryParse(betragAbh ?? '');
          if (betrag != null) {
            bankkonto.userData[currentAcc] = konto.abheben(betrag);
          } else {
            print("\nUngültiges Format.");
          }
        } else if (auswahl.toLowerCase() == "kontostand") {
          konto.kontostand_anzeigen();
        } else if (auswahl.toLowerCase() == "test") {
          print(bankkonto.userData);
        } else {
          print("\nFalsche Eingabe.");
        }
      }
    }
  }
}

void main() {
  bankkonto.mainMenu();
}
