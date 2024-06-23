/*
Erstelle die Klasse Spaceship, die die Eigenschaften und Methoden eines Raumschiffs enthält. Jedes Raumschiff sollte über ...

Eine X- und Y-Position
Eine Geschwindigkeit
Eine Anzahl an Lebenspunkten verfügen.
Implementiere in der Klasse Methoden namens:

move(), die das Raumschiff entsprechend seiner aktuellen Geschwindigkeit bewegt. Außerdem bekommt sie als Parameter einen Enum-Wert von folgendem Enum:
Enum: forward, backward, left, right Abhängig des mitgegebenen Enum-Wertes wird die Position des Raumschiffes in die entsprechende Richtung bewegt. (Tipp: Switch-Case)

Eine Methode namens damagePlayer() um die Lebenspunkte des Raumschiffs zu aktualisieren. Diese Methode sollte einen Parameter damage akzeptieren,
der die Schadensmenge repräsentiert und von den Lebenspunkten des Raumschiffs abgezogen wird.
Leite von der Klasse Spaceship die Klasse PlayerSpaceship ab. Diese Klasse repräsentiert das Raumschiff des Spielers und sollte zusätzlich eine
Methode zum Abfeuern von Geschossen enthalten. Hier soll der Text Peng Peng! ausgegeben werden.

Leite ebenfalls von der Klasse Spaceship die Klasse EnemySpaceship ab. Diese Klasse repräsentiert die feindlichen Raumschiffe. 
Implementiere eine Methode, um denm Spieler anzugreifen und seine Lebenspunkte zu reduzieren.
Die Methode enthälts als Parameter den Spieler, welcher angegriffen wird und die Menge an Schaden, die vom Spielerleben abgezogen wird.

Im main-Teil des Programms, erstelle ein Spieler-Raumschiff und eine Liste von feindlichen Raumschiffen. 
Setze die Ausgangswerte der Raumschiffe (Position, Geschwindigkeit, Lebenspunkte) wie du möchtest.

Implementiere eine Schleife, die das Spiel kontinuierlich aktualisiert:

In jeder Iteration der Schleife sollen die Positionen aller, sowohl Spieler als auch feindliche, 
Raumschiffe aktualisiert werden - der Spieler soll im Rahmen der Schleife vorwärts, während die Gegner sich auf ihn zu (Rückwärts bewegen).
Rufe auch die Methoden zum Angriff des Spielers und der feindlichen Raumschiffe auf.
Überprüfe innerhalb der Schleife, ob es zu Kollisionen zwischen dem Spieler-Raumschiff und den feindlichen Raumschiffen gekommen ist.
Wenn ja, reduziere die Lebenspunkte vom Spieler und dem entsprechenden Feind um je 10 Punkte.
Überprüfe am Ende jeder Iteration der Schleife, ob der Spieler gewonnen oder verloren hat. Der Spieler hat verloren, 
wenn die Lebenspunkte seines Raumschiffs auf 0 fallen. Der Spieler hat gewonnen,
wenn alle feindlichen Raumschiffe zerstört wurden. (Überprüfe hier zudem die HP aller Gegner)
Zusatz

Um die Funktionalität zur Änderung der Raumschiff-Farbe hinzuzufügen, erweitern wir die bestehende Klasse Spaceship um ein Attribut color vom Typ Enum. Das Enum enthält vier
verschiedene Farbwerte - nehme hierfür einfach deine Lieblingsfarben. Wir möchten die Möglichkeit haben, die Farbe des Raumschiffs jederzeit zu ändern.
Dazu fügen wir eine Methode namens changeColor() hinzu, die einen Parameter newColor akzeptiert. Der Parameter newColor sollte den gewünschten Farbwert des Enums enthalten.

Füge eine Klasse HealthStation hinzu. Die Eigenschaft und Methoden der Klasse sind:

Eine X- und Y-Position
Eine Anzahl an Heilpunkten
Eine Methode healPlayer() welche als Parameter ein PlayerSpaceship bekommt. Die Funktionalität der Methode ist nun, 
dass sie die Lebenspunkte des übergebenen Spielers um die Summe Anzahl an Heilpunkten erhöht.
Lege nun in der main-Funktion eine weitere Liste mit verschiedenen Health Stations an und überprüfe nach jeder Spielerbewegung, 
ob der Spieler eine Heilstation berührt - wenn ja führe die Methode healPlayer() aus.

Nun möchten wir verschiedene Level für unser Spiel anlegen. Erstelle hierfür zunächst eine Map, 
welche als Schlüssel einen String erhält und als zugehörigen Wert eine weitere Map in sich trägt. Der Schlüssel soll zur Benennung der Level dienen. 
In der inneren Map sollen dann alle für ein Level wichtigen Daten gesammelt werden, z. B.: boundaryX, boundaryY, eine Liste mit allen Gegnern für das Level, 
eine Liste mit allen Reparierstationen für das Level, z.B

 {
              "Level 1":
       {
             "boundaryX": 10,
             "boundaryY": 10,
             "enemies": [enemy1, enemy2, ... ],
             "healingStations": [hs1, hs2, ...]
       }
}
Erzeuge auch für deine eigenen Implementationen Einträge in den Leveln. Füge mindestens 3 verschiedene Level in die Levelmap hinzu. 
Nun erweitere dein Programm so, dass es nacheinander deine hinzugefügten Level "durchspielt". Schreibe dafür eine Funktion in der main Methode, 
die ein Level Namen als String übergeben bekommt und dieses dann so lange durchspielt bis der Spieler gewonnen oder verloren hat. Diese Funktion sollte einen bool returnen. 
Der Returnwert gibt an ob der Spieler das Level gewonnen oder verloren hat. Orientiere dich bei der kompletten Funktion an deiner jetzigen main Methode. 
Wie musst du diese umändern, das sie in der Funktion funktioniert. Denke daran das die boundaries, enemies, health stations usw. aus der von euch definierten Map benutzt werden sollen.
Der Spieler kann in allen Leveln der gleiche sein. Rufe dann in der Main Methode die Funktion nacheinander für die verschiedenen Level auf 
und gebe aus ob das jeweilige Level erfolgreich durchgespielt wurde.

Infos

Erstelle bitte die Attribute so, dass sie für das Spiel Sinn machen. Punkte die nicht genau in der Aufgaben beschrieben werden, kannst du dir frei ausdenken (mit Begründung als Kommentar).

Viel Erfolg!
*/

