import 'package:flutter/material.dart';

class RowTextButton extends StatelessWidget {
  const RowTextButton({
    super.key, this.textColor, this.onPressed,  required this.title,  this.buttonTitle = 'View all',  this.showActionButton = false,
  });

  final Color? textColor ;
  final VoidCallback? onPressed;
  final String title, buttonTitle;
  final bool showActionButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor), maxLines: 1,overflow:TextOverflow.ellipsis,),
        if(showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle, style: TextStyle(color: textColor),))
      ],
    );
  }
}
