import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:shop_ease/common/widgets/sortable/sortable_products.dart';
import 'package:shop_ease/features/shop/controllers/all_product_controller.dart';
import 'package:shop_ease/features/shop/models/product_model.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/cloud_helper_functions.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product fetching
    final controller = Get.put(AllProductsController());

    return Scaffold(
      // AppBar
      appBar: MyAppBar(title: Text(title), showBackArrow: true),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              // Check the state of the FutureBuilder snapshot
              const loader = EVerticalProductShimmer();

              final widget = TCloudHelperFunctions.checkMultiRecordState(
                snapshot: snapshot,
                loader: loader,
              );

// Return appropriate widget based on snapshot state
              if (widget != null) return widget;

              // Products found!
              final products = snapshot.data!;

              return ESortableProducts(
                products: products,
              );
            },
          ),
        ),
      ),
    );
  }
}