// Fehlerbehebung1
// Boundarys beachten
// Bool return


import "dart:math";

enum Direction {
  forward,
  backward,
  left,
  right;

// Funktionen, für Random Richtungen
  static Direction randomXDirection() {
    switch (Random().nextInt(2)) {
      case 0:
        return Direction.forward;
      case 1:
        return Direction.backward;
      default:
        return Direction.forward;
    }
  }

  static Direction randomZDirection() {
    switch (Random().nextInt(2) + 2) {
      case 2:
        return Direction.left;
      case 3:
        return Direction.right;
      default:
        return Direction.right;
    }
  }
}

enum MyColors {
  red,
  blue,
  yellow,
  green;

// Funktion, für Random Farbe
  static randomColor() {
    switch (Random().nextInt(4)) {
      case 0:
        return MyColors.red;
      case 1:
        return MyColors.blue;
      case 2:
        return MyColors.yellow;
      case 3:
        return MyColors.green;
      default:
        return MyColors.red;
    }
  }
}

class Spaceship {
  String name;
  MyColors color;
  Direction xDirection; // x-Direction: nur für forward, backward
  Direction zDirection; // z-Direction: nur für left, right
  int x;
  int z; // kein y, weil rechts und links die z achse bestimmt
  int speed;
  int lifePoints;

  Spaceship(this.name, this.color, this.xDirection, this.zDirection, this.x,
      this.z, this.speed, this.lifePoints);

  void changeColor(MyColors newColor) {
    color = newColor;
    print("${name} changed color to ${color}");
  }

  void move() {
    switch (xDirection) {
      case Direction.forward:
        x += speed;
      case Direction.backward:
        x -= speed;
      case Direction.left:
        null;
      case Direction.right:
        null;
    }
    switch (zDirection) {
      case Direction.forward:
        null;
      case Direction.backward:
        null;
      case Direction.left:
        z += speed;
      case Direction.right:
        z -= speed;
    }
  }

  void damagePlayer(int damage) => lifePoints -= damage;
}

class PlayerSpaceship extends Spaceship {
  PlayerSpaceship(super.name, super.color, super.xDirection, super.zDirection,
      super.x, super.z, super.speed, super.lifePoints);

