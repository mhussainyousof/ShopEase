import 'package:flutter/material.dart';

class EProductTitleText extends StatelessWidget {
  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  const EProductTitleText({
    super.key,
    required this.title,
     this.smallSize = false,
     this.maxLines = 2,
    this.textAlign = TextAlign.left,
  }); 
  @override
  Widget build(BuildContext context) {
   return Text(
    title,
    style: smallSize? Theme.of(context).textTheme.labelLarge : Theme.of(context).textTheme.titleSmall,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines,
    textAlign: textAlign,
   );
  }

}
