
import 'package:flutter/cupertino.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/white_circle.dart';
import 'package:shop_ease/utils/constants/colors.dart';

import '../curved_edges/main_curve.dart';

class DemoCurveWidget extends StatelessWidget {
  const DemoCurveWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: CircularContainer(backgroundColor: TColors.textWhite.withAlpha(26)),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: CircularContainer(backgroundColor: TColors.textWhite.withAlpha(26)),
              ),

              Positioned.fill(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
