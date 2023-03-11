// B1: Create flutter project, remember to custom package name "flutter create --org com.truonganim my_app"
// B2: Create app in firebase, using package name in manifest
// B3: Download google-service to APP FOLDER
// B4: add project GRADLE dependencies: classpath 'com.google.gms:google-services:4.3.15'
// B5: add "apply plugin: 'com.google.gms.google-services'" to APP GRADEL
// B6: add APP GRADLE dependencies: implementation platform('com.google.firebase:firebase-bom:31.2.3')
// B7: Tạo Firestore, check quyền đọc ghi (allow read, write;)
// B8: add   firebase_storage: ^11.0.15 firebase_core: ^2.7.1 to pubspec
// B9: add   firebase_storage: ^11.0.15 firebase_core: ^2.7.1 to pubspec dependencies
// B10: init app:   WidgetsFlutterBinding.ensureInitialized(); await Firebase.initializeApp();
//
// 
// Note 1: Đây là storage, lưu trữ file, Không phải cloud firestore (1 loại khác của realtime database)
// Note 2: Có thể tạo nhiều bucket trên storage, upload file lên các bucket khác nhau