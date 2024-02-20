import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nimblerx_test/src/blocs/home/home_bloc.dart';
import 'package:nimblerx_test/src/blocs/order/order_bloc.dart';
import 'package:nimblerx_test/src/blocs/pharmacy/pharmacy_bloc.dart';
import 'package:nimblerx_test/src/widgets/pharmacy_card.dart';

import '../helper/helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primaryContainer,
        centerTitle: true,
        title: const Text('Pharmacy App'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 100,
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: FloatingActionButton(
          child: Text(
            'Order Now',
            style: textTheme.labelLarge,
          ),
          onPressed: () {
            // Get closests pharmacy to (37.48771670017411, -122.22652739630438)
            final list = context.read<HomeBloc>().state.pharmacies;
            list.sort((a, b) => Helper.calculateDistance(
                  37.48771670017411,
                  -122.22652739630438,
                  a.pharmacyDetail!.value.address.latitude,
                  a.pharmacyDetail!.value.address.longitude,
                ).compareTo(Helper.calculateDistance(
                  37.48771670017411,
                  -122.22652739630438,
                  b.pharmacyDetail!.value.address.latitude,
                  b.pharmacyDetail!.value.address.longitude,
                )));

            // LoadOrder event

            var hasOrder = context
                .read<HomeBloc>()
                .state
                .orders
                .any((o) => o.pharmacyId == list.first.pharmacyId);
            if (hasOrder) {
              ScaffoldMessenger.of(context).showMaterialBanner(
                MaterialBanner(
                  content: const Text('Order already placed with local pharmacy'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).clearMaterialBanners();
                      },
                      child: const Text('DISMISS'),
                    ),
                  ],
                ),
              );
            } else {
              context.read<OrderBloc>().add(LoadOrder(list.first));

              // Navigate to order screen
              context.goNamed(
                'order',
              );
            }
          },
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading ||
              state.status == HomeStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == HomeStatus.loaded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: state.pharmacies.map((p) {
                      final isOrder = state.orders
                          .any((order) => order.pharmacyId == p.pharmacyId);
                      return GestureDetector(
                        child: PharmacyCard(
                          pharmacy: p,
                          color: colorScheme.tertiaryContainer,
                          isOrder: isOrder,
                        ),
                        onTap: () {
                          final orderList = state.orders
                              .where(
                                  (order) => order.pharmacyId == p.pharmacyId)
                              .toList();
                          context.read<PharmacyBloc>().add(PharmacyLoadEvent(
                                p.pharmacyId,
                                p.name,
                                orderList,
                              ));
                          context.goNamed(
                            'pharmacy_detail',
                          );
                        },
                      );
                    }).toList(),
                  ),
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
