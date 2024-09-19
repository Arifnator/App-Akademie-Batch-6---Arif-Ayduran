// import "dart:io";

// import "package:firebase_storage/firebase_storage.dart";
// import "package:flutter/material.dart";
// import "package:firebase_core/firebase_core.dart";
// import "package:cloud_firestore/cloud_firestore.dart";
// import "package:image_picker/image_picker.dart";
// import "package:shared_preferences/shared_preferences.dart";

// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// String whereRatingValue = "Alle";
// String? wherePLZFilterValue;

// void _updateRestaurant(String restaurantId, Map<String, dynamic> updates) {
//   _firestore.collection("Restaurants").doc(restaurantId).update(updates);
// }

// void _deleteRestaurant(String restaurantId) {
//   _firestore.collection("Restaurants").doc(restaurantId).delete();
// }

// Future<File?> _pickImage() async {
//   File? image;

//   final ImagePicker picker = ImagePicker();
//   final XFile? pickedImage =
//       await picker.pickImage(source: ImageSource.gallery);

//   if (pickedImage != null) {
//     image = File(pickedImage.path);
//   }
//   return image;
// }

// Future<List> uploadImageToStorage(File image) async {
//   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//   Reference storageReference =
//       FirebaseStorage.instance.ref().child("images/$fileName");
//   UploadTask uploadTask = storageReference.putFile(image);
//   TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
//   String downloadUrl = await snapshot.ref.getDownloadURL();
//   return [downloadUrl, fileName];
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: "Firestore Realtime Listener",
//       home: RestaurantListPage(),
//     );
//   }
// }

// class RestaurantListPage extends StatefulWidget {
//   const RestaurantListPage({super.key});

//   @override
//   State<RestaurantListPage> createState() => _RestaurantListPageState();
// }

// class _RestaurantListPageState extends State<RestaurantListPage> {
//   String dropdownOrderByValue = "Name";
//   String dropdownOrderAscDescValue = "Aufsteigend";

//   TextEditingController wherePlzValueController = TextEditingController();
//   Color wherePlzAlertColor = Colors.white;

//   bool dropdownIsLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     loadPreferences();
//   }

//   void _showSnackbar(String text) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
//   }

//   Future<void> deleteImage(String fileName) async {
//     try {
//       Reference storageReference =
//           FirebaseStorage.instance.ref().child("images/$fileName");
//       await storageReference.delete();
//     } catch (e) {
//       _showSnackbar("Failed to delete image: $e");
//     }
//   }

//   Future<void> loadPreferences() async {
//     try {
//       await getOrderByfromPrefs();
//       await getOrderAscDescfromPrefs();
//     } catch (e) {
//       print("Fehler beim Laden der SharedPreferences: $e");
//     } finally {
//       setState(() {
//         dropdownIsLoading = false;
//       });
//     }
//   }

//   Future<void> getOrderByfromPrefs() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     dropdownOrderByValue = prefs.getString("dropdownOrderByValue") ?? "Name";
//   }

//   Future<void> getOrderAscDescfromPrefs() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     dropdownOrderAscDescValue =
//         prefs.getString("dropdownOrderAscDescValue") ?? "Aufsteigend";
//   }

//   Future<void> saveOrderBySettingsToPrefs(String dropdownOrderByValue) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString("dropdownOrderByValue", dropdownOrderByValue);
//     setState(() {
//       dropdownIsLoading = false;
//     });
//   }

//   Future<void> saveOrderAscDescSettingsToPrefs(
//       String dropdownOrderAscDescValue) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(
//         "dropdownOrderAscDescValue", dropdownOrderAscDescValue);
//     setState(() {
//       dropdownIsLoading = false;
//     });
//   }

//   void _showAddRestaurantDialog() {
//     final nameController = TextEditingController();
//     final plzController = TextEditingController();
//     final ratingController = TextEditingController();

//     bool isUndeletableChecked = false;

