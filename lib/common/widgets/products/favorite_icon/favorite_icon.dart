import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/icons/circular_icon.dart';
import 'package:shop_ease/features/shop/controllers/product/favorite_controller.dart';
import 'package:shop_ease/utils/constants/colors.dart';

class EFavoriteIcon extends StatelessWidget {
  const EFavoriteIcon({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
      () => ECircularIcon(
        icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ? TColors.error : null,
        onPressed: () => controller.toggleFavoriteProduct(productId),
      ),
    );
  }
}
