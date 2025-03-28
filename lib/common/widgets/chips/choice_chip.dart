import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/white_circle.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class EChoiceChip extends StatelessWidget {
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  const EChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});
  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? SizedBox() : Text(text),
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? TColors.white : null),
      selected: selected,
      avatar:isColor ?  CircularContainer(width: 50, height: 50, backgroundColor: THelperFunctions.getColor(text)!) : null,
      shape:  isColor ?  CircleBorder() : null,
      backgroundColor: isColor ? THelperFunctions.getColor(text)! : null,
      labelPadding: isColor ? EdgeInsets.all(0) : null,
      padding: isColor ? EdgeInsets.all(0) : null,
    );
  }
}
