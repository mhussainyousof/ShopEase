import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/features/shop/screens/store/store.dart';
import 'package:shop_ease/features/shop/screens/wishlist/wishlist.dart';
import 'features/shop/screens/home/home.dart';

class NavigationHome extends StatelessWidget {
  const NavigationHome({super.key});

  @override
  Widget build(BuildContext context) {

    //! Get the navigation controller instance from GetX dependency injection
    final NavigationController controller = Get.find();

    //! Obx listens for changes in the selectedIndex and rebuilds the UI accordingly
    return Obx(() {
      return Scaffold(
        bottomNavigationBar: NavigationBar(
          // Set the selected index from the controller's observable value
          selectedIndex: controller.selectedIndex.value,

          // When a destination is selected, update the selected index in the controller
          onDestinationSelected: (index) => controller.selectedIndex.value = index,

          // Define the destinations (tabs) for the navigation bar
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home',),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store',),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'WishList',),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile',),
          ],
        ),

        body: controller.screens[controller.selectedIndex.value],
      );
    });
  }
}

//! NavigationController manages the selected index and the list of screens
class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    StoreScreen(),
    FavoriteScreen(),
    Container(color: Colors.purple),
  ];
}
