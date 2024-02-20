import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nimblerx_test/src/screens/home_screen.dart';
import 'package:nimblerx_test/src/screens/medication_screen.dart';
import 'package:nimblerx_test/src/screens/order_screen.dart';

import '../screens/pharmacy_detail_screen.dart';

class AppRouter {
  AppRouter();

  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: 'pharmacy_detail',
        path: '/pharmacyDetail',
        builder: (BuildContext context, GoRouterState state) {
          return const PharmacyDetailScreen();
        },
      ),
      GoRoute(
        name: 'order',
        path: '/order',
        builder: (BuildContext context, GoRouterState state) {
          return const OrderScreen();
        },
      ),
      GoRoute(
        name: 'medication',
        path: '/medication',
        builder: (BuildContext context, GoRouterState state) {
          return const MedicationScreen();
        },
      ),
    ],
  );
}
