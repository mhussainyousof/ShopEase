import 'package:flutter/material.dart';
import 'package:shop_ease/utils/constants/colors.dart';

class ESettingsMenuTile extends StatelessWidget {
  const ESettingsMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.onTap,
       this.trailing});
  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28,  color: TColors.primary,),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium,),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium,),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
