import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/icons/circular_icon.dart';
import 'package:shop_ease/common/widgets/layout/grid_layout.dart';
import 'package:shop_ease/common/widgets/loaders/animation_loader.dart';
import 'package:shop_ease/common/widgets/products/product_cart/product_card_vertical.dart';
import 'package:shop_ease/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:shop_ease/features/shop/controllers/product/favorite_controller.dart';
import 'package:shop_ease/features/shop/screens/home/home.dart';
import 'package:shop_ease/navigation_home.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/cloud_helper_functions.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;

    return Scaffold(
      // Custom AppBar
      appBar: MyAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          ECircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {
                //! Nothing Found Widget
                final emptyWidget = EAnimationLoaderWidget(
                  text: 'Whoops! Wishlist is Empty...',
                  animation: TImages.pencilAnimation,
                  showAction: true,
                  actionText: 'Let\'s add some',
                  onActionPressed: () => Get.off(() => const NavigationHome()),
                );

                const loader = EVerticalProductShimmer(itemCount: 6);
                final widget = TCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  loader: loader,
                  nothingFound: emptyWidget,
                );

                if (widget != null) return widget;

                final products = snapshot.data!;
                return EGridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) =>
                      EProductCardVertical(productModel: products[index]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
