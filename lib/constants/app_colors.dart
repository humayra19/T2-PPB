import 'package:flutter/material.dart';

/// Palet warna tema CatatanKu sesuai dengan style_design_guidelines.md
class AppColors {
  AppColors._();

  // Primary Colors (Nature Green Theme)
  static const Color primaryGreen = Color(0xFF1E6B37); // Hijau Utama #1E6B37
  static const Color softGreenBg = Color(0xFFE8F5E9);  // Soft Mint Background
  static const Color accentGreen = Color(0xFF4CAF50);  // Light Accent Green

  // Neutral Colors
  static const Color lightBg = Color(0xFFF9FBF9);      // Off-white / Background Surface
  static const Color textPrimary = Color(0xFF1E293B);  // Slate Dark Text
  static const Color textMuted = Color(0xFF64748B);    // Secondary / Hint Text
  static const Color textSubtle = Color(0xFF94A3B8);   // Muted Counter / Placeholder
  static const Color borderLine = Color(0xFFE2E8F0);   // Divider & Outline Border
  static const Color fieldBg = Color(0xFFF1F5F9);      // Input Field Light Background

  // Danger / Action Color (Hapus Catatan)
  static const Color priorityHigh = Color(0xFFE53935); // Merah Aksi Hapus

  // Category Colors
  static const Color categoryWork = Color(0xFF1E88E5);      // Biru Kerja
  static const Color categoryPersonal = Color(0xFF43A047);  // Hijau Pribadi
  static const Color categoryStudy = Color(0xFF8E24AA);     // Ungu Kuliah
}

