void main() {

print(reverseString("Akadoajdapjosd"));
  
}

String reverseString(String text) {
  String currentText = "";
  for (int i = text.length-1; i >= 0; i--) {
    currentText += text[i];
  }
  return currentText;
}
