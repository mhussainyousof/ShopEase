import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class EAnimationLoaderWidget extends StatelessWidget {
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const EAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
       this.showAction = false,
      this.actionText,
      this.onActionPressed});

  @override
  Widget build(BuildContext context) {
   return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8),
        SizedBox(height: TSizes.defaultSpace),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,

        ),
        SizedBox(height: TSizes.defaultSpace),
        showAction ? SizedBox(
          width: 250,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(backgroundColor: TColors.dark),
            onPressed: onActionPressed, child: Text(actionText!,
            style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.light),
            )),
        ) : SizedBox()
      ],
    ),
   );
  }
}
