import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/features/personalization/screens/address/add_new_address.dart';
import 'package:shop_ease/features/personalization/screens/address/widgets/single_address.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget{
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()=> Get.to(()=> AddNewAddressScreeen()),
      backgroundColor: TColors.primary,
      child: Icon(Iconsax.add, color: TColors.white),
      ),
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text('Addresses', style: theme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
           ESingleAddress(selectedAddress: true),
           ESingleAddress(selectedAddress: false),
          ],
        ),
      ),
    ));
  }
  
}