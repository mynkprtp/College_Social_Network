// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class SecureStroage {
//   final storage = const FlutterSecureStorage(
//     aOptions: AndroidOptions(encryptedSharedPreferences: true),
//   );

//   Future writeSecureStorage(String key, String value) async {
//     var writeData = await storage.write(key: key, value: value);
//     return writeData;
//   }

//   Future<Map<String, String>> realStorage() async {
//     var data = await storage.readAll();
//     print(data);
//     return data;
//   }

//   Future deleteStorage() async {
//     await storage.deleteAll();
//     return;
//   }
// }
