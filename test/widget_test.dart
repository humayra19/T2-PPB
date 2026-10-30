import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aplikasi_pencatatan/main.dart';
import 'package:aplikasi_pencatatan/screens/login_screen.dart';
import 'package:aplikasi_pencatatan/screens/home_screen.dart';
import 'package:aplikasi_pencatatan/screens/add_note_screen.dart';
import 'package:aplikasi_pencatatan/screens/detail_note_screen.dart';
import 'package:aplikasi_pencatatan/widgets/app_logo.dart';

void main() {
  testWidgets('App smoke test - SplashScreen renders with AppLogo', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('CatatanKu'), findsWidgets);
    expect(find.text('Ruang Catatan Asri & Tenang'), findsOneWidget);
    expect(find.text('Versi 1.0.0'), findsOneWidget);
    expect(find.text('0%'), findsOneWidget);
    expect(find.byType(AppLogo), findsOneWidget);
  });

  testWidgets('SplashScreen animates progress and navigates to LoginScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0%'), findsOneWidget);

    // Pump 1.5 detik (pertengahan progress)
    await tester.pump(const Duration(milliseconds: 1500));
    expect(find.text('0%'), findsNothing);

    // Selesaikan animasi (3 detik) dan transisi navigasi
    await tester.pump(const Duration(milliseconds: 1600));
    await tester.pumpAndSettle();

    // Memverifikasi bahwa navigasi ke LoginScreen berhasil
    expect(find.text('Selamat Datang Kembali'), findsOneWidget);
  });

  testWidgets('LoginScreen smoke test - Elements render with AppLogo', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    expect(find.byType(AppLogo), findsOneWidget);
    expect(find.text('CatatanKu'), findsOneWidget);
    expect(find.text('Teman Tumbuh & Menulis'), findsOneWidget);
    expect(find.text('Selamat Datang Kembali'), findsOneWidget);
    expect(find.text('Masuk'), findsOneWidget);
  });

  testWidgets('HomeScreen smoke test - US-03 Elements render & filter works',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreen(),
      ),
    );

    // Header greeting & branding
    expect(find.text('CatatanKu'), findsOneWidget);
    expect(find.text('Beranda'), findsWidgets);
    expect(find.textContaining('Halo'), findsOneWidget);
    expect(find.byType(AppLogo), findsOneWidget);

    // Filter chips
    expect(find.text('Semua'), findsOneWidget);
    expect(find.text('Kuliah'), findsWidgets);
    expect(find.text('Pribadi'), findsWidgets);
    expect(find.text('Kerja'), findsWidgets);

    // Filter interaktif: tap "Kuliah"
    await tester.tap(find.text('Kuliah').first);
    await tester.pumpAndSettle();

    expect(find.text('Ide Fitur Sinkronisasi Cloud'), findsOneWidget);
    expect(find.text('Rencana Sprint Project Flutter'), findsNothing);

    // FAB
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('AddNoteScreen smoke test - US-04 Elements render', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AddNoteScreen(),
      ),
    );

    // Header & Subheader
    expect(find.text('Tambah Catatan'), findsOneWidget);
    expect(find.text('Draft Otomatis Tersimpan'), findsOneWidget);
    expect(find.text('Ruang Menulis'), findsOneWidget);

    // Form inputs & labels
    expect(find.text('Judul Catatan'), findsOneWidget);
    expect(find.text('0/60'), findsOneWidget);
    expect(find.text('Kategori'), findsOneWidget);
    expect(find.text('Warna Label'), findsOneWidget);
    expect(find.text('Isi Catatan'), findsOneWidget);
    expect(find.text('0 kata'), findsOneWidget);

    // Action buttons
    expect(find.text('Simpan'), findsOneWidget);
    expect(find.text('Batal'), findsOneWidget);
  });

  testWidgets('DetailNoteScreen smoke test - US-05 Elements render & checklist interactive',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DetailNoteScreen(),
      ),
    );

    // App Bar & Action Bar
    expect(find.text('Detail Catatan'), findsOneWidget);
    expect(find.byIcon(Icons.edit_outlined), findsOneWidget);
    expect(find.byIcon(Icons.delete_outline_rounded), findsOneWidget);

    // Note Meta & Title
    expect(find.text('Kerja'), findsOneWidget);
    expect(find.text('10 min lalu'), findsOneWidget);
    expect(find.text('Rencana Sprint Project Flutter'), findsOneWidget);

    // Interaksi checklist: toggle 1 item
    final firstItem = find.text('Membuat Splash Screen dengan logo dan loading bar interaktif');
    expect(firstItem, findsOneWidget);
    await tester.tap(firstItem);
    await tester.pumpAndSettle();
    expect(firstItem, findsOneWidget);
  });
}
