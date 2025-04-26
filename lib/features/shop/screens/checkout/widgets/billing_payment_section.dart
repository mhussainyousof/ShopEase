import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/features/shop/controllers/product/checkout_controller.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class EBillingsPaymentSection extends StatelessWidget {
  const EBillingsPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());

    final theme = Theme.of(context).textTheme;
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        RowTextButton(
            onPressed: () => controller.selectPaymentMethod(context),
            title: 'Payment Method',
            buttonTitle: 'Change',
            showActionButton: true),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        Obx(() => Row(
              children: [
                ERoundedContainer(
                  width: 60,
                  height: 35,
                  backgroundColor: dark ? TColors.light : TColors.white,
                  padding: EdgeInsets.all(TSizes.sm),
                  child: Image(
                      image: AssetImage(
                          controller.selectedPaymentMethod.value.image),
                      fit: BoxFit.contain),
                ),
                SizedBox(
                  width: TSizes.spaceBtwItems / 2,
                ),
                Text(controller.selectedPaymentMethod.value.name,
                    style: theme.bodyLarge)
              ],
            ))
      ],
    );
  }
}
