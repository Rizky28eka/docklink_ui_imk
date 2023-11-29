import 'package:flutter/material.dart';

import 'package:slicing_docklink_ui_imk/page/onboarding_page.dart';

class OnboardingItemWidget extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(item.image),
        SizedBox(height: 16.0),
        Text(
          item.title,
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          item.description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}
