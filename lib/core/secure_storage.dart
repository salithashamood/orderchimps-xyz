import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum StorageKey { isLogin, token, userDetails }


//Singleton Data Pattern

class KeyChain {
  late final FlutterSecureStorage storage;

  static final KeyChain instance = KeyChain._internal();

  factory KeyChain() {
    return instance;
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  KeyChain._internal() {
    storage = FlutterSecureStorage(
      aOptions: _getAndroidOptions(),
    );
  }
}

class SecureStorage {
  //Remove all data
  static Future<void> removeAll() async {
    await KeyChain.instance.storage.deleteAll();
  }

  //Remove data by key
  static Future<void> removeByKey(StorageKey storageKey) async {
    await KeyChain.instance.storage.delete(key: storageKey.name);
  }

  //Set and get token
  static Future<void> setToken(String token) async {
    await KeyChain.instance.storage
        .write(key: StorageKey.token.name, value: token);
  }

  static Future<String?> getToken() async {
    String? returnValue = await KeyChain.instance.storage
        .read(key: StorageKey.token.name);
    if (returnValue != null) {
      return returnValue;
    } else {
      return null;
    }
  }
  //Set and get token

  //Set and get isLogin
  static Future<void> setLogin() async {
    await KeyChain.instance.storage
        .write(key: StorageKey.isLogin.name, value: '1');
  }

  static Future<void> setLogout() async {
    await KeyChain.instance.storage
        .write(key: StorageKey.isLogin.name, value: null);
  }

  static Future<String?> getIsLogin() async {
    String? returnValue = await KeyChain.instance.storage
        .read(key: StorageKey.isLogin.name);
    if (returnValue != null) {
      return returnValue;
    } else {
      return null;
    }
  }
  //Set and get isLogin

  //Set and get user details
  static Future<void> setUserDetails(String userDetails) async {
    await KeyChain.instance.storage
        .write(key: StorageKey.userDetails.name, value: userDetails);
  }

  static Future<String?> getUserDetails() async {
    String? returnValue = await KeyChain.instance.storage
        .read(key: StorageKey.userDetails.name);
    if (returnValue != null) {
      return returnValue;
    } else {
      return null;
    }
  }
  //Set and get user details
}