//     File? selectedImage;
//     bool isUploading = false;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               title: const Text("Neues Restaurant hinzufügen"),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(labelText: "Name"),
//                   ),
//                   TextField(
//                     controller: plzController,
//                     decoration: const InputDecoration(labelText: "PLZ"),
//                     keyboardType: TextInputType.number,
//                   ),
//                   TextField(
//                     controller: ratingController,
//                     decoration: const InputDecoration(labelText: "Rating"),
//                     keyboardType: TextInputType.number,
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       selectedImage != null
//                           ? IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   selectedImage = null;
//                                 });
//                               },
//                               icon: const Icon(Icons.delete))
//                           : const SizedBox(),
//                       selectedImage != null
//                           ? SizedBox(
//                               height: 50,
//                               width: 50,
//                               child: Image.file(
//                                 selectedImage!,
//                                 fit: BoxFit.fill,
//                               ))
//                           : const SizedBox(),
//                       ElevatedButton(
//                         onPressed: () {
//                           _pickImage().then((File? image) {
//                             setState(() {
//                               selectedImage = image;
//                             });
//                           });
//                         },
//                         child: const Text("Bild auswählen"),
//                       ),
//                     ],
//                   ),
//                   if (isUploading)
//                     const Padding(
//                       padding: EdgeInsets.only(top: 10),
//                       child: CircularProgressIndicator(),
//                     ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Checkbox(
//                           checkColor: Colors.white,
//                           fillColor:
//                               const WidgetStatePropertyAll(Colors.redAccent),
//                           value: isUndeletableChecked,
//                           onChanged: (bool? value) {
//                             setState(() {
//                               isUndeletableChecked = value!;
//                             });
//                           }),
//                       GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isUndeletableChecked = !isUndeletableChecked;
//                             });
//                           },
//                           child: const Text("Schreibgeschützt"))
//                     ],
//                   ),
//                 ],
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text("Abbrechen"),
//                 ),
//                 TextButton(
//                   onPressed: () async {
//                     int? rating = int.tryParse(ratingController.text);
//                     int? plz = int.tryParse(plzController.text);

