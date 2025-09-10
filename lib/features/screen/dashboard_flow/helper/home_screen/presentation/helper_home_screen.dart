import 'package:flutter/material.dart';
import '../../../../../common_widgets/line_graph.dart';

class HelperHomeScreen extends StatelessWidget {
  const HelperHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: LineChartSample2()),
    );
  }
}
