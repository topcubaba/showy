import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage({required this.flutterSecureStorage})
    : assert(flutterSecureStorage != null);

  final FlutterSecureStorage flutterSecureStorage;
  final _storage = const FlutterSecureStorage();

  static const String storageEmailAddreessKey = 'isLogged';

  Future writeSecureData(String key, String email) async {
    var writeData = await _storage.write(key: storageEmailAddreessKey, value: email);
    return writeData;
  }

  Future readSecureData(String key) async {
    var readData = await _storage.read(key: storageEmailAddreessKey);
    return readData;
  }

  Future deleteSecureData(String key) async {
    var deleteData = await _storage.delete(key: storageEmailAddreessKey);
    return deleteData;
  }
}