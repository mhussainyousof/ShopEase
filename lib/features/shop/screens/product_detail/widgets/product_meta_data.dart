import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/common/widgets/images/circular_image.dart';
import 'package:shop_ease/common/widgets/texts/brand_title_verified_icon.dart';
import 'package:shop_ease/common/widgets/texts/product_price_text.dart';
import 'package:shop_ease/common/widgets/texts/product_title._text.dart';
import 'package:shop_ease/features/shop/controllers/product/product_controller.dart';
import 'package:shop_ease/features/shop/models/product_model.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({
    required this.productModel,
    super.key});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
        final controller = ProductController.instance;
        final salePercentage = controller.calculateSalePercentage(productModel.price, productModel.salePrice);

    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ERoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(
                  horizontal: TSizes.sm - 2, vertical: TSizes.xs - 2),
              child: Text('$salePercentage%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black, fontSizeFactor: 0.9)),
            ),
            SizedBox(width: TSizes.spaceBtwItems),
            if(productModel.productType == ProductType.single.toString() && productModel.price > 0)
            Text(
              '\$${productModel.price}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
           if(productModel.productType == ProductType.single.toString() && productModel.price > 0) SizedBox(width: TSizes.spaceBtwItems),
            EProductPriceText(price: controller.getProductPrice(productModel), isLarge: true),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),
        EProductTitleText(
          alignment: Alignment.centerLeft,
          title: productModel.title),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            EProductTitleText(title: 'Status'),
            SizedBox(width: TSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(productModel.stock), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            ECircularImage(
              isNetworkImages: true,
              image: productModel.brand != null ?productModel.brand!.image : '',
          width: 32,
          height: 32,
          overlayColor: dark ? TColors.white : TColors.black,
            ),
            EBrandTitleWithVerifiedIcon(title: productModel.brand != null ?  productModel.brand!.name : '', maxLines: 1),
          ],
        )
      ],
    );
  }
}
