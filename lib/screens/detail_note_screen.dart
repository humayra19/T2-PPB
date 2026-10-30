import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/top_app_bar.dart';

class DetailNoteScreen extends StatefulWidget {
  final String title;
  final String category;
  final String date;
  final String content;

  const DetailNoteScreen({
    super.key,
    this.title = 'Rencana Sprint Project Flutter',
    this.category = 'Kerja',
    this.date = '19 Oktober 2026 • 09.30 WIB',
    this.content =
        'Berikut adalah daftar tugas utama untuk penyelesaian frontend 5 halaman aplikasi CatatanKu menggunakan Flutter sesuai dengan spesifikasi PRD terlampir:',
  });

  @override
  State<DetailNoteScreen> createState() => _DetailNoteScreenState();
}

class _ChecklistItem {
  final String text;
  bool isCompleted;

  _ChecklistItem({
    required this.text,
    this.isCompleted = true,
  });
}

class _DetailNoteScreenState extends State<DetailNoteScreen> {
  // Daftar Checklist Tugas sesuai PRD 5 Layar CatatanKu
  late List<_ChecklistItem> _checklist;

  @override
  void initState() {
    super.initState();
    _checklist = [
      _ChecklistItem(
        text: 'Membuat Splash Screen dengan logo dan loading bar interaktif',
        isCompleted: true,
      ),
      _ChecklistItem(
        text: 'Implementasi Static Login dengan Google auth option',
        isCompleted: true,
      ),
      _ChecklistItem(
        text: 'Desain Beranda dengan filter chip dan note cards dinamis',
        isCompleted: true,
      ),
      _ChecklistItem(
        text: 'Form Tambah Catatan lengkap dengan kategori pilihan',
        isCompleted: true,
      ),
      _ChecklistItem(
        text: 'Halaman Detail Catatan yang bersih, ramah baca, dan ergonomis',
        isCompleted: true,
      ),
    ];
  }

  Color get _categoryBgColor {
    switch (widget.category.toLowerCase()) {
      case 'kuliah':
        return const Color(0xFFF3E5F5);
      case 'kerja':
        return const Color(0xFFE3F2FD);
      case 'pribadi':
      default:
        return AppColors.softGreenBg;
    }
  }

  Color get _categoryTextColor {
    switch (widget.category.toLowerCase()) {
      case 'kuliah':
        return AppColors.categoryStudy;
      case 'kerja':
        return AppColors.categoryWork;
      case 'pribadi':
      default:
        return AppColors.primaryGreen;
    }
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Hapus Catatan?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColors.textPrimary,
          ),
        ),
        content: const Text(
          'Apakah Anda yakin ingin menghapus catatan ini? Tindakan ini tidak dapat dibatalkan.',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textMuted,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text(
              'Batal',
              style: TextStyle(
                color: AppColors.textMuted,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogContext); // Tutup dialog
              if (mounted) {
                Navigator.pop(context); // Kembali ke Beranda dengan aman
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Catatan berhasil dihapus.'),
                    duration: Duration(seconds: 1),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.priorityHigh,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      // 1. App Bar Header Kustom (TopAppBar Reusable)
      appBar: TopAppBar.detail(
        onBack: () => Navigator.pop(context),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit_outlined,
              size: 20,
              color: AppColors.textPrimary,
            ),
            tooltip: 'Edit Catatan',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Mode edit catatan segera hadir.'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.delete_outline_rounded,
              size: 20,
              color: AppColors.priorityHigh,
            ),
            tooltip: 'Hapus Catatan',
            onPressed: _showDeleteDialog,
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 2. Note Meta & Heading Section (Tanpa atribut prioritas)
              Row(
                children: [
                  // Badge Kategori Dinamis
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: _categoryBgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      widget.category,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: _categoryTextColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Relative Time
                  const Text(
                    '10 min lalu',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textSubtle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Judul Catatan
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 6),

              // Timestamp Date
              Row(
                children: [
                  const Icon(
                    Icons.access_time_rounded,
                    size: 14,
                    color: AppColors.textSubtle,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    widget.date,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // 3. Main Content Card Container
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.borderLine),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Paragraf Pembuka
                    Text(
                      widget.content,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF334155),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Interactive Checklist / Done List
                    ...List.generate(_checklist.length, (index) {
                      final item = _checklist[index];
                      final isLast = index == _checklist.length - 1;
                      return Padding(
                        padding: EdgeInsets.only(bottom: isLast ? 0.0 : 12.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              item.isCompleted = !item.isCompleted;
                            });
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  margin: const EdgeInsets.only(top: 2, right: 10),
                                  decoration: BoxDecoration(
                                    color: item.isCompleted
                                        ? AppColors.primaryGreen
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: item.isCompleted
                                          ? AppColors.primaryGreen
                                          : const Color(0xFFCBD5E1),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: item.isCompleted
                                      ? const Icon(
                                          Icons.check,
                                          size: 14,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                                Expanded(
                                  child: Text(
                                    item.text,
                                    style: TextStyle(
                                      fontSize: 13,
                                      height: 1.4,
                                      decoration: item.isCompleted
                                          ? TextDecoration.lineThrough
                                          : null,
                                      color: item.isCompleted
                                          ? AppColors.textSubtle
                                          : AppColors.textPrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
