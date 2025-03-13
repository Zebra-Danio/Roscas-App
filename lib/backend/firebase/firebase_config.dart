import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD8iwaPWHbhZQeO3Tfh17GsbQSvaJ-HRpw",
            authDomain: "roscas-app-b2qppd.firebaseapp.com",
            projectId: "roscas-app-b2qppd",
            storageBucket: "roscas-app-b2qppd.firebasestorage.app",
            messagingSenderId: "235432311806",
            appId: "1:235432311806:web:511449039878e50a019eaf"));
  } else {
    await Firebase.initializeApp();
  }
}
