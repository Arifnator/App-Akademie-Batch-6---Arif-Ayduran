// Schreibe ein Programm, das eine Liste von Studenten und deren Noten ausgibt, indem du eine verschachtelte for-Schleife verwendest.
// Wandle anschließend die verschachtelte for-Schleife in eine verschachtelte while-Schleife um, ohne das Ausgabeergebnis zu verändern.

void main() {
  List<Map<String, dynamic>> students = [
    {
      'name': 'Alice',
      'grades': [85, 90, 78]
    },
    {
      'name': 'Bob',
      'grades': [92, 88, 84]
    },
    {
      'name': 'Charlie',
      'grades': [75, 85, 80]
    },
  ];

  for (var student in students) {
    print('Student: ${student['name']}');
    for (var grade in student['grades']) {
      print('  Grade: $grade');
    }
  }

  int i = 0;

  while (i < students.length) {
    print('Student: ${students[i]['name']}');

    int j = 0;
    while (j < students[i]["grades"].length) {
      print("  Grade: ${students[i]['grades'][j]}");
      j++;
    }
    i++;
  }
}