  void attackEnemy(EnemySpaceship enemy, int damage) {
    print("Peng Peng!");
    int currentLifepoints = enemy.lifePoints;
    enemy.damagePlayer(damage);
    if (enemy.lifePoints > 0) {
      print(
          "${enemy.name}: ${currentLifepoints} - $damage,\n${enemy.name} has ${enemy.lifePoints} points left.");
    } else {
      print(
          "${enemy.name}: ${currentLifepoints} - $damage,\n${enemy.name}  is dead.");
    }
  }
}

class EnemySpaceship extends Spaceship {
  EnemySpaceship(super.name, super.color, super.xDirection, super.zDirection,
      super.x, super.z, super.speed, super.lifePoints);

  void attackPlayer(PlayerSpaceship player, int damage) {
    int currentLifepoints = player.lifePoints;
    player.damagePlayer(damage);
    if (player.lifePoints > 0) {
      print(
          "${player.name}: ${currentLifepoints} - $damage,\n${player.name} has ${player.lifePoints} points left.");
    } else {
      print(
          "${player.name}: ${currentLifepoints} - $damage,\n${player.name}  is dead.");
    }
  }
}

class HealthStation {
  int x;
  int z;
  int healingPoints = 10;

  HealthStation(this.x, this.z);

  void healPlayer(PlayerSpaceship player) {
    player.lifePoints += healingPoints;
    print(
        "Player ${player.name} healed $healingPoints points, he have ${player.lifePoints} points left.");
  }
}

