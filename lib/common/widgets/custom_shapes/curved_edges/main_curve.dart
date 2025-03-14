import 'package:flutter/cupertino.dart';

import 'curve_corner.dart';

class CurvedEdgeWidget extends StatelessWidget {
  const CurvedEdgeWidget({
    this.child,
    super.key,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: CustomCurvedEdges(),
        child: child
    );
  }
}
