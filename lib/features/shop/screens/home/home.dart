import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/demo_curved_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DemoCurveWidget(
              child: Column(
                children: [
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}





