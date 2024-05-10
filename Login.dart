const String appName = "Purus Lern App";

Map<String, List<String>> users = {
  "arifnator@icloud.com": ["Arifnator", "Pass12."],
  "ferro36@icloud.com": ["Ferhatnator", "fero23."]
};

const List<int> activationCodes = [147084, 273947, 104739, 173907, 103738];

String inputLogin = "Arifnator";
String inputPassword = "Pass12.";
int activationCode = 104739;

void main() {
  if (inputLogin.isEmpty) {
    print("Bitte geben Sie Ihren Benutzernamen oder Ihre E-Mail ein!");
  } else {
    String? userEmail = findInfo(users, inputLogin);
    if (userEmail == null) {
      print("Benutzername oder E-Mail nicht gefunden!");
    } else {
      List<String>? userInfo = users[userEmail];
      String? userPassword = userInfo?[1];
      if (inputPassword.isEmpty) {
        print("Bitte geben Sie Ihr Passwort ein!");
      } else if (userPassword != inputPassword) {
        print("Falsches Passwort!");
      } else {
        print("Login Erfolgreich!");
      }
    }
  }
}

String? findInfo(Map<String, List<String>> users, String inputLogin) {
  if (users.containsKey(inputLogin)) {
    return inputLogin;
  }
  for (var entry in users.entries) {
    var userName = entry.value[0];
    if (userName.contains(inputLogin)) {
      return entry.key;
    }
  }
  return null;
}
