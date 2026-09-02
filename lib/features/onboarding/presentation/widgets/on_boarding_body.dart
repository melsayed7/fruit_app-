import 'package:flutter/material.dart';
import 'package:fruit_hub/core/router/app_router.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import '../../data/models/onboarding_item.dart';
import 'on_boarding_button.dart';
import 'on_boarding_indicator.dart';
import 'on_boarding_page_view.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late final PageController _pageController;
  int _currentPage = 0;

  final List<OnboardingItem> _items = const [
    OnboardingItem(
      backgroundImage: Assets.assetsImageBackground1,
      image: Assets.assetsImageFruitBasket,
      title: 'Welcome to FruitHUB',
      description: 'Discover the best, freshest fruits around you.',
    ),
    OnboardingItem(
      backgroundImage: Assets.assetsImageBackground2,
      image: Assets.assetsImagePineapple,
      title: 'Fresh and Healthy',
      description: 'Get fresh fruits delivered directly to your door.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _onButtonPressed() {
    if (_currentPage < _items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacementNamed(AppRouter.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: OnBoardingPageView(
              pageController: _pageController,
              items: _items,
              onPageChanged: _onPageChanged,
            ),
          ),
          OnBoardingIndicator(
            pageCount: _items.length,
            currentIndex: _currentPage,
          ),
          const SizedBox(height: 24),
          OnBoardingButton(onPressed: _onButtonPressed),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
