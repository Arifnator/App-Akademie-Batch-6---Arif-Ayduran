String gender = "male";
int age = 30;

void main() {
  switch (gender) {
    case "male":
      switch (age) {
        case >= 20 && < 25:
          print("Im Schnitt 181,4m");
        case >= 25 && < 30:
          print("Im Schnitt 181,3m");
        case >= 30 && < 35:
          print("Im Schnitt 180,4m");
        default:
          print("Keine Daten");
      }
    case "female":
      switch (age) {
        case >= 20 && < 25:
          print("Im Schnitt 167,5m");
        case >= 25 && < 30:
          print("Im Schnitt 167,3 m");
        case >= 30 && < 35:
          print("Im Schnitt 167,2");
        default:
          print("Keine Daten");
      }
    default:
      print("Es wurden keine Transgender berücksichtigt");
  }
}
