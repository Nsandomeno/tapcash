import 'package:bdk_flutter/bdk_flutter.dart' as bdk;
import 'package:tapcash/node/constants.dart';
import 'package:tapcash/node/secure_kv.dart';

class SeedRepository {
  final SecureKVRepository secureKV;
  // TODO determine usage from ldk_node_flutter_demo
  static const _mnemonicKey = "mnemonic";

  SeedRepository({required this.secureKV});

  Future<bdk.Mnemonic> createMnemonic() async {
    return await bdk.Mnemonic.create(bdk.WordCount.Words24);
  }

  Future<bool> storeMnemonic(String mnemonic) async {
    return await secureKV.writeMaterial(
        SecureMaterial(_mnemonicKey, mnemonic)
      );
  }

  Future<bdk.Mnemonic?> readMnemonic() async {
    final words = await secureKV.readMaterial(_mnemonicKey);
    if (words != null) {
      return bdk.Mnemonic.fromString(words);
    } else {
      // TODO application error handling
      return null;
    }
  }

  Future<bool> deleteMnemonic() async {
    return await secureKV.deleteMaterial(_mnemonicKey);
  }
}

