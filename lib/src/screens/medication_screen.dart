import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nimblerx_test/src/blocs/medication/medication_bloc.dart';
import 'package:nimblerx_test/src/blocs/order/order_bloc.dart';

class MedicationScreen extends StatelessWidget {
  const MedicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medications'),
        backgroundColor: colorScheme.primaryContainer,
      ),
      body: BlocBuilder<MedicationBloc, MedicationState>(
        builder: (context, state) {
          if (state.status == MedicationStatus.loading ||
              state.status == MedicationStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == MedicationStatus.loaded) {
            return Center(
              child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: ListView.builder(
                    itemCount: state.medications.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        tileColor: index % 2 == 0
                            ? colorScheme.tertiaryContainer
                            : colorScheme.secondaryContainer,
                        title: Text(
                          state.medications[index],
                        ),
                        onTap: () {
                          context.read<OrderBloc>().add(
                                AddMedicationToOrder(state.medications[index]),
                              );
                          context.goNamed('order');
                        },
                      );
                    },
                  )),
            );
          } else {
            return Center(
              child: Text(
                'Something went wrong',
                style: textTheme.bodyLarge,
              ),
            );
          }
        },
      ),
    );
  }
}
