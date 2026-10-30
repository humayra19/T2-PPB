# User Stories & Acceptance Criteria

## Summary
Below are the user stories organized by the 5 primary screens required for the CatatanKu Flutter UI project.

---

## US-01: Splash Screen
**As a** mobile app user,  
**I want to** see a branded splash screen upon launching the application,  
**So that** I recognize the app identity and understand its core purpose.

**Acceptance Criteria:**
* [x] Show the official app icon and "CatatanKu" brand name.
* [x] Display a short introductory tagline ("Simpan setiap ide, rencana, dan momen berharga...").
* [x] Include a simple loading indicator bar at the bottom.

---

## US-02: Static Login
**As a** returning user,  
**I want to** view a clean login screen with email/password fields and alternative login options,  
**So that** I can access my account easily.

**Acceptance Criteria:**
* [x] Display input fields for Email and Password with icons.
* [x] Include a primary login button ("Masuk").
* [x] Provide a secondary social login button ("Masuk dengan Google").
* [x] Allow tapping the button to navigate directly to the Home screen (`Beranda`).

---

## US-03: Home Dashboard (`Beranda`)
**As a** user,  
**I want to** browse my existing notes with quick filter options and a bottom navigation bar,  
**So that** I can easily organize and search through my daily notes.

**Acceptance Criteria:**
* [x] Display top header greeting user ("Halo, Ahmadi 👋") with avatar.
* [x] Show search input box and category filter chips (`Semua`, `Penting`, `Pribadi`, `Kerja`).
* [x] Render a list of note cards displaying icons, titles, dates, and category tags.
* [x] Include a visible Floating Action Button (FAB) `+` to add a new note.
* [x] Provide a bottom navigation bar with 3 items (`Beranda`, `Arsip`, `Profil`).

---

## US-04: Add Note Form (`Tambah Catatan`)
**As a** user,  
**I want to** fill out a structured form to create a new note,  
**So that** I can save important information with specific categories and priority tags.

**Acceptance Criteria:**
* [x] Form inputs for "Judul Catatan" and "Isi Catatan".
* [x] Category picker dropdown menu.
* [x] Color selection tags for visual organization.
* [x] Priority selector buttons (`Rendah`, `Sedang`, `Tinggi`).
* [x] A full-width "Simpan" action button at the bottom.

---

## US-05: Note Detail Screen (`Detail Catatan`)
**As a** user,  
**I want to** view the complete details of a selected note,  
**So that** I can read, edit, or delete the note information.

**Acceptance Criteria:**
* [x] Top bar with a back navigation arrow, edit icon, and delete icon.
* [x] Display note title with its corresponding category/priority badge (e.g., `Penting`).
* [x] Display created date and timestamp (e.g., `19 Oktober 2026 • 09.30`).
* [x] Show the full text content in a clear, readable format.