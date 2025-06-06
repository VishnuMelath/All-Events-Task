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

## 🔗 API Source

All data is loaded from:
-  https://allevents.s3.amazonaws.com/tests/categories.json

## 🧩 Project Structure

lib/
├── config/\n
│ ├── route/\n
│ ├── themes/\n
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


## 🛠 How to Run

1. **Clone the repo**
   ```bash
   git clone https://github.com/VishnuMelath/All-Events-Task

   cd all_events_task

2. **Install dependencies**
    flutter pub get

3. **Set up Firebase**

    Add your own google-services.json and GoogleService-Info.plist for Android and iOS respectively.

    Enable Google Sign-In from Firebase Console.

4. **Run the app**
    flutter run
    
