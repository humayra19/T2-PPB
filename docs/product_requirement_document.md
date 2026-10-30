# Product Requirement Document (PRD): CatatanKu

## 1. Overview
**CatatanKu** is a simple, intuitive daily note-taking mobile application built with Flutter. The objective of this project is to implement a clean, static 5-screen frontend UI that helps users easily store ideas, plans, and daily moments without complex navigation or overly flashy animations.

---

## 2. Project Goals & Objectives
* **Primary Goal:** Design and build a static mobile UI (Flutter/Dart) based on the 5 core screens in the assignment poster.
* **Core Value:** Clean, simple, and functional UI using a natural green theme that is accessible and easy for anyone to use.
* **Scope:** UI-only implementation (static mock data, no backend authentication or live API calls required).

---

## 3. Scope & Features (UI Only)

### Screen 1: Splash Screen
* Displays the app logo, app name ("CatatanKu"), taglines/onboarding text, and a minimal loading bar indicator.
* Smooth auto-transition or simple navigation to the Login screen.

### Screen 2: Static Login Screen (`Login Statis`)
* App title and slogan.
* Input fields: Email and Password (static UI elements).
* Social login options: "Masuk dengan Google" button.
* Navigation button to the Main Dashboard (`Beranda`).

### Screen 3: Home Dashboard (`Beranda`)
* Top greeting bar (e.g., "Halo, Ahmadi 👋") with profile avatar icon and search bar + filter icon.
* Category filter chips: `Semua`, `Penting`, `Pribadi`, `Kerja`.
* List of Note Cards displaying icon/category, title, preview text, and timestamp.
* Floating Action Button (FAB) `+` to navigate to "Tambah Catatan".
* Bottom Navigation Bar with 3 tabs: `Beranda`, `Arsip`, `Profil`.

### Screen 4: Add Note Form (`Tambah Catatan`)
* Header with back button and screen title.
* Input fields: Judul Catatan, Isi Catatan (multiline text area).
* Dropdown selector for `Kategori`.
* Color tag selector (preset color indicators).
* Priority selector buttons (`Rendah`, `Sedang`, `Tinggi`).
* "Simpan" action button.

### Screen 5: Note Detail Screen (`Detail Catatan`)
* Top toolbar with back action, edit icon, and delete icon.
* Note header with icon, title, and priority badge (e.g., `Penting`).
* Date and time metadata display (e.g., `19 Oktober 2026 • 09.30`).
* Full content text body display area.

---

## 4. Evaluation Criteria & Weights
* **Kelengkapan halaman dan fitur UI (40%)**: Complete 5 required screens with all UI elements.
* **Kreativitas dan kerapian desain (30%)**: Clean, neat layout adhering to the green minimal aesthetic.
* **Konsistensi tampilan dan navigasi (20%)**: Unified navigation flow and consistent UI components across screens.
* **Kerapian kode (10%)**: Structured, readable Flutter/Dart codebase with proper component breakdown.

---

## 5. Technical Requirements
* **Framework:** Flutter (Dart)
* **Target Platform:** Android & iOS (Mobile UI)
* **State Management:** Simple setState or basic provider for page navigation.
* **Assets:** Custom SVG/PNG icons for clean vector representation.