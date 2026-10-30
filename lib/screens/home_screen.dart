import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/top_app_bar.dart';
import '../widgets/category_chip.dart';
import '../widgets/note_card.dart';
import 'add_note_screen.dart';
import 'detail_note_screen.dart';

class NoteItem {
  final String id;
  final String category;
  final String date;
  final String title;
  final String description;
  final Color categoryColor;
  final IconData icon;

  const NoteItem({
    required this.id,
    required this.category,
    required this.date,
    required this.title,
    required this.description,
    required this.categoryColor,
    required this.icon,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Semua';
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Data Mock Catatan murni berbasis kategori (Kerja, Pribadi, Kuliah)
  final List<NoteItem> _notes = const [
    NoteItem(
      id: '1',
      category: 'Kerja',
      date: 'Hari ini, 09.30',
      title: 'Rencana Sprint Project Flutter',
      description:
          'Menyelesaikan 5 screen UI CatatanKu sesuai panduan PRD dan acceptance criteria...',
      categoryColor: AppColors.categoryWork,
      icon: Icons.work_outline_rounded,
    ),
    NoteItem(
      id: '2',
      category: 'Pribadi',
      date: 'Kemarin, 14.15',
      title: 'Daftar Belanja Kebutuhan Bulanan',
      description:
          'Beras organik, minyak zaitun, sayur bayam, susu almond, kopi arabika...',
      categoryColor: AppColors.categoryPersonal,
      icon: Icons.shopping_bag_outlined,
    ),
    NoteItem(
      id: '3',
      category: 'Kuliah',
      date: '18 Okt 2026',
      title: 'Ide Fitur Sinkronisasi Cloud',
      description:
          'Eksplorasi integrasi Firebase Firestore atau Supabase untuk backup catatan otomatis...',
      categoryColor: AppColors.categoryStudy,
      icon: Icons.school_outlined,
    ),
    NoteItem(
      id: '4',
      category: 'Pribadi',
      date: '15 Okt 2026',
      title: 'Catatan Buku Atomic Habits',
      description:
          'Fokus pada sistem 1% lebih baik setiap hari daripada sekadar hasil akhir...',
      categoryColor: AppColors.categoryPersonal,
      icon: Icons.menu_book_outlined,
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Filter list berdasarkan kategori yang dipilih dan teks pencarian
  List<NoteItem> get _filteredNotes {
    final query = _searchQuery.trim().toLowerCase();
    return _notes.where((note) {
      final matchesCategory = _selectedCategory == 'Semua' ||
          note.category.toLowerCase() == _selectedCategory.toLowerCase();
      final matchesQuery = query.isEmpty ||
          note.title.toLowerCase().contains(query) ||
          note.description.toLowerCase().contains(query);
      return matchesCategory && matchesQuery;
    }).toList();
  }

  // Menghitung jumlah catatan per kategori
  int _getCountByCategory(String category) {
    if (category == 'Semua') return _notes.length;
    return _notes.where((n) => n.category.toLowerCase() == category.toLowerCase()).length;
  }

  void _navigateToDetail(NoteItem note) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailNoteScreen(
          title: note.title,
          category: note.category,
          date: note.date,
          content: note.description,
        ),
      ),
    );
  }

  void _navigateToAddNote() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddNoteScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = _filteredNotes;

    return Scaffold(
      backgroundColor: AppColors.lightBg,
      // 1. Top Navigation Bar Kustom (TopAppBar Reusable dengan SVG Logo)
      appBar: TopAppBar.home(),

      body: SafeArea(
        child: Column(
          children: [
            // Bagian Header Statis (Greeting + Full-Width Search + Filter Chips)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),

                  // 2. Greeting Header Section
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Halo, Devika',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                          letterSpacing: -0.4,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Kamu punya 4 catatan aktif hari ini',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),

                  // 3. Search Bar (Full Width, tanpa tombol filter di samping)
                  Container(
                    height: 46,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.borderLine),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (val) {
                        setState(() {
                          _searchQuery = val;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Cari catatan...',
                        hintStyle: const TextStyle(
                          color: AppColors.textSubtle,
                          fontSize: 14,
                        ),
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: AppColors.textSubtle,
                          size: 20,
                        ),
                        suffixIcon: _searchQuery.isNotEmpty
                            ? IconButton(
                                icon: const Icon(
                                  Icons.close_rounded,
                                  size: 18,
                                  color: AppColors.textMuted,
                                ),
                                onPressed: () {
                                  _searchController.clear();
                                  setState(() {
                                    _searchQuery = '';
                                  });
                                },
                              )
                            : null,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 4. Category Filter Chips (Kategori Murni: Semua, Kerja, Pribadi, Kuliah)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CategoryChip(
                          label: 'Semua',
                          count: _getCountByCategory('Semua'),
                          isSelected: _selectedCategory == 'Semua',
                          onTap: () => setState(() => _selectedCategory = 'Semua'),
                        ),
                        const SizedBox(width: 8),
                        CategoryChip(
                          label: 'Kerja',
                          count: _getCountByCategory('Kerja'),
                          isSelected: _selectedCategory == 'Kerja',
                          dotColor: AppColors.categoryWork,
                          onTap: () => setState(() => _selectedCategory = 'Kerja'),
                        ),
                        const SizedBox(width: 8),
                        CategoryChip(
                          label: 'Pribadi',
                          count: _getCountByCategory('Pribadi'),
                          isSelected: _selectedCategory == 'Pribadi',
                          dotColor: AppColors.categoryPersonal,
                          onTap: () => setState(() => _selectedCategory = 'Pribadi'),
                        ),
                        const SizedBox(width: 8),
                        CategoryChip(
                          label: 'Kuliah',
                          count: _getCountByCategory('Kuliah'),
                          isSelected: _selectedCategory == 'Kuliah',
                          dotColor: AppColors.categoryStudy,
                          onTap: () => setState(() => _selectedCategory = 'Kuliah'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),

            // 5. Note Card List (ListView Reusable)
            Expanded(
              child: filteredList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.note_alt_outlined,
                            size: 54,
                            color: AppColors.textSubtle.withValues(alpha: 0.6),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Tidak ada catatan ditemukan',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(20, 4, 20, 80),
                      itemCount: filteredList.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final note = filteredList[index];
                        return NoteCard(
                          title: note.title,
                          description: note.description,
                          category: note.category,
                          date: note.date,
                          categoryColor: note.categoryColor,
                          icon: note.icon,
                          onTap: () => _navigateToDetail(note),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),

      // 6. Floating Action Button (FAB)
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddNote,
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: Colors.white,
        elevation: 3,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }
}
