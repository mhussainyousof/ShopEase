import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/products/cart/bag_count.dart';
import 'package:shop_ease/common/widgets/shimmers/shimmer.dart';
import 'package:shop_ease/features/personalization/controllers/user_controller.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return MyAppBar(
      title: Column(
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: Colors.white.withAlpha(200)),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return EShimmerEffect(width: 70, height: 12);
            }
            else
            { return Text(
              controller.userModel.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: Colors.white),
            );}

          })
        ],
      ),
      actions: [
        //! Shopping bag icon with item count
        BagCountWidget(
          iconColor: TColors.white,
        
        ),
      ],
    );
  }
}


