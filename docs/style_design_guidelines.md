# Style & Design Guidelines: CatatanKu

## 1. Design Philosophy
* **Simplicity & Functionality:** Minimalist layout prioritizing content legibility and easy navigation for all age groups.
* **Human-Centered (Anti-Generic AI Aesthetic):** Avoid generic hyper-glassmorphism, overly dense glowing gradients, or unnecessary decorative clutter typical of boilerplate AI-generated designs.
* **Subtle & Performant:** Zero heavy, lagging micro-animations. Transitions should be instant or basic fade/slide transitions native to Flutter navigation.

---

## 2. Color Palette (Green Nature Theme)

### Primary Colors
* **Primary Green (`#2E7D32` / `Colors.green[800]`):** Main interactive elements, primary action buttons (`Simpan`, `Masuk`), active state indicators.
* **Primary Light Green (`#4CAF50` / `Colors.green[500]`):** Accents, FAB button, active bottom nav items.
* **Soft Mint Background (`#F4F9F5` / `#E8F5E9`):** Subdued background tint for card highlighting and category tags.

### Neutral Colors
* **Background Surface (`#FFFFFF`):** Main app body and container backgrounds.
* **Primary Text (`#1E293B`):** Dark slate for titles and headers (high readability).
* **Secondary Text (`#64748B`):** Muted grey for dates, subtitles, and hints.
* **Border & Divider (`#E2E8F0`):** Subtle light grey line dividers and input borders.

---

## 3. Typography
* **Font Family:** `Inter` or `Plus Jakarta Sans` (clean, highly readable sans-serif).
* **Hierarchy:**
  * **H1 / App Title:** Bold, 22sp - 24sp
  * **H2 / Section Title:** Semi-Bold, 18sp - 20sp
  * **Body Main:** Regular, 14sp - 16sp
  * **Caption / Timestamp:** Regular, 12sp (Muted color)

---

## 4. Components & Layout Rules
* **Buttons:** Rounded corners with a simple border radius (`12dp`). No heavy box-shadows.
* **Cards:** Flat or low-elevation shadow (`elevation: 1` or light border) for note cards.
* **Inputs:** Outlined fields with crisp borders and gentle padding (`16dp`).
* **Animations:** Standard Flutter page routes (`MaterialPageRoute`). Avoid heavy Lottie files or complex multi-stage keyframe animations.