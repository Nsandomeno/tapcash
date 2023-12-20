import 'package:tapcash/device.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureMaterial {
  SecureMaterial(this.key, this.value);

  final String key;
  final String value;
}


class SecureKVRepository {
  late Device _device;
  late FlutterSecureStorage _secureStorage;

  SecureKVRepository() {
    try {
      _device = Device();
      // init with options on android: 
      // https://pub.dev/packages/flutter_secure_storage#note-usage-of-encryptedsharedpreference
      _secureStorage = FlutterSecureStorage(
        aOptions: _device.getAndroidOptions(),
        iOptions: _device.getIosOptions(),
        lOptions: _device.getLinuxOptions(),
        wOptions: WindowsOptions.defaultOptions,
        webOptions: _device.getWebOptions(),
        mOptions: _device.getMacosOptions()
      );
    } catch (e) {
      // TODO handle error
      print("Failed to init SecureKVRepository with error $e");
    }
  }
  
  Future<bool> writeMaterial(SecureMaterial item) async {
    try {
      await _secureStorage.write(key: item.key, value: item.value);
      // TODO check that the write happened by reading the key
      // ...
      return true;
    } catch (e) {
      // TODO application error handling
      print("Failed to write secure material with error: $e");
      return false;
    }
  }

  Future<String?> readMaterial(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<bool> deleteMaterial(String key) async {
    try {
      await _secureStorage.delete(key: key);
      // TODO check that the delete happened by reading the key
      // and confirming none
      // ...
      return false;
    } catch (e) {
      // TODO application error handling
      print("Failed to delete secure material $key with error: $e");
      return false;
    }
  }
}

