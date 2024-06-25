// Betrachte folgenden Code aus einer Flutter App.
// Deine Aufgabe ist es, diesen Code in reinem Dart nachzubauen.
// Erstelle also eine Klasse MaterialApp, Scaffold, Center etc. mit entsprechenden Attributen.
// Erzeuge dann eine Instanz dieser Klasse und weise sie einer Konstanten myApp zu.
// Dein Dart Code soll am Ende dem Flutter Code aus dem Beispiel gleichen.

// Hinweis: Es genügen die Attribute, die auch im Code-Beispiel zu sehen sind.

// @override
// Widget build(BuildContext context) {
//   const myApp = MaterialApp(
//     home: Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Text("Hallo"),
//           ],
//         ),
//       ),
//     ),
//   );

//   return myApp;
// }

class BuildContext {}

abstract class Widget {
  final Widget? key;
  const Widget({this.key});
}

class MaterialApp extends Widget {
  final Widget? home;
  const MaterialApp({this.home});
}

class Scaffold extends MaterialApp {
  final Widget? body;
  const Scaffold({this.body});
}

class Center extends Scaffold {
  final Widget? child;
  const Center({this.child});
}

class Column extends Center {
  final List<Widget>? children;
  const Column({this.children});
}

class Text extends Column {
  final String text;
  const Text(this.text);
}

Widget build(BuildContext context) {
  const Widget myApp = MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Hallo"),
          ],
        ),
      ),
    ),
  );
  return myApp;
}

void main() {
  BuildContext buildContext = BuildContext();
  build(buildContext);
}