//                     if (plz == null || plz < 10000 || plz > 99999) {
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               content: const Text(
//                                   "Bitte eine fünfstellige PLZ eingeben."),
//                               actions: [
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                   child: const Text("OK"),
//                                 ),
//                               ],
//                             );
//                           });
//                     } else if (rating == null || rating < 0 || rating > 5) {
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               content: const Text(
//                                   "Bitte Zahl zwischen 0 und 5 eingeben."),
//                               actions: [
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                   child: const Text("OK"),
//                                 ),
//                               ],
//                             );
//                           });
//                     } else {
//                       if (selectedImage != null) {
//                         setState(() {
//                           isUploading = true;
//                         });
//                         List uploadInfo =
//                             await uploadImageToStorage(selectedImage!);
//                         String imageUrl = uploadInfo[0];
//                         String imageFileName = uploadInfo[1];
//                         _firestore.collection("Restaurants").add({
//                           "Name": nameController.text,
//                           "PLZ": int.parse(plzController.text),
//                           "Rating": int.parse(ratingController.text),
//                           "imageUrl": imageUrl,
//                           "uploadedAt": Timestamp.now(),
//                           "imageFileName": imageFileName,
//                           "readonly": isUndeletableChecked,
//                         });
//                         setState(() {
//                           isUploading = false;
//                         });
//                         _showSnackbar(
//                             "Restaurant erfolgreich mit Bild hinzugefügt!");
//                         Navigator.of(context).pop();
//                       } else {
//                         _firestore.collection("Restaurants").add({
//                           "Name": nameController.text,
//                           "PLZ": int.parse(plzController.text),
//                           "Rating": int.parse(ratingController.text),
//                           "imageUrl": "null",
//                           "uploadedAt": "null",
//                           "imageFileName": "null",
//                           "readonly": isUndeletableChecked,
//                         });
//                         _showSnackbar(
//                             "Restaurant erfolgreich ohne Bild hinzugefügt!");
//                         Navigator.of(context).pop();
//                       }
//                     }
//                   },
//                   child: const Text("Hinzufügen"),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Restaurants"),
//       ),
//       body: dropdownIsLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       DropdownButton<String>(
//                         value: dropdownOrderByValue,
//                         icon: const Icon(Icons.arrow_downward),
//                         onChanged: (String? newValue) {
//                           setState(() {
//                             dropdownOrderByValue = newValue!;
//                           });
//                           saveOrderBySettingsToPrefs(newValue!);
//                         },
//                         items: <String>["Name", "PLZ", "Rating"]
//                             .map<DropdownMenuItem<String>>((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                       ),
//                       const SizedBox(
//                         width: 40,
//                       ),
//                       DropdownButton<String>(
//                         value: dropdownOrderAscDescValue,
//                         icon: const Icon(Icons.arrow_downward),
//                         onChanged: (String? newValue) {
//                           setState(() {
//                             dropdownOrderAscDescValue = newValue!;
//                           });
//                           saveOrderAscDescSettingsToPrefs(newValue!);
//                         },
//                         items: <String>[
//                           "Aufsteigend",
//                           "Absteigend",
//                         ].map<DropdownMenuItem<String>>((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 570,
//                     width: MediaQuery.of(context).size.width,
//                     child: StreamBuilder<QuerySnapshot>(
//                       stream: _firestore
//                           .collection("Restaurants")
//                           .where(
//                             "Rating",
//                             isEqualTo: whereRatingValue == "Alle"
//                                 ? null
//                                 : int.parse(whereRatingValue),
//                           )
//                           .where(
//                             "PLZ",
//                             isEqualTo: wherePLZFilterValue == null ||
//                                     wherePLZFilterValue!.isEmpty
//                                 ? null
//                                 : int.parse(wherePLZFilterValue!),
//                           )
//                           .orderBy(dropdownOrderByValue,
//                               descending:
//                                   dropdownOrderAscDescValue == "Aufsteigend"
//                                       ? false
//                                       : true)
//                           .snapshots(),
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return const Center(
//                               child: CircularProgressIndicator());
//                         }

//                         if (snapshot.hasError) {
//                           // _showSnackbar("Firestore error: ${snapshot.error}");
//                           print(snapshot.error);
//                           return Text("Error: ${snapshot.error}");
//                         }

//                         if (!snapshot.hasData ||
//                             snapshot.data == null ||
//                             snapshot.data!.docs.isEmpty) {
//                           return const Center(child: Text("No data found"));
//                         }

//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return const Center(
//                               child: CircularProgressIndicator());
//                         }

//                         final restaurants = snapshot.data?.docs ?? [];

//                         return ListView.builder(
//                           itemCount: restaurants.length,
//                           itemBuilder: (context, index) {
//                             final restaurantData = restaurants[index].data()
//                                 as Map<String, dynamic>;
//                             final restaurantId = restaurants[index].id;

//                             return ListTile(
//                               title: Text(restaurantData["Name"] ?? "Unknown"),
//                               subtitle: Text(
//                                   "PLZ: ${restaurantData["PLZ"]}, Rating: ${restaurantData["Rating"]}"),
//                               trailing: restaurantData["readonly"] == true
//                                   ? null
//                                   : IconButton(
//                                       icon: const Icon(Icons.delete),
//                                       onPressed: () {
//                                         showDialog(
//                                             context: context,
//                                             builder: (BuildContext context) {
//                                               return AlertDialog(
//                                                 content: const Text(
//                                                     "Soll der Restaurant wirklich gelöscht werden?"),
//                                                 actions: [
//                                                   TextButton(
//                                                     onPressed: () {
//                                                       _deleteRestaurant(
//                                                           restaurantId);
//                                                       restaurantData[
//                                                                   "imageFileName"] !=
//                                                               "null"
//                                                           ? deleteImage(
//                                                               restaurantData[
//                                                                   "imageFileName"])
//                                                           : null;
//                                                       ScaffoldMessenger.of(
//                                                               context)
//                                                           .showSnackBar(
//                                                               const SnackBar(
//                                                                   content: Text(
//                                                                       "Restaurant erfolgreich gelöscht!")));
//                                                       Navigator.of(context)
//                                                           .pop();
//                                                     },
//                                                     child: const Text("Ja"),
//                                                   ),
//                                                   TextButton(
//                                                     onPressed: () {
//                                                       Navigator.of(context)
//                                                           .pop();
//                                                     },
//                                                     child: const Text("Nein"),
//                                                   ),
//                                                 ],
//                                               );
//                                             });
//                                       },
//                                     ),
//                               onTap: () {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (BuildContext context) =>
//                                         RestaurantDetailScreen(
//                                             restaurantId: restaurantId,
//                                             data: restaurantData)));
//                               },
//                             );
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 50,
//                     width: MediaQuery.of(context).size.width,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         DropdownButton<String>(
//                           value: whereRatingValue,
//                           icon: const Icon(Icons.arrow_downward),
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               whereRatingValue = newValue!;
//                             });
//                           },
//                           items: <String>["Alle", "0", "1", "2", "3", "4", "5"]
//                               .map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         Expanded(
//                           child: TextField(
//                             controller: wherePlzValueController,
//                             decoration: InputDecoration(
//                                 labelText: "PLZ Filtern",
//                                 border: const OutlineInputBorder(),
//                                 fillColor: wherePlzAlertColor,
//                                 filled: true),
//                             keyboardType: TextInputType.number,
//                             onChanged: (value) {
//                               int? parsing = int.tryParse(value);
//                               if (parsing == null ||
//                                   parsing < 10000 ||
//                                   parsing > 99999) {
//                                 if (value.isEmpty) {
//                                   setState(() {
//                                     wherePlzAlertColor = Colors.white;
//                                     wherePLZFilterValue = null;
//                                   });
//                                 } else {
//                                   setState(() {
//                                     wherePlzAlertColor = Colors.red;
//                                     // _showSnackbar(
//                                     //     "Text muss eine gültige Postleitzahl sein (10000-99999)");
//                                   });
//                                 }
//                               } else {
//                                 setState(() {
//                                   wherePlzAlertColor = Colors.white;
//                                   wherePLZFilterValue = value;
//                                 });
//                               }
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 65,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _showAddRestaurantDialog();
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class RestaurantDetailScreen extends StatefulWidget {
//   const RestaurantDetailScreen(
//       {super.key, required this.restaurantId, required this.data});

//   final String restaurantId;
//   final Map<String, dynamic> data;

//   @override
//   State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
// }

// class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
//   final nameController = TextEditingController();
//   final plzController = TextEditingController();
//   final ratingController = TextEditingController();

//   File? selectedImage;

//   bool isUploading = false;

//   @override
//   void initState() {
//     super.initState();
//     nameController.text = widget.data["Name"];
//     plzController.text = widget.data["PLZ"].toString();
//     ratingController.text = widget.data["Rating"].toString();
//   }

//   void _showSnackbar(String text) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
//   }

//   Future<String> loadImage(String imageName) async {
//     try {
//       Reference storageReference =
//           FirebaseStorage.instance.ref().child("images/$imageName");
//       String imageUrl = await storageReference.getDownloadURL();
//       return imageUrl;
//     } catch (e) {
//       _showSnackbar("Fehler beim Laden des Bildes: $e");
//       return "";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Restaurant: ${widget.data["Name"]}"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               child: SizedBox(
//                 child: Column(
//                   children: [
//                     widget.data["readonly"] == true
//                         ? Text("Name: ${widget.data["Name"]}")
//                         : TextField(
//                             controller: nameController,
//                             decoration:
//                                 const InputDecoration(labelText: "Name:"),
//                           ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     widget.data["readonly"] == true
//                         ? Text("PLZ: ${widget.data["PLZ"]}")
//                         : TextField(
//                             controller: plzController,
//                             decoration:
//                                 const InputDecoration(labelText: "PLZ:"),
//                             keyboardType: TextInputType.number,
//                           ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     widget.data["readonly"] == true
//                         ? Text("Rating: ${widget.data["Rating"]}")
//                         : TextField(
//                             controller: ratingController,
//                             decoration:
//                                 const InputDecoration(labelText: "Rating:"),
//                             keyboardType: TextInputType.number,
//                           ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     widget.data["readonly"] == true
//                         ? widget.data["imageUrl"] == "null"
//                             ? const Text("Kein Bild hochgeladen")
//                             : Image.network(widget.data["imageUrl"])
//                         : widget.data["imageUrl"] == "null"
//                             ? selectedImage == null
//                                 ? TextButton(
//                                     onPressed: () async {
//                                       selectedImage = await _pickImage();
//                                       setState(() {});
//                                     },
//                                     child: const Text("Bild hochladen"))
//                                 : GestureDetector(
//                                     onTap: () async {
//                                       selectedImage = await _pickImage();
//                                       setState(() {});
//                                     },
//                                     child: Image.file(selectedImage!))
//                             : selectedImage == null
//                                 ? SizedBox(
//                                     height: 300,
//                                     child: Column(
//                                       children: [
//                                         // Text(widget.data["uploadedAt"].toString()),
//                                         GestureDetector(
//                                             onTap: () async {
//                                               selectedImage =
//                                                   await _pickImage();
//                                               setState(() {});
//                                             },
//                                             child: Image.network(
//                                                 widget.data["imageUrl"])),
//                                       ],
//                                     ),
//                                   )
//                                 : GestureDetector(
//                                     onTap: () async {
//                                       selectedImage = await _pickImage();
//                                       setState(() {});
//                                     },
//                                     child: Image.file(selectedImage!)),
//                     if (isUploading)
//                       const Padding(
//                         padding: EdgeInsets.only(top: 10),
//                         child: CircularProgressIndicator(),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//             widget.data["readonly"] == true
//                 ? const Text(
//                     "Dieses Restaurant ist Schreibgeschützt.",
//                     style: TextStyle(
//                         color: Colors.red, fontWeight: FontWeight.bold),
//                   )
//                 : ElevatedButton(
//                     onPressed: () async {
//                       int? rating = int.tryParse(ratingController.text);
//                       int? plz = int.tryParse(plzController.text);

//                       if (plz == null || plz < 10000 || plz > 99999) {
//                         showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return AlertDialog(
//                                 content: const Text(
//                                     "Bitte eine fünfstellige PLZ eingeben."),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () {
//                                       Navigator.of(context).pop();
//                                     },
//                                     child: const Text("OK"),
//                                   ),
//                                 ],
//                               );
//                             });
//                       } else if (rating == null || rating < 0 || rating > 5) {
//                         showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return AlertDialog(
//                                 content: const Text(
//                                     "Bitte Zahl zwischen 0 und 5 eingeben."),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () {
//                                       Navigator.of(context).pop();
//                                     },
//                                     child: const Text("OK"),
//                                   ),
//                                 ],
//                               );
//                             });
//                       } else {
//                         if (selectedImage != null &&
//                             widget.data["imageUrl"] != "null") {
//                           setState(() {
//                             isUploading = true;
//                           });
//                           List uploadInfo =
//                               await uploadImageToStorage(selectedImage!);
//                           String imageUrl = uploadInfo[0];
//                           String imageFileName = uploadInfo[1];
//                           _updateRestaurant(widget.restaurantId, {
//                             "Name": nameController.text,
//                             "PLZ": int.parse(plzController.text),
//                             "Rating": int.parse(ratingController.text),
//                             "imageUrl": imageUrl,
//                             "uploadedAt": Timestamp.now(),
//                             "imageFileName": imageFileName,
//                           });
//                           setState(() {
//                             isUploading = false;
//                           });
//                           _showSnackbar(
//                               "Restaurant erfolgreich mit Bild Aktuallisiert!");
//                           Navigator.of(context).pop();
//                         } else if (selectedImage == null &&
//                             widget.data["imageUrl"] != "null") {
//                           _updateRestaurant(widget.restaurantId, {
//                             "Name": nameController.text,
//                             "PLZ": int.parse(plzController.text),
//                             "Rating": int.parse(ratingController.text),
//                             "imageUrl": widget.data["imageUrl"],
//                             "uploadedAt": widget.data["uploadedAt"],
//                             "imageFileName": widget.data["imageFileName"],
//                           });
//                           _showSnackbar(
//                               "Restaurant erfolgreich mit Bild Aktuallisiert!");
//                           Navigator.of(context).pop();
//                         } else if (selectedImage != null &&
//                             widget.data["imageUrl"] == "null") {
//                           setState(() {
//                             isUploading = true;
//                           });
//                           List uploadInfo =
//                               await uploadImageToStorage(selectedImage!);
//                           String imageUrl = uploadInfo[0];
//                           String imageFileName = uploadInfo[1];
//                           _updateRestaurant(widget.restaurantId, {
//                             "Name": nameController.text,
//                             "PLZ": int.parse(plzController.text),
//                             "Rating": int.parse(ratingController.text),
//                             "imageUrl": imageUrl,
//                             "uploadedAt": Timestamp.now(),
//                             "imageFileName": imageFileName,
//                           });
//                           setState(() {
//                             isUploading = false;
//                           });
//                           _showSnackbar(
//                               "Restaurant erfolgreich mit Bild Aktuallisiert!");
//                           Navigator.of(context).pop();
//                         } else if (selectedImage == null &&
//                             widget.data["imageUrl"] == "null") {
//                           _updateRestaurant(widget.restaurantId, {
//                             "Name": nameController.text,
//                             "PLZ": int.parse(plzController.text),
//                             "Rating": int.parse(ratingController.text),
//                             "imageUrl": "null",
//                             "uploadedAt": "null",
//                             "imageFileName": "null",
//                           });
//                           _showSnackbar(
//                               "Restaurant erfolgreich ohne Bild Aktuallisiert!");
//                           Navigator.of(context).pop();
//                         }
//                       }
//                     },
//                     child: const Text("Update"),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }
