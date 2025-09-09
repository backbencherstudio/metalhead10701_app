import 'package:flutter/material.dart';
import 'package:metal_head/features/screen/dashboard_flow/home_screen/presentation/widget/line_graph.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: LineChartSample2()),
    );
  }
}
