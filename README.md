# AXP | G-HVTOL Gold-Runner

This is the official product landing page for the **AXP Gold-Runner**, a next-generation G-HVTOL aircraft utilizing Carbon Nanofiber (CNF) 3D printing and Graphene CVD deposition technology.

## 🌐 Live Demo
[axp.kr](https://axp.kr) (Pending deployment)

## 🚀 Deployment Instructions

### 1. File Preparation
Before pushing to GitHub, ensure you rename the generated images to match the `index.html` references:
- Rename `gold_runner_exterior_...png` to `hero-gold-runner.png`
- Rename `cnf_3d_printing_process_...png` to `cnf-printing.png`
- Rename `graphene_structure_detail_...png` to `graphene-detail.png`

Place these images in the root directory along with `index.html`, `website_style.css`, and `website_script.js`.

### 2. Push to GitHub
Initialize a git repository and push to your GitHub account (`jaechulkim1973`):
```bash
git init
git add .
git commit -m "Initial commit for AXP Gold-Runner website"
git remote add origin https://github.com/jaechulkim1973/axp.git
git push -u origin main
```

### 3. Deploy to Vercel
1. Log in to [Vercel](https://vercel.com).
2. Click **Add New** > **Project**.
3. Import your `jaechulkim1973/axp` repository.
4. Vercel will automatically detect the static files. Click **Deploy**.
5. Once deployed, go to **Settings** > **Domains**.
6. Add `axp.kr` to link your domain.

## 🛠 Tech Stack
- HTML5
- Vanilla CSS3 (Custom Design System)
- JavaScript (Scroll Reveal Animations)
- AI-Generated Aerospace Visuals

## 📄 Documentation
The technical manufacturing specification for this project is available in `CNF_Graphene_Development_Spec.html`.

---
© 2026 AXP. Developed by jaechulkim1973.
