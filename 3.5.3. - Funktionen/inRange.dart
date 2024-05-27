// Schreibe eine Funktion inRange(int a; int min, int max), die überprüft,
// ob Zahl a zwischen der unteren Grenze min und der oberen Grenze max liegt (beide inklusive).
// Wenn ja, dann gib true zurück, sonst gibt false zurück.

inRange (int a, int min, int max){
  if (a >= min && a < max){
return true;
  } else {
    return false;
  }
}


void main (){

print (inRange(10, 1, 100));


}