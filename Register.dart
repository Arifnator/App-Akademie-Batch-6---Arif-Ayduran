const String appName = "Purus Lern App";

Map<String, List<String>> users = {
  "arifnator@icloud.com".toLowerCase(): ["Arifnator".toLowerCase(), "Pass12."],
  "ferro36@icloud.com".toLowerCase(): ["ferhatnator".toLowerCase(), "fero23."]
};

const List<String> activationCodes = [
  "147084",
  "273947",
  "104739",
  "173907",
  "103738"
];

String inputLogin = "arifnaTor".toLowerCase();
String inputPassword = "Pass12.";

String regEmail = "ARvvvvR@icloud.com".toLowerCase();
String regUserName = "Arifnatddor".toLowerCase();
String regPassword1 = "Passsss1.";
String regPassword2 = "Passsss1.";
String activationCode = "104739";
void main() {
  if (regEmail.isEmpty) {
    print("Bitte geben Sie eine Email ein!");
  } else {
    if (users.containsKey(regEmail)) {
      print("Die Email ist schon vergeben");
    } else {
      if (regUserName.isEmpty) {
        print("Bitte geben Sie einen Benutzernamen ein!");
      } else {
        if (users.values.any((userInfo) => userInfo[0] == regUserName)) {
          print("Der Benutzername ist schon vergeben");
        } else {
          if (regPassword1.isEmpty) {
            print("Bitte geben Sie ein Passwort ein!");
          } else if (regPassword2.isEmpty) {
            print("Bitte bestätigen Sie das Passwort!");
          } else if (regPassword1 != regPassword2) {
            print("Die angegebenen Passwörter stimmen nicht überein");
          } else {
            if (activationCode.isEmpty) {
              print("Bitte geben Sie das den Aktivierungscode ein!");
            } else if (!activationCodes.contains(activationCode)) {
              print("Bitte geben Sie einen korrekten Aktivierungscode ein!");
            } else {
              users[regEmail] = [regUserName, regPassword1];
              print("Registrierung Erfolgreich");
            }
          }
        }
      }
    }
  }
}