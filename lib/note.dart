// B1: Create flutter project, remember to custom package name "flutter create --org com.truonganim my_app"
// B2: Create app in firebase, using package name in manifest
// B3: Download google-service to APP FOLDER
// B4: add project GRADLE dependencies: classpath 'com.google.gms:google-services:4.3.15'
// B5: add "apply plugin: 'com.google.gms.google-services'" to APP GRADEL
// B6: add APP GRADLE dependencies: implementation platform('com.google.firebase:firebase-bom:31.2.3')
// B7: Tạo Firestore, check quyền đọc ghi (allow read, write;)
// B8: add   firebase_storage: ^11.0.15 firebase_core: ^2.7.1 cloud_firestore: ^4.4.4 to pubspec dependencies
// B9: init app:   WidgetsFlutterBinding.ensureInitialized(); await Firebase.initializeApp();
// B10: Oke, lúc này có thể gửi nhận dữ liệu.
// 
// Note 1: Đây là storage, lưu trữ file, sau đó lưu link và tên file thành danh sách trên firestore
// Note 2: Firestore cũng là realtime database, na ná nhau. Mới ra chắc xịn hơn.
// Note 3: Có thể tạo nhiều bucket trên storage, upload file lên các bucket khác nhau