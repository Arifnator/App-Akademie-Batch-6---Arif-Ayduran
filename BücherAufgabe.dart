List books = [
  ["Moby Dick", "Abenteuer", "Seefahrt", 8.5, 1851],
  ["1984", "Dystopie", "Politische Fiktion", 9.4, 1949],
  ["Der große Gatsby", "Roman", "Amerikanischer Traum", 8.7, 1925],
  ["Foundation", "Science Fiction", "Zukunft", 9.1, 1951]
];

List prefGenres = [
  ["Science Fiction", 10],
  ["Dystopie", 8]
];

List uGenres = [
  ["Zukunft", 5],
  ["Politische Fiktion", 7]
];

List recommendedBooks = [
  ["skksksks", 4.6]
];

void main() {
  for (var book in books) {
    String title = book[0];
    String genre = book[1];
    String uGenre = book[2];
    double review = book[3];
    int year = book[4];

    for (var prefGenre in prefGenres) {
      String prefGenreName = prefGenre[0];
      int prefGenrePrio = prefGenre[1];

      if (genre == prefGenreName) {
        double points = (prefGenrePrio + review) / 2;

        for (var uGenrePref in uGenres) {
          String uGenreName = uGenrePref[0];
          int uGenrePrio = uGenrePref[1];

          if (uGenre == uGenreName) {
            double endPoints = (uGenrePrio + points) / 2;
            recommendedBooks.add([title, endPoints]);
          }
        }
      }
    }
  }
  recommendedBooks.sort((a, b) => b[1].compareTo(a[1])); // Das einzige, was ich jetzt nicht nachvollziehen kann..
  for (var book in recommendedBooks) {
    print("Empfehle ${book[0]} mit einer Punktzahl von ${book[1]}.");
  }
}