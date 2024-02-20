import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nimblerx_test/src/blocs/home/home_bloc.dart';
import 'package:nimblerx_test/src/blocs/medication/medication_bloc.dart';
import 'package:nimblerx_test/src/blocs/order/order_bloc.dart';
import 'package:nimblerx_test/src/blocs/pharmacy/pharmacy_bloc.dart';
import 'package:nimblerx_test/src/repositories/medication_repository.dart';
import 'package:nimblerx_test/src/repositories/pharmacy_repository.dart';

import 'navigator/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    required this.pharmacyRepository,
    required this.medicationRepository,
    super.key,
  });

  final PharmacyRepository pharmacyRepository;
  final MedicationRepository medicationRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: pharmacyRepository),
        RepositoryProvider.value(value: medicationRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(
              pharmacyRepository: context.read<PharmacyRepository>(),
            )..add(const HomeLoadEvent()),
          ),
          BlocProvider(
              create: (context) => PharmacyBloc(
                    pharmacyRepository: context.read<PharmacyRepository>(),
                  )),
          BlocProvider(create: (context) => OrderBloc()),
          BlocProvider(
              create: (context) => MedicationBloc(
                    medicationRepository: context.read<MedicationRepository>(),
                  )),
        ],
        child: MaterialApp.router(
          title: 'NimbleRx',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
            ),
            useMaterial3: true,
          ),
          routerConfig: AppRouter().router,
        ),
      ),
    );
  }
}
