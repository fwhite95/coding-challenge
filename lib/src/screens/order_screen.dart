import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nimblerx_test/src/blocs/home/home_bloc.dart';
import 'package:nimblerx_test/src/blocs/medication/medication_bloc.dart';
import 'package:nimblerx_test/src/blocs/order/order_bloc.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state.status == OrderStatus.loading ||
              state.status == OrderStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == OrderStatus.loaded) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // name
                    AppBar(
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          context.goNamed(
                            'home',
                          );
                        },
                      ),
                      centerTitle: true,
                      title: Text(
                        'Order',
                        style: textTheme.headlineLarge,
                      ),
                      backgroundColor: colorScheme.primaryContainer,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // List of medications
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.order!.medications.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: colorScheme.secondaryContainer,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.medication),
                                Expanded(
                                  child: Text(
                                    state.order!.medications[index],
                                    style: textTheme.labelLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    // Add medication button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: colorScheme.tertiaryContainer,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                color: colorScheme.tertiary,
                              ),
                              onPressed: () {
                                context
                                    .read<MedicationBloc>()
                                    .add(const MedicationLoadEvent());
                                context.goNamed('medication');
                              },
                            ),
                            const Text('Add Medication to Order'),
                          ],
                        ),
                      ),
                    ),
                    // Confirm order button
                    const SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          colorScheme.secondaryContainer,
                        ),
                      ),
                      onPressed: () {
                        // Bloc
                        context
                            .read<HomeBloc>()
                            .add(AddOrderHome(state.order!));
                        // Navigate to home
                        context.goNamed('home');
                      },
                      child: const Text('Confirm Order'),
                    ),
                  ],
                ),
              ),
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