void main() {
  PlayerSpaceship player1 = PlayerSpaceship(
    "Arif",
    MyColors.red,
    Direction.forward,
    Direction.randomZDirection(),
    0,
    Random().nextInt(6) - 3,
    1,
    30,
  );

  Map<String, Map<String, dynamic>> levelMap = {
    "Level 1": {
      "boundaryX": 10,
      "boundaryY": 10,
      "enemies": [
        EnemySpaceship(
          "Ferhat",
          MyColors.blue,
          Direction.backward,
          Direction.randomZDirection(),
          200,
          Random().nextInt(2) + 1,
          Random().nextInt(2) + 1,
          30,
        ),
        EnemySpaceship(
          "Ibo",
          MyColors.yellow,
          Direction.backward,
          Direction.randomZDirection(),
          200,
          Random().nextInt(2) + 1,
          Random().nextInt(2) + 1,
          30,
        ),
        EnemySpaceship(
          "Ralf",
          MyColors.green,
          Direction.backward,
          Direction.randomZDirection(),
          200,
          Random().nextInt(2) + 1,
          Random().nextInt(2) + 1,
          30,
        ),
        EnemySpaceship(
          "Jürgen",
          MyColors.red,
          Direction.backward,
          Direction.randomZDirection(),
          200,
          Random().nextInt(2) + 1,
          Random().nextInt(2) + 1,
          30,
        )
      ],
      "healingStations": [
        HealthStation(0, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
      ]
    },
    "Level 2": {
      "boundaryX": 10,
      "boundaryY": 10,
      "enemies": [
        EnemySpaceship(
          "Ferhat",
          MyColors.blue,
          Direction.backward,
          Direction.randomZDirection(),
          200,
          Random().nextInt(2) + 1,
          Random().nextInt(2) + 1,
          30,
        ),
        EnemySpaceship(
          "Ibo",
          MyColors.yellow,
          Direction.backward,
          Direction.randomZDirection(),
          200,
          Random().nextInt(2) + 1,
          Random().nextInt(2) + 1,
          30,
        ),
        EnemySpaceship(
          "Ralf",
          MyColors.green,
          Direction.backward,
          Direction.randomZDirection(),
          200,
          Random().nextInt(2) + 1,
          Random().nextInt(2) + 1,
          30,
        ),
        EnemySpaceship(
          "Jürgen",
          MyColors.red,
          Direction.backward,
          Direction.randomZDirection(),
          200,
          Random().nextInt(2) + 1,
          Random().nextInt(2) + 1,
          30,
        )
      ],
      "healingStations": [
        HealthStation(0, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
      ]
    },
    "Level 3": {
      "boundaryX": 10,
      "boundaryY": 10,
      "enemies": [
        EnemySpaceship(
          "Ferhat",
          MyColors.blue,
          Direction.backward,
          Direction.randomZDirection(),
          200,
          Random().nextInt(2) + 1,
          Random().nextInt(2) + 1,
          30,
        ),
        EnemySpaceship(
          "Ibo",
          MyColors.yellow,
          Direction.backward,
          Direction.randomZDirection(),
          200,
          Random().nextInt(2) + 1,
          Random().nextInt(2) + 1,
          30,
        ),
        EnemySpaceship(
          "Ralf",
          MyColors.green,
          Direction.backward,
          Direction.randomZDirection(),
          200,
          Random().nextInt(2) + 1,
          Random().nextInt(2) + 1,
          30,
        ),
        EnemySpaceship(
          "Jürgen",
          MyColors.red,
          Direction.backward,
          Direction.randomZDirection(),
          200,
          Random().nextInt(2) + 1,
          Random().nextInt(2) + 1,
          30,
        )
      ],
      "healingStations": [
        HealthStation(0, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, 0),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
        HealthStation(Random().nextInt(200) + 1, Random().nextInt(6) - 3),
      ]
    },
  };

  print(game(player1, levelMap));
}

// DAS SPIEL ALS FUNKTION  (Format der Level in der Map muss "Level #" sein.)

String game(
    PlayerSpaceship player, Map<String, Map<String, dynamic>> gameLevelMap) {
  int level = 1;
  String currentLevel = "Level $level";

  int time = 0;

  while (true) {
    if (player.lifePoints > 0) {
      if ((gameLevelMap[currentLevel]!["enemies"] as List<EnemySpaceship>)
          .isEmpty) {
        gameLevelMap.remove(currentLevel);
        level++;
        if (gameLevelMap.containsKey(currentLevel)) {
          print("Player ${player.name} Leveled Up!");
        } else {
          return "Player ${player.name} won the Game!";
        }
      } else {
        time++;
        print(time);
        player.move();
        print("${player.name}: (x: ${player.x}, z: ${player.z})");
        for (int i = 0;
            i <
                (gameLevelMap[currentLevel]!["healthStations"]
                        as List<HealthStation>)
                    .length;
            i++) {
          if (player.x ==
                  (gameLevelMap[currentLevel]!["healthStations"]
                          as List<HealthStation>)[i]
                      .x &&
              player.z ==
                  (gameLevelMap[currentLevel]!["healthStations"]
                          as List<HealthStation>)[i]
                      .z) {
            (gameLevelMap[currentLevel]!["healthStations"]
                    as List<HealthStation>)[i]
                .healPlayer(player);
          }
        }

        for (int i = 0;
            i <
                (gameLevelMap[currentLevel]!["enemies"] as List<EnemySpaceship>)
                    .length;
            i++) {
          (gameLevelMap[currentLevel]!["enemies"] as List<EnemySpaceship>)[i]
              .move();

          print(
              "${(gameLevelMap[currentLevel]!["enemies"] as List<EnemySpaceship>)[i].name}: (x: ${(gameLevelMap[currentLevel]!["enemies"] as List<EnemySpaceship>)[i].x}, z: ${(gameLevelMap[currentLevel]!["enemies"] as List<EnemySpaceship>)[i].z})");
          if (player.x ==
                  (gameLevelMap[currentLevel]!["enemies"]
                          as List<EnemySpaceship>)[i]
                      .x &&
              player.z ==
                  (gameLevelMap[currentLevel]!["enemies"]
                          as List<EnemySpaceship>)[i]
                      .z) {
            print(
                "Collision detected between ${player.name} and ${(gameLevelMap[currentLevel]![currentLevel] as List<EnemySpaceship>)[i].name}");
            (gameLevelMap[currentLevel]!["enemies"] as List<EnemySpaceship>)[i]
                .attackPlayer(player, 10);
            player.attackEnemy(
                (gameLevelMap[currentLevel]!["enemies"]
                    as List<EnemySpaceship>)[i],
                10);
            player.changeColor(MyColors.randomColor());
            (gameLevelMap[currentLevel]!["enemies"] as List<EnemySpaceship>)[i]
                .changeColor(MyColors.randomColor());
            // nach jeder kollision ändert die Farbe des Spaceships
          } else if ((gameLevelMap[currentLevel]!["enemies"]
                      as List<EnemySpaceship>)[i]
                  .lifePoints <=
              0) {
            print(
                "Enemy ${(gameLevelMap[currentLevel]!["enemies"] as List<EnemySpaceship>)[i].name} defeated.");
            (gameLevelMap[currentLevel]!["enemies"] as List<EnemySpaceship>)
                .removeWhere((enemy) => enemy.lifePoints <= 0);
          }
        }
      }
    } else {
      return "Player ${player.name} defeated. Game Over!";
    }
  }
}
