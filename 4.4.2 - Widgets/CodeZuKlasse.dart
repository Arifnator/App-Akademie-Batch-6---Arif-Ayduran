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
  final Scaffold? home;
  const MaterialApp({this.home});
}

class Scaffold extends MaterialApp {
  final Center? body;
  const Scaffold({this.body});
}

class Center extends Scaffold {
  final Column? child;
  const Center({this.child});
}

class Column extends Center {
  final List<Text>? children;
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

void main() {
  BuildContext buildContext = BuildContext();
  build(buildContext);
    final String halloText =
      (myApp as MaterialApp).home!.body!.child!.children!.first.text;
  print(halloText);
}
