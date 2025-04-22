import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:shop_ease/common/widgets/chips/choice_chip.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/common/widgets/texts/product_price_text.dart';
import 'package:shop_ease/common/widgets/texts/product_title._text.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/features/shop/controllers/product/variation_controller.dart';
import 'package:shop_ease/features/shop/models/product_model.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class EProductsAttribute extends StatelessWidget {
  const EProductsAttribute({required this.productModel, super.key});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    final theme = Theme.of(context);
    return Obx(() {
      return Column(
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
            ERoundedContainer(
              padding: EdgeInsets.all(TSizes.md),
              backgroundColor:
                  dark ? TColors.darkerGrey : TColors.darkGrey.withOpacity(0.6),
              child: Column(
                children: [
                  Row(
                    children: [
                      RowTextButton(
                          title: "Variation", showActionButton: false),
                      SizedBox(width: TSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              EProductTitleText(
                                  title: 'Price: ', smallSize: true),
                              SizedBox(width: TSizes.spaceBtwItems),
                              if (controller.selectedVariation.value.salePrice > 0 )
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: theme.textTheme.titleSmall!.apply(
                                      decoration: TextDecoration.lineThrough),
                                ),
                              SizedBox(width: TSizes.spaceBtwItems),
                              EProductPriceText(
                                  price: controller.getVariationPrice()),
                            ],
                          ),
                          Row(
                            children: [
                              EProductTitleText(
                                  title: 'Stock : ', smallSize: true),
                              Text(controller.variationStockStatus.value,
                                  style: theme.textTheme.titleMedium),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  EProductTitleText(
                    title: controller.selectedVariation.value.description,
                    smallSize: true,
                    maxLines: 4,
                  )
                ],
              ),
            ),  
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: productModel.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RowTextButton(
                          title: attribute.name ?? '',
                          showActionButton: false,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        Obx(() {
                          return Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected = controller
                                      .selectedAttributes[attribute.name] ==
                                  attributeValue;
                              final available = controller
                                  .getAttributesAvailabilityInVariation(
                                      productModel.productVariations!,
                                      attribute.name!)
                                  .contains(attributeValue);

                              return EChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(
                                              productModel,
                                              attribute.name ?? '',
                                              attributeValue);
                                        }
                                      }
                                    : null,
                              ); 
                            }).toList(), 
                          );
                        })
                      ],
                    ))
                .toList(),
          )
        ],
      );
    });
  }
}
