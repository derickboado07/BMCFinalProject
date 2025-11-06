import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Import native splash package
import 'package:flutter_native_splash/flutter_native_splash.dart';

// 1. Import AuthWrapper
import 'package:ecommerce_app/screens/auth_wrapper.dart';

void main() async {
  // Preserve the native splash until initialization is finished
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app
  runApp(const MyApp());

  // Remove the native splash once the app is ready
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      title: 'My E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // 2. Use AuthWrapper as the home so auth state decides the screen
      home: const AuthWrapper(),
    );
  }
}
