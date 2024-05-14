import "Variablen_LogReg.dart";

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