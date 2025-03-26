import 'package:flutter/material.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/device/device_utility.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class ETabbar extends StatelessWidget  implements PreferredSizeWidget{
  const ETabbar({
    required this.tabs,
    super.key,
  });

  final List<Widget>tabs;


  @override
  Widget build(BuildContext context) {
      final dark = THelperFunctions.isDarkMode(context);

    return Material(
      color:  dark ? TColors.black : TColors.white,
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
        labelColor: dark ? TColors.white : TColors.primary,
        
        tabs: tabs 
        ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
