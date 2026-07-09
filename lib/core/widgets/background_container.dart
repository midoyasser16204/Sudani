import 'package:flutter/material.dart';
import '../constants/assets.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  final BoxFit fit;

  const BackgroundContainer({
    super.key,
    required this.child,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.background),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
