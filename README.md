# 📅 All Events Task - Flutter App

A cross-platform event listing mobile app built using Flutter, implementing dynamic category-based browsing, event details, and Google Sign-In.

## 🚀 Features

- 🔐 Google Sign-In (mandatory before accessing the app)
- 🗂 Dynamic categories from remote API
- 🧾 Event listing (List and Grid views)
- 🎫 Event details with ticket booking via WebView
- 🎨 Custom UI components
- 📲 Responsive design across devices
- 🔄 State management with Riverpod
- 🖼 Image loading with caching
- 💫 Entry animations
- 🗺 Navigation using `go_router`
- (Optional) Push notifications with `flutter_local_notifications` (extendable)

## 🧑‍💻 Tech Stack

- Flutter 3.8.0
- Riverpod 2.6.1
- Firebase Auth + Google Sign-In
- GoRouter
- WebView
- Lottie, Shimmer
- Cached Network Image
- Shared Preferences

## 📱 Screens

- **Login Screen**: Auth via Google
- **Home Screen**: Fetches dynamic categories
- **Listing Screen**: Events shown in List/Grid view
- **Event Details**: Full event info + ticket booking
- **WebView**: Opens booking link in embedded browser

## API Endpoints

- **Categories API**: Fetches event categories.
- **Events API**: Fetches events based on the selected category.

## 🧩 Project Structure
```bash
lib/
├── config/
│ ├── route/
│ ├── themes/
├── domain/
│ └── models/
├── presentation/
│ ├── providers/
│ ├── views/
│ └── shared/
├── utils/
assets/
├── images/
├── lottie/
```

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/codex7Teen/allevents_pro_flutter_assignment
   ```
2. Navigate to the project directory:
   ```sh
   cd allevents-pro
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
    
## License
This project is for assignment purposes only and is not meant for commercial use.
