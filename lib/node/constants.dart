import 'package:bdk_flutter/bdk_flutter.dart' as bdk;
// TODO give credit to ldk_node_flutter_workshop
// in all inspired places.
enum Network {
  bitcoin,
  testnet,
  regtest,
  //signet,
}


extension NetworkX on Network {
  bdk.Network get asBdkNetwork {
    switch (this) {
      case Network.bitcoin:
        return bdk.Network.Bitcoin;
      case Network.testnet:
        return bdk.Network.Testnet;
      case Network.regtest:
        return bdk.Network.Regtest;
      // signet not implemented
    }
  }
}