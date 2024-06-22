/* Erstelle die Klasse Spaceship, die die Eigenschaften und Methoden eines Raumschiffs enthält.
Jedes Raumschiff sollte über ...

Eine X- und Y-Position
Eine Geschwindigkeit
Eine Anzahl an Lebenspunkten verfügen.
Implementiere in der Klasse Methoden namens:

move(), die das Raumschiff entsprechend seiner aktuellen Geschwindigkeit bewegt und
Eine Methode namens damagePlayer() um die Lebenspunkte des Raumschiffs zu aktualisieren.
Diese Methode sollte einen Parameter damage akzeptieren, der die Schadensmenge repräsentiert und von den Lebenspunkten
des Raumschiffs abgezogen wird.
Leite von der Klasse Spaceship die Klasse PlayerSpaceship ab. Diese Klasse repräsentiert das Raumschiff des
Spielers und sollte zusätzlich eine Methode zum Abfeuern von Geschossen enthalten. Hier soll der Text Peng Peng! ausgegeben werden.

Leite ebenfalls von der Klasse Spaceship die Klasse EnemySpaceship ab. Diese Klasse repräsentiert die feindlichen Raumschiffe.
Implementiere eine Methode, um denm Spieler anzugreifen und seine Lebenspunkte zu reduzieren. Die Methode enthälts als
Parameter den Spieler, welcher angegriffen wird und die Menge an Schaden, die vom Spielerleben abgezogen wird.

Im main-Teil des Programms, erstelle ein Spieler-Raumschiff und eine Liste von feindlichen Raumschiffen.
Setze die Ausgangswerte der Raumschiffe (Position, Geschwindigkeit, Lebenspunkte) wie du möchtest.

Implementiere eine Schleife, die das Spiel kontinuierlich aktualisiert:

In jeder Iteration der Schleife sollen die Positionen aller, sowohl Spieler als auch feindliche, Raumschiffe aktualisiert werden.
Rufe auch die Methoden zum Angriff des Spielers und der feindlichen Raumschiffe auf.
Überprüfe innerhalb der Schleife, ob es zu Kollisionen zwischen dem Spieler-Raumschiff und den feindlichen Raumschiffen gekommen ist.
Wenn ja, reduziere die Lebenspunkte vom Spieler und dem entsprechenden Feind um je 10 Punkte.
Überprüfe am Ende jeder Iteration der Schleife, ob der Spieler gewonnen oder verloren hat.
Der Spieler hat verloren, wenn die Lebenspunkte seines Raumschiffs auf 0 fallen. Der Spieler hat gewonnen,
wenn alle feindlichen Raumschiffe zerstört wurden. (Überprüfe hier zudem die HP aller Gegner)
Viel Erfolg! */

import "dart:math";

class Spaceship {
  String name;
  int x;
  int y;
  int speed;
  int verticalSpeed;
  int lifePoints;

  Spaceship(this.name, this.x, this.y, this.speed, this.verticalSpeed,
      this.lifePoints);

  void move() {
    x += speed;
    y += verticalSpeed;
  }

  void damagePlayer(int damage) => lifePoints -= damage;
}

class PlayerSpaceship extends Spaceship {
  PlayerSpaceship(super.name, super.x, super.y, super.speed,
      super.verticalSpeed, super.lifePoints);

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
  EnemySpaceship(super.name, super.x, super.y, super.speed, super.verticalSpeed,
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
    random.nextInt(3),
    random.nextInt(3),
    random.nextInt(2) + 1,
    random.nextInt(2) + 1,
    30,
  );

  List<EnemySpaceship> enemies = [
    EnemySpaceship(
      "Ferhat",
      random.nextInt(3),
      random.nextInt(3),
      random.nextInt(2) + 1,
      random.nextInt(2) + 1,
      30,
    ),
    EnemySpaceship(
      "Ibo",
      random.nextInt(3),
      random.nextInt(3),
      random.nextInt(2) + 1,
      random.nextInt(2) + 1,
      30,
    ),
    EnemySpaceship(
      "Ralf",
      random.nextInt(3),
      random.nextInt(3),
      random.nextInt(2) + 1,
      random.nextInt(2) + 1,
      30,
    ),
    EnemySpaceship(
      "Jürgen",
      random.nextInt(3),
      random.nextInt(3),
      random.nextInt(2) + 1,
      random.nextInt(2) + 1,
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
      print("${player1.name}: (x: ${player1.x}, y: ${player1.y})");

      for (int i = 0; i < enemies.length; i++) {
        enemies[i].move();

        print("${enemies[i].name}: (x: ${enemies[i].x}, y: ${enemies[i].y})");
        if (player1.x == enemies[i].x) {
          //  && player1.y == enemies[i].y
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

