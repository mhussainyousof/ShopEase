import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/layout/grid_layout.dart';
import 'package:shop_ease/common/widgets/products/product_cart/product_card_vertical.dart';
import 'package:shop_ease/features/shop/controllers/all_product_controller.dart';
import 'package:shop_ease/features/shop/models/product_model.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class ESortableProducts extends StatelessWidget {
  const ESortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product sorting
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);

    return Column(
      children: [
        // 🔽 Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            // Sort products based on the selected option
            controller.sortProducts(value!);
          },
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),

        const SizedBox(height: TSizes.spaceBtwSections),

        // 🛒 Products Grid
        Obx(() => EGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) => EProductCardVertical(
                productModel: controller.products[index],
              ),
            )),
      ],
    );
  }
}

