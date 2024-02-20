import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nimblerx_test/src/blocs/pharmacy/pharmacy_bloc.dart';

class PharmacyDetailScreen extends StatelessWidget {
  const PharmacyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: BlocBuilder<PharmacyBloc, PharmacyState>(
        builder: (context, state) {
          if (state.status == PharmacyStatus.loading ||
              state.status == PharmacyStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == PharmacyStatus.loaded) {
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
                        state.pharmacyName,
                        style: textTheme.headlineLarge,
                      ),
                      backgroundColor: colorScheme.primaryContainer,
                    ),
                    //address
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        left: 8,
                        right: 8,
                        bottom: 8,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                        child: Text(
                          state.pharmacy!.value.address.streetAddress1,
                          style: textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    //primary phone number
                    state.pharmacy!.value.primaryPhoneNumber != ''
                        ? Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 8,
                              right: 8,
                              bottom: 8,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ),
                              child: Text(
                                state.pharmacy!.value.primaryPhoneNumber,
                                style: textTheme.labelLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    // pharmacy hours
                    state.pharmacy!.value.pharmacyHours != ''
                        ? Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 8,
                              right: 8,
                              bottom: 8,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ),
                              child: Text(
                                state.pharmacy!.value.pharmacyHours,
                                style: textTheme.labelLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                    state.pharmacyOrders.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(),
                                      ),
                                    ),
                                    child: Text(
                                      'Order',
                                      style: textTheme.titleLarge,
                                    ),
                                  ),
                                  Column(
                                    children: state
                                        .pharmacyOrders.first.medications
                                        .map((m) {
                                      return Text(
                                        m,
                                        style: textTheme.bodyLarge,
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox(),
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
