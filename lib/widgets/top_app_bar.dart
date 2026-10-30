import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'app_logo.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  final bool showLogo;
  final bool showBackButton;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final bool centerTitle;

  const TopAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.showLogo = false,
    this.showBackButton = false,
    this.onBack,
    this.actions,
    this.centerTitle = false,
  });

  /// Factory untuk AppBar Home Dashboard
  factory TopAppBar.home({
    Key? key,
  }) {
    return TopAppBar(
      key: key,
      showLogo: true,
      title: 'CatatanKu',
      subtitle: 'Beranda',
      actions: null,
    );
  }

  /// Factory untuk AppBar Tambah Catatan
  factory TopAppBar.addNote({
    Key? key,
    required VoidCallback onBack,
  }) {
    return TopAppBar(
      key: key,
      title: 'Tambah Catatan',
      showBackButton: true,
      onBack: onBack,
      centerTitle: true,
      actions: null,
    );
  }

  /// Factory untuk AppBar Detail Catatan
  factory TopAppBar.detail({
    Key? key,
    required VoidCallback onBack,
    required List<Widget> actions,
  }) {
    return TopAppBar(
      key: key,
      title: 'Detail Catatan',
      showBackButton: true,
      onBack: onBack,
      centerTitle: false,
      actions: actions,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget? leadingWidget;
    if (showBackButton) {
      leadingWidget = IconButton(
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: AppColors.textPrimary,
        ),
        tooltip: 'Kembali',
        onPressed: onBack ?? () => Navigator.pop(context),
      );
    }

    Widget titleWidget;
    if (showLogo) {
      titleWidget = Row(
        children: [
          AppLogo.small(),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title ?? 'CatatanKu',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                  letterSpacing: -0.3,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textMuted,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ],
      );
    } else {
      titleWidget = Text(
        title ?? '',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      );
    }

    return AppBar(
      backgroundColor: AppColors.lightBg,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: showBackButton ? 0 : 20,
      leading: leadingWidget,
      title: titleWidget,
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

