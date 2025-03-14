import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/custome_shapes/containers/circular_container.dart';
import 'package:shop_ease/common/widgets/custome_shapes/curved_edges/curved_edges.dart';
import 'package:shop_ease/common/widgets/custome_shapes/curved_edges/main_curve.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurvedEdgeWidget(
              child:
              Container(
                color: TColors.primary,
                padding: EdgeInsets.all(0),
                child: SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      Positioned(top: -150, right: -250,  child: CircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1),)),
                      Positioned(top: 100, right: -300,  child: CircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1))),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




