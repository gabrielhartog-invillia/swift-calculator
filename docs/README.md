# GitHub Pages Setup Guide

This folder contains the GitHub Pages site for the iOS Calculator App.

## 🚀 How to Enable GitHub Pages

1. **Push the `docs` folder to GitHub:**
   ```bash
   git add docs/
   git commit -m "Add GitHub Pages site"
   git push origin main
   ```

2. **Enable GitHub Pages in Repository Settings:**
   - Go to your repository on GitHub
   - Click on **Settings** tab
   - Scroll down to **Pages** section (in the left sidebar under "Code and automation")
   - Under **Source**, select:
     - Branch: `main` (or your default branch)
     - Folder: `/docs`
   - Click **Save**

3. **Wait a few minutes** for GitHub to build and deploy your site

4. **Access your site** at: `https://yourusername.github.io/yourrepo/`

## 📝 Customization

Before publishing, update the following in `index.html`:

- Replace `https://github.com/yourusername/yourrepo` with your actual repository URL (appears in 2 places)
- Update the footer copyright year if needed
- Add screenshots or demo GIF if desired

## 🎨 Adding Screenshots

To add screenshots to your GitHub Pages:

1. Create a `docs/images/` folder
2. Add your screenshot images
3. Update the HTML to include: `<img src="images/screenshot.png" alt="Calculator App">`

## 🔧 Local Testing

To test the site locally before pushing:

```bash
cd docs
python3 -m http.server 8000
```

Then open `http://localhost:8000` in your browser.

## 📱 Features of the Landing Page

The GitHub Pages site includes:
- ✨ Modern, animated design with gradient backgrounds
- 📱 Fully responsive layout (mobile-friendly)
- 🎯 Feature showcase with grid layout
- 🏗️ Architecture overview
- 🚀 Getting started guide
- 🔮 Future enhancements section
- 📄 Clean, professional appearance

## 🌐 Custom Domain (Optional)

To use a custom domain:
1. Add a `CNAME` file in the `docs/` folder with your domain name
2. Configure DNS settings with your domain provider
3. See [GitHub's custom domain documentation](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)
