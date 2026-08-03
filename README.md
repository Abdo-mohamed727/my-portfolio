# Abdulrahman — Flutter Portfolio

A responsive personal portfolio built with Flutter, compiled to Flutter Web
and deployed to GitHub Pages.

## 1. Customize your content

Edit **`lib/data/portfolio_data.dart`** only — that's the single file with
your name, bio, skills, projects, email, GitHub, and LinkedIn links. Every
`// TODO` marks something to fill in (your email, repo links, CV link).

## 1.5 Add project demo screenshots (optional but recommended)

Clicking any project card opens a full presentation screen with a swipeable
screenshot carousel. To populate it:

1. Drop your screenshots into `assets/projects/<project_name>/` (folders
   already exist for `blinkbuy`, `tasky`, `my_store`).
2. In `lib/data/portfolio_data.dart`, list them in each project's
   `screenshots:` field, e.g.:
   ```dart
   screenshots: [
     'assets/projects/blinkbuy/1.png',
     'assets/projects/blinkbuy/2.png',
   ],
   ```
3. Run `flutter pub get` again so the new assets are picked up.

If a project has no screenshots listed, its presentation screen shows a
placeholder instead — the app still works fine without images.

## 2. Run locally

```bash
flutter pub get
flutter run -d chrome
```

## 3. Deploy to GitHub Pages

### Option A — automatic (recommended)
1. Push this project to a new GitHub repo (e.g. `portfolio`).
2. In `.github/workflows/deploy.yml`, replace `REPO_NAME` with your repo's
   actual name (e.g. if your repo is `github.com/you/portfolio`, use
   `/portfolio/`).
3. In your repo settings → **Pages**, set the source to the `gh-pages`
   branch (it will be created automatically after the first push).
4. Push to `main` — GitHub Actions builds and deploys automatically.
   Your site will be live at `https://<username>.github.io/<repo-name>/`.

### Option B — manual
```bash
flutter build web --release --base-href "/REPO_NAME/"
```
Then push the contents of `build/web` to a `gh-pages` branch, or use the
[`gh-pages` npm package](https://www.npmjs.com/package/gh-pages) /
`git subtree` to publish that folder.

## Project structure

```
lib/
  main.dart                 # App entry point
  theme/app_theme.dart      # Colors, text styles, responsive breakpoints
  models/project_model.dart # Project data model
  data/portfolio_data.dart  # ← YOUR CONTENT GOES HERE
  widgets/                  # Reusable UI sections
  screens/home_screen.dart  # Assembles all sections with scroll navigation
```

## Notes

- No custom fonts or images required to run out of the box — add your own
  under `assets/` and reference them in `pubspec.yaml` if you want to
  personalize further (e.g. a profile photo, custom font).
- Built with a dark theme suited to a developer portfolio; colors live in
  `AppColors` in `lib/theme/app_theme.dart` if you want to change the palette.
