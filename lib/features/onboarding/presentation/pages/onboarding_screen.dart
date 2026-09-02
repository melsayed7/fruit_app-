import 'package:flutter/material.dart';
import 'package:fruit_hub/features/onboarding/presentation/widgets/on_boarding_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OnBoardingBody());
  }
}
