import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/features/shop/screens/home/widgets/home.dart';

class NavigationHome extends StatelessWidget {
  const NavigationHome({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.find();
    return Obx((){
      return
      Scaffold(
        bottomNavigationBar:
        NavigationBar(
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index)=> controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(
              icon:
              Icon(Iconsax.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.shop),
              label: 'Store',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.heart),
              label: 'WishList',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user),
              label: 'Profile',
            ),
          ],
        ),

        body: controller.screens[controller.selectedIndex.value],
      );
    });
  }
}

class NavigationController extends GetxController{

  final Rx<int> selectedIndex = 0.obs;
  final screens = [HomeScreen(),Container(color: Colors.yellow,),Container(color: Colors.red,),Container(color: Colors.purple,),];
}