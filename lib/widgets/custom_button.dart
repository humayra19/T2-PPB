import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isSecondary;
  final bool fullWidth;
  final double height;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isSecondary = false,
    this.fullWidth = true,
    this.height = 48.0,
    this.backgroundColor,
    this.textColor,
  });

  /// Factory untuk Tombol Utama (Hijau CatatanKu)
  factory CustomButton.primary({
    Key? key,
    required String text,
    required VoidCallback onPressed,
    IconData? icon,
    bool fullWidth = true,
    double height = 48.0,
  }) {
    return CustomButton(
      key: key,
      text: text,
      onPressed: onPressed,
      icon: icon,
      fullWidth: fullWidth,
      height: height,
      backgroundColor: AppColors.primaryGreen,
      textColor: Colors.white,
    );
  }

  /// Factory untuk Tombol Sekunder / Batal
  factory CustomButton.secondary({
    Key? key,
    required String text,
    required VoidCallback onPressed,
    IconData? icon,
    bool fullWidth = true,
    double height = 48.0,
  }) {
    return CustomButton(
      key: key,
      text: text,
      onPressed: onPressed,
      icon: icon,
      isSecondary: true,
      fullWidth: fullWidth,
      height: height,
      backgroundColor: AppColors.fieldBg,
      textColor: AppColors.textMuted,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget content = Row(
      mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 18),
          const SizedBox(width: 8),
        ],
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isSecondary ? FontWeight.w600 : FontWeight.bold,
          ),
        ),
      ],
    );

    final Widget button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primaryGreen,
        foregroundColor: textColor ?? Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: content,
    );

    if (fullWidth) {
      return SizedBox(
        width: double.infinity,
        height: height,
        child: button,
      );
    }

    return SizedBox(
      height: height,
      child: button,
    );
  }
}

