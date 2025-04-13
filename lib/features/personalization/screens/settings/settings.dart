import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/demo_curved_widget.dart';
import 'package:shop_ease/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:shop_ease/common/widgets/list_tile/user_profile.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/data/repositories/authentication/authentication_repository.dart';
import 'package:shop_ease/features/personalization/screens/profile/profile.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoCurveWidget(
                child: Column(
              children: [
                MyAppBar(
                  title: Text('Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white)),
                ),
                EUserProfileTile(
                    onPressed: () => Get.to(() => ProfileScreen())),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                )
              ],
            )),
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  RowTextButton(title: 'Account Settings'),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  ESettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My addresses',
                      subtitle: 'Set shopping delivery address'),
                  ESettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subtitle: 'add, remove products and move to checkout'),
                  ESettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subtitle: 'In-progress and Completed orders'),
                  ESettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subtitle: 'Withdraw balance to registered bank account'),
                  ESettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subtitle: 'List of all the discounted coupons'),
                  ESettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subtitle: 'Set any kind of notification message'),
                  ESettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subtitle: 'Manage data usage and connected accounts'),
                  SizedBox(height: TSizes.spaceBtwSections),
                  RowTextButton(title: 'App Settings', showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),
                  ESettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subtitle: 'Upload Data to your Cloud Firebase'),
                  ESettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  ESettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  ESettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  ESettingsMenuTile(
                    icon: Iconsax.logout,
                    title: 'Logout',
                    subtitle: 'Sign out from this account',
                      
                    onTap: () async {
                      await AuthenticationRepository.instance
                          .logout(); 
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
