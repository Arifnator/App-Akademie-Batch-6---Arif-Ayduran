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

import "dart:math";


enum MyColors { red, blue, yellow, green }

class Spaceship {
  String name;
  MyColors color;
  int x;
  int y;
  int z;
  int speed;
  int verticalSpeed;
  int directionSpeed;
  bool isForward;
  bool isSlope;
  bool isRight;
  int lifePoints;

  Spaceship(
      this.name,
      this.color,
      this.x,
      this.y,
      this.z,
      this.speed,
      this.verticalSpeed,
      this.directionSpeed,
      this.isForward,
      this.isSlope,
      this.isRight,
      this.lifePoints);

  void changeColor(MyColors newColor) {
    color = newColor;
  }

  void move() {
    switch (isForward) {
      case true:
        x += speed;
      case false:
        x -= speed;
    }

    switch (isSlope) {
      case true:
        y += verticalSpeed;
      case false:
        y -= verticalSpeed;
    }
    switch (isRight) {
      case true:
        z += directionSpeed;
      case false:
        z -= directionSpeed;
    }
  }

  void damagePlayer(int damage) => lifePoints -= damage;
}

class PlayerSpaceship extends Spaceship {
  PlayerSpaceship(
      super.name,
      super.color,
      super.x,
      super.y,
      super.z,
      super.speed,
      super.verticalSpeed,
      super.directionSpeed,
      super.isForward,
      super.isSlope,
      super.isRight,
      super.lifePoints);

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
  EnemySpaceship(
      super.name,
      super.color,
      super.x,
      super.y,
      super.z,
      super.speed,
      super.verticalSpeed,
      super.directionSpeed,
      super.isForward,
      super.isSlope,
      super.isRight,
      super.lifePoints);

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

void main() {
  Random random = Random();
  PlayerSpaceship player1 = PlayerSpaceship(
    "Arif",
    MyColors.red,
    random.nextInt(3),
    random.nextInt(10),
    random.nextInt(3),
    random.nextInt(2) + 1,
    random.nextInt(2) + 1,
    random.nextInt(2) + 1,
    true,
    random.nextBool(),
    random.nextBool(),
    30,
  );

  List<EnemySpaceship> enemies = [
    EnemySpaceship(
      "Ferhat",
      MyColors.blue,
      random.nextInt(3),
      random.nextInt(10),
      random.nextInt(3),
      random.nextInt(2) + 1,
      random.nextInt(2) + 1,
      random.nextInt(2) + 1,
      false,
      random.nextBool(),
      random.nextBool(),
      30,
    ),
    EnemySpaceship(
      "Ibo",
      MyColors.yellow,
      random.nextInt(3),
      random.nextInt(10),
      random.nextInt(3),
      random.nextInt(2) + 1,
      random.nextInt(2) + 1,
      random.nextInt(2) + 1,
      false,
      random.nextBool(),
      random.nextBool(),
      30,
    ),
    EnemySpaceship(
      "Ralf",
      MyColors.green,
      random.nextInt(3),
      random.nextInt(10),
      random.nextInt(3),
      random.nextInt(2) + 1,
      random.nextInt(2) + 1,
      random.nextInt(2) + 1,
      false,
      random.nextBool(),
      random.nextBool(),
      30,
    ),
    EnemySpaceship(
      "Jürgen",
      MyColors.red,
      random.nextInt(3),
      random.nextInt(10),
      random.nextInt(3),
      random.nextInt(2) + 1,
      random.nextInt(2) + 1,
      random.nextInt(2) + 1,
      false,
      random.nextBool(),
      random.nextBool(),
      30,
    ),
  ];

  int time = 0;

  while (true) {
    if (player1.lifePoints <= 0) {
      print("Player ${player1.name} defeated.");
      break;
    } else if (enemies.isEmpty) {
      print("Player ${player1.name} wins.");
      break;
    } else {
      time++;
      print(time);
      player1.move();
      print(
          "${player1.name}: (x: ${player1.x}, y: ${player1.y}, z: ${player1.z}))");

      for (int i = 0; i < enemies.length; i++) {
        enemies[i].move();

        print(
            "${enemies[i].name}: (x: ${enemies[i].x}, y: ${enemies[i].y},  z: ${enemies[i].z})");
        if (player1.x == enemies[i].x &&
            player1.y == enemies[i].y &&
            player1.z == enemies[i].z) {
          print(
              "Collision detected between ${player1.name} and ${enemies[i].name}");
          enemies[i].attackPlayer(player1, 10);
          player1.attackEnemy(enemies[i], 10);
        } else if (enemies[i].lifePoints <= 0) {
          print("Enemy ${enemies[i].name} defeated.");
          enemies.remove(enemies[i]);
        }
      }
    }
  }
}
