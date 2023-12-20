import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tapcash/screens/dashboard.dart';

import 'screens/landing.dart';

enum Routes {
  landing,
  dashboard,
}

// TODO
// create or load wallet (eventually restore as well).
// final walletProvider = Provider<Wallet>((ref) {

// });

// TODO
// firebase auth for general application user

final routerProvider = Provider<GoRouter>((ref) {
  // TODO add providers

  return GoRouter(
    initialLocation: "landing",
    debugLogDiagnostics: true,
    redirect: (context, state) {
      // TODO implement auth (general and wallet load/create)
      return null;
    },
    routes: [
      GoRoute(
        path: "/landing",
        name: Routes.landing.name,
        builder: (context, state) => const Landing()
      ),
      GoRoute(
        path: "/dashboard",
        name: Routes.dashboard.name,
        builder: (context, state) => const Dashboard(),
      )
    ],
  );
});

