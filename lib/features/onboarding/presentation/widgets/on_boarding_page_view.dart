import 'package:flutter/material.dart';
import '../../data/models/onboarding_item.dart';
import 'on_boarding_page_item.dart';

class OnBoardingPageView extends StatelessWidget {
  final PageController pageController;
  final List<OnboardingItem> items;
  final ValueChanged<int> onPageChanged;

  const OnBoardingPageView({
    super.key,
    required this.pageController,
    required this.items,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: onPageChanged,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return OnBoardingPageItem(item: items[index]);
      },
    );
  }
}
