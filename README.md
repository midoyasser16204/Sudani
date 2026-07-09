# Sudani App

A modern, feature-rich Flutter application built with clean architecture principles, robust state management, and Firebase integration.

## 📱 Features

- **Authentication:** Secure user authentication using Firebase Auth and Google Sign-In.
- **Dynamic Layout & Navigation:** Seamless navigation powered by GoRouter with a responsive layout structure.
- **State Management:** Predictable state management using BLoC & Hydrated BLoC.
- **Location Services:** Google Maps integration and location tracking using Geolocator.
- **Announcements & Home:** Feed and announcements features powered by Cloud Firestore.
- **Responsive UI:** Adaptive UI scaling across devices using `flutter_screenutil`.
- **Localization:** Multi-language support using `flutter_intl`.

## 🛠️ Tech Stack & Packages

- **Framework:** [Flutter](https://flutter.dev/)
- **State Management:** [flutter_bloc](https://pub.dev/packages/flutter_bloc), [hydrated_bloc](https://pub.dev/packages/hydrated_bloc)
- **Dependency Injection:** [get_it](https://pub.dev/packages/get_it)
- **Navigation:** [go_router](https://pub.dev/packages/go_router)
- **Backend (BaaS):** [Firebase](https://firebase.google.com/) (Auth, Cloud Firestore)
- **Maps & Location:** [google_maps_flutter](https://pub.dev/packages/google_maps_flutter), [geolocator](https://pub.dev/packages/geolocator)
- **Functional Programming:** [dartz](https://pub.dev/packages/dartz) (Used for robust error handling)
- **Assets & Styling:** `flutter_svg`, `cupertino_icons`, Custom fonts (PTSans, OpenSans).

## 📁 Project Structure

The project follows a **Feature-Driven Architecture** combined with **Clean Architecture** principles to ensure maintainability, scalability, and testability.

```text
lib/
 ├── core/              # Shared configurations, constants, DI, themes, routes, and reusable widgets
 │    ├── configuration/
 │    ├── constants/
 │    ├── cubit/        # Global states
 │    ├── di/           # Dependency injection setup (GetIt)
 │    ├── error/        # Error handling & failures
 │    ├── routes/       # GoRouter configurations
 │    ├── services/     # Global services
 │    ├── theme/        # App themes and typography
 │    ├── utils/        # Helper functions
 │    └── widgets/      # Common UI components
 │
 ├── feature/           # Isolated feature modules
 │    ├── announcements/
 │    ├── auth/
 │    ├── home/
 │    ├── layout/       # Main app layout shell
 │    └── splash/       # Splash screen logic
 │
 ├── generated/         # Code generation outputs
 ├── l10n/              # Localization files (.arb)
 ├── main.dart          # Entry point
 └── sudani.dart        # Main App widget
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `^3.12.2` or higher
- Dart SDK installed
- Firebase CLI and project setup configured (with `firebase.json` for flutterfire)

### Installation

1. **Clone the repository:**
   ```bash
   git clone <repository_url>
   cd sudani_app
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Set up Environment Variables:**
   - Add your `.env` file inside the `assets/` directory based on required environment keys (if any are used via `flutter_dotenv`).

4. **Firebase Setup:**
   - Ensure your Firebase project is configured correctly using FlutterFire CLI. 
   - `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) should be placed in their respective directories if not auto-generated.

5. **Run the App:**
   ```bash
   flutter run
   ```

## 🌐 Localization

The app uses `flutter_intl` for localization. To add or modify translations:
1. Update the `.arb` files inside the `lib/l10n/` directory.
2. The generated localization files will update automatically, or you can trigger generation using the Flutter Intl IDE plugin.

## 🤝 Contributing
- Follow the established architecture and file structure.
- Run `flutter analyze` and `flutter test` before submitting code to ensure linting rules (via `flutter_lints`) and tests pass.
