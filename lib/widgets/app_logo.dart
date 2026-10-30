import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final bool showCardContainer;
  final double cardRadius;
  final bool hasGlow;

  const AppLogo({
    super.key,
    this.size = 38.0,
    this.showCardContainer = false,
    this.cardRadius = 24.0,
    this.hasGlow = false,
  });

  /// Factory untuk logo mini di AppBar / TopBar
  factory AppLogo.small({Key? key, double size = 20.0}) {
    return AppLogo(
      key: key,
      size: size,
      showCardContainer: true,
      cardRadius: 10.0,
      hasGlow: false,
    );
  }

  /// Factory untuk kartu logo di Login Screen
  factory AppLogo.login({Key? key}) {
    return AppLogo(
      key: key,
      size: 40.0,
      showCardContainer: true,
      cardRadius: 24.0,
      hasGlow: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget svgIcon = SvgPicture.asset(
      'asset/logo_catatanku.svg',
      width: size,
      height: size,
      fit: BoxFit.contain,
    );

    if (!showCardContainer) {
      return svgIcon;
    }

    // Hitung ukuran container proporsional
    final double containerSize = size * 1.85;

    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(cardRadius),
        boxShadow: [
          if (hasGlow)
            BoxShadow(
              color: AppColors.primaryGreen.withValues(alpha: 0.12),
              blurRadius: cardRadius * 1.1,
              spreadRadius: 6,
              offset: const Offset(0, 8),
            )
          else
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: Center(
        child: svgIcon,
      ),
    );
  }
}

