class ToolCase {
  List<String> tools = [];

  ToolCase(this.tools);

  List<String> getTools() => tools;

  String getTool(int n) {
    if (n > tools.length) {
      return "Kein Eintrag gefunden. Die Liste hat ${tools.length} Einträge.";
    } else if (n <= 0) {
      return "0 und Negative Zahlen sind nicht erlaubt.";
    } else {
      return tools[n - 1];
    }
  }

  void addTool(String tool) {
    tools.add(tool);
  }

  void removeTool(String tool) {
    tools.remove(tool);
  }
}

void main() {
  ToolCase liste1 = ToolCase(["Hammer", "Schraubenzieher"]);
  ToolCase liste2 = ToolCase(["Zange", "Hammer"]);

  liste2.addTool("Schlüssel");
  liste2.removeTool("Hammer");

  print(liste1.getTool(2));
  print(liste1.getTools());
  print(liste2.getTool(1));
  print(liste2.getTools());
  print(liste2.getTool(5));
  print(liste2.getTool(-1));
}
