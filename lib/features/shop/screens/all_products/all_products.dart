import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:shop_ease/common/widgets/sortable/sortable_products.dart';
import 'package:shop_ease/features/shop/controllers/all_product_controller.dart';
import 'package:shop_ease/features/shop/models/product_model.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

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
            if (snapshot.connectionState == ConnectionState.waiting) {
              return loader;
            }

            if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
              return const Center(child: Text('No Data Found!'));
            }

            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong.'));
            }

            // Products found!
            final products = snapshot.data!;

            return  ESortableProducts(products: products,);
          },
        ),
      ),
    ),
  );
}

}
