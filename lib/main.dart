import 'package:flutter/material.dart' hide Builder;
//import 'package:ldk_node/ldk_node.dart';
import 'router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'tapCash',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

// class Home extends StatefulWidget {
//   const Home({super.key, required this.title});
//   final String title;

//   // final esploraUrl = "http://localhost:3002/regtest/api";

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final path = "../.regtest";
//   final esploraUrl = "http://localhost:3002/regtest/api";
  
//   final config = Config(
//     probingLiquidityLimitMultiplier: 3,
//     trustedPeers0Conf: [],
//     storageDirPath: "../.regtest",
//     network: Network.Regtest,
//     listeningAddress: const NetAddress.iPv4(addr: "0.0.0.0", port: 3006),
//     onchainWalletSyncIntervalSecs: 60,
//     walletSyncIntervalSecs: 20,
//     feeRateCacheUpdateIntervalSecs: 600,
//     logLevel: LogLevel.Debug,
//     defaultCltvExpiryDelta: 144
//   );


//   // void _incrementCounter() {
//   //   setState(() {

//   //     _counter++;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     // ignore: unused_local_variable
//     Builder builder = Builder.fromConfig(config: config);
//     final node = await builder
//       .setEntropyBip39Mnemonic(
//         mnemonic: Mnemonic('certain sense kiss guide crumble hint transfer crime much stereo warm coral')
//       )
//       .setEsploraServer(esploraServerUrl: esploraUrl)
//       .build();
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the Home object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
