import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/images/circular_image.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';

class EUserProfileTile extends StatelessWidget {
  const EUserProfileTile({
    required this.onPressed,
    super.key,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  ECircularImage(
        width: 50,
        height: 50,
        padding: 0,
        image: TImages.user
      ),
       title: Text('Hussain Yousof',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white)),
       subtitle: Text('mhussainyousof@gmail.com',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white)),
              trailing: IconButton(onPressed:onPressed, icon: Icon(Iconsax.edit, color: TColors.white,)),
    );
  }
}
