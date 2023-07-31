import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {

  final _storage = const FlutterSecureStorage();

  static const String secureKey = 'isLogged';

  Future writeSecureData(String key, String isLogged) async {
    var writeData = await _storage.write(key: secureKey, value: isLogged);
    return writeData;
  }

  Future readSecureData(String key) async {
    var readData = await _storage.read(key: secureKey);
    return readData;
  }

  Future deleteSecureData(String key) async {
    var deleteData = await _storage.delete(key: secureKey);
    return deleteData;
  }
}