# The Golden Fork - Restaurant Website

A simple, modern restaurant website built with HTML, CSS, and JavaScript. Ready to be hosted on GitHub Pages.

## Features

- 🍽️ Responsive design that works on all devices
- 📱 Mobile-friendly navigation
- 🎨 Modern, professional styling
- 🔗 Smooth scrolling navigation
- 📧 Contact form
- 🍴 Menu showcase
- 📍 Location and hours information

## Files Included

- `index.html` - Main HTML structure
- `style.css` - Styling and responsive design
- `script.js` - Interactive features and smooth scrolling
- `README.md` - This file

## How to Host on GitHub Pages

### Step 1: Create a GitHub Repository

1. Go to [github.com](https://github.com) and sign in to your account
2. Click the **+** icon in the top right and select **New repository**
3. Name your repository: `username.github.io` (replace `username` with your GitHub username)
   - **Important**: Use exactly this naming convention for automatic GitHub Pages deployment
4. Choose **Public** (required for free GitHub Pages)
5. Click **Create repository**

### Step 2: Push Your Files to GitHub

1. Open Terminal/Command Prompt in this folder
2. Run these commands:

```bash
git init
git add .
git commit -m "Initial commit: Restaurant website"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git
git push -u origin main
```

Replace:
- `YOUR-USERNAME` with your GitHub username
- `YOUR-REPO-NAME` with your repository name

### Step 3: Enable GitHub Pages (if not automatic)

1. Go to your repository on GitHub
2. Click **Settings** (gear icon)
3. Scroll down to **Pages** section
4. Under "Source", select **Deploy from a branch**
5. Select `main` branch and `/root` folder
6. Click **Save**

### Step 4: Access Your Website

Your website will be live at:
- If named `username.github.io`: `https://username.github.io`
- If named something else: `https://username.github.io/repo-name`

It may take a few minutes to deploy.

## Customization

### Edit Restaurant Information

Open `index.html` and update:
- Restaurant name (search for "The Golden Fork")
- Address, phone number in the About section
- Hours of operation
- Menu items and prices

### Modify Colors

Edit `style.css` and change these color values:
- `#f39c12` - Accent color (gold)
- `#e74c3c` - Secondary color (red)
- `#2c3e50` - Dark color (navbar background)

### Add More Sections

Add new `<section>` elements to `index.html` following the existing pattern, and add corresponding CSS in `style.css`.

## Deployment Updates

To update your website after making changes:

```bash
git add .
git commit -m "Update website content"
git push origin main
```

Your changes will be live within a few minutes.

## Browser Support

Works on all modern browsers:
- Chrome/Edge
- Firefox
- Safari
- Mobile browsers (iOS Safari, Chrome Android)

## License

Free to use and modify for your restaurant website.

## Tips

- Add actual restaurant photos to make it more appealing
- Integrate with online reservation systems
- Add a blog for daily specials
- Include Google Maps for location
- Add customer reviews/testimonials
- Set up email notifications for contact form submissions

---

**Ready to launch?** Follow the GitHub Pages setup steps above and your restaurant will be online!
