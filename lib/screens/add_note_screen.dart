import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/top_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  String _selectedCategory = 'Kerja';
  int _selectedColorIndex = 0;

  final List<String> _categories = const [
    'Kerja',
    'Pribadi',
    'Kuliah',
  ];

  final List<Color> _labelColors = const [
    AppColors.primaryGreen, // Hijau Tua CatatanKu
    AppColors.accentGreen,  // Mint Green
    Color(0xFFFFB74D),      // Kuning
    Color(0xFF42A5F5),      // Biru Muda
    Color(0xFFF06292),      // Pink / Merah Muda
  ];

  @override
  void initState() {
    super.initState();
    _titleController.addListener(() {
      if (mounted) setState(() {});
    });
    _contentController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  int _getWordCount() {
    final text = _contentController.text.trim();
    if (text.isEmpty) return 0;
    return text.split(RegExp(r'\s+')).length;
  }

  void _saveNote() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Catatan berhasil disimpan.'),
        duration: Duration(seconds: 1),
      ),
    );
    Navigator.pop(context);
  }

  void _cancelNote() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBg,
      // 1. App Bar Header Kustom (TopAppBar Reusable)
      appBar: TopAppBar.addNote(
        onBack: _cancelNote,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 2. Draft Status Sub-header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.cloud_done_outlined,
                            size: 14,
                            color: AppColors.primaryGreen,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Draft Otomatis Tersimpan',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Hari ini, 14:32',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.textSubtle,
                        ),
                      ),
                    ],
                  ),
                  // Badge Pill "Ruang Menulis"
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.softGreenBg,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.eco_outlined,
                          size: 14,
                          color: AppColors.primaryGreen,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Ruang Menulis',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 3. Form Card Container
              Container(
                padding: const EdgeInsets.all(20.0),
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
                    // A. Judul Catatan + Character Counter (CustomTextField Reusable)
                    CustomTextField(
                      controller: _titleController,
                      label: 'Judul Catatan',
                      counterText: '${_titleController.text.length}/60',
                      hintText: 'Masukkan judul catatan di sini...',
                      maxLength: 60,
                    ),
                    const SizedBox(height: 18),

                    // B. Kategori (Dropdown Menu)
                    const Text(
                      'Kategori',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      initialValue: _selectedCategory,
                      items: _categories.map((category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(
                            category,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) {
                          setState(() {
                            _selectedCategory = val;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.fieldBg,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.textMuted,
                      ),
                      dropdownColor: Colors.white,
                    ),
                    const SizedBox(height: 18),

                    // C. Warna Label (Color Selector)
                    const Text(
                      'Warna Label',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: List.generate(_labelColors.length, (index) {
                        final color = _labelColors[index];
                        final isSelected = _selectedColorIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedColorIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 12),
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? Colors.black.withValues(alpha: 0.15)
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: isSelected
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                : null,
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 18),

                    // D. Isi Catatan (Textarea Reusable) + Word Counter
                    CustomTextField(
                      controller: _contentController,
                      label: 'Isi Catatan',
                      counterText: '${_getWordCount()} kata',
                      hintText: 'Tuliskan detail catatan, ide, atau rencana di sini...',
                      maxLines: 6,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 4. Action Buttons (CustomButton Reusable: Simpan & Batal)
              CustomButton.primary(
                text: 'Simpan',
                icon: Icons.check_circle_outline_rounded,
                onPressed: _saveNote,
              ),
              const SizedBox(height: 12),
              CustomButton.secondary(
                text: 'Batal',
                onPressed: _cancelNote,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
