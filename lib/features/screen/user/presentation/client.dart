import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/theme_extension/app_colors.dart';
import '../provider/color_provider.dart';

class Client extends StatelessWidget {
  const Client({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('Client Screen')),
      body: Consumer(
        builder: (_,ref,_) {
          final isShow = ref.watch(colorProvider.notifier).state;
          return Column(
            children: [
              ElevatedButton(onPressed: (){
                ref.read(colorProvider.notifier).state = 1;
              }, child: Text('Color Button',style:style.bodyLarge?.copyWith(
                color:isShow == 1 ? AppColors.headlineTextColor : AppColors.greyTextColor,
              )))
            ],
          );
        }
      ),
    );
  }
}
