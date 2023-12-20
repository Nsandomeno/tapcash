import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ldk_node/ldk_node.dart';

class NodeRepository {
  NodeRepository();

  void checkForDataDir() {}

  void generateNewKeys() {}

  void createDataDir() {}

  void createWallet() {}

  void readWallet() {}

  void restoreWallet() {}

}

final nodeProvider = Provider((ref) {
  return NodeRepository();
});
