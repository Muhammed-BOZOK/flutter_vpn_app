# Flutter VPN App

A Flutter-based VPN application that allows users to:

- Connect to different countries
- Change locations
- Search for specific locations
- Switch between light and dark themes

---

## 📋 Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Environment](#environment)
- [Architecture](#architecture)
- [Dependencies](#dependencies)
- [License](#license)

---

## 🚀 Features

- **VPN Connection**  
  Connect to various countries to establish a secure VPN connection.

- **Location Switching**  
  Easily switch VPN locations from a list of available countries.

- **Search Functionality**  
  Quickly find and connect to a VPN location by searching countries or cities.

- **Theme Support**  
  Switch between light and dark themes through a dedicated settings screen.

---

## 🔧 Installation

### Prerequisites

Ensure the following tools and environments are installed:

- **Flutter SDK**
- **Dart SDK** (included with Flutter)
- **IDE** (Recommended: VS Code, Android Studio)
- **Android/iOS Emulator** or a physical device

### Steps

#### 1. Clone the Repository

```bash
git clone https://github.com/[your-repo]/flutter-vpn-app.git
cd flutter-vpn-app
```

#### 2. Install Dependencies

```bash
flutter pub get
```

#### 3. Run the App

```bash
flutter run
```

#### 4. Build for Release

```bash
flutter build apk   # For Android
flutter build ios   # For iOS
```

---

## 🧪 Environment

The project was developed using the following versions:

```bash
Flutter 3.27.2 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 68415ad1d9 (7 months ago) • 2025-01-13 10:22:03 -0800
Engine • revision e672b006cb
Tools • Dart 3.6.1 • DevTools 2.40.2
```

> You can check your current setup with:

```bash
flutter --version
```

---

## 🧱 Architecture

The project follows the **Model-View-Controller (MVC)** pattern and uses **GetX** for reactive state management and navigation.

### Structure Overview

- **Model**  
  Includes data models such as `Country`, `ConnectionStatus`, etc.

- **View**  
  Represents screens and reusable widgets (UI).

- **Controller**  
  Manages business logic, state, and user interactions.

### GetX Usage

- **State Management**: `Obx`, `GetBuilder`  
- **Navigation**: `Get.to()`, `Get.back()`  
- **Dependency Injection**: `Get.put()`, `Get.find()`

GetX simplifies app logic, removes boilerplate, and enhances maintainability and performance.

---

## 📦 Dependencies

Below are the key Flutter packages used:

| Package              | Description                                                                 |
|----------------------|-----------------------------------------------------------------------------|
| `get ^4.6.5`         | Reactive state management, routing, and DI (Dependency Injection)            |
| `flutter_screenutil` | Responsive design across multiple screen sizes using a base layout size      |
| `flutter_svg`        | Renders scalable vector (SVG) images for clean and crisp UI                  |

### Install Dependencies

```bash
flutter pub get
```

---

## 📄 License

This project is licensed under the **MIT License**.  
See the [LICENSE](LICENSE) file for more details.

---

> 👨‍💻 Built with Flutter • Designed for performance • Powered by GetX