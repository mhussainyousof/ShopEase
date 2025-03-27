import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EProfileMenu extends StatelessWidget {
  const EProfileMenu({
    super.key,
     this.icon = Iconsax.arrow_right_34,
    required this.onPressed,
    required this.title,
    required this.value,
  });
  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0  ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis),
            Text(value,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis),
            Icon(
             icon,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
