import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/features/personalization/controllers/address_controller.dart';
import 'package:shop_ease/features/personalization/models/address_model.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class ESingleAddress extends StatelessWidget {

  const ESingleAddress({super.key, required this.address, required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {

    final controller = AddressController.instance;

    final dark = THelperFunctions.isDarkMode(context);
    final theme = Theme.of(context).textTheme;
    return Obx((){
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return InkWell(
        onTap:onTap ,
        child: ERoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          width: double.infinity,
          showBorder: true,
          backgroundColor: selectedAddress
              ? TColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
              ? TColors.darkerGrey
              : TColors.grey,
          margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress ? dark ? TColors.light : TColors.dark : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.titleLarge,
                  ),
                  SizedBox(height: TSizes.sm / 2),
                  Text(address.phoneNumber, maxLines: 1, overflow: TextOverflow.ellipsis),
                  SizedBox(height: TSizes.sm / 2),
                  Text(address.toString(),
                    softWrap: true,

                  ),
                  SizedBox(height: TSizes.sm / 2),
                ],

              )
            ],
          ),
        ),
      );
    });
  }
}
