import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myfitness/authservices/authprovider.dart';
import 'package:myfitness/firebase_options.dart';
import 'package:myfitness/screens/authScreen.dart';
import 'package:myfitness/screens/welcomeScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Authprovider())],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelocomeScreen(),
      routes: {"/auth": (context) => const AuthScreen()},
    );
  }
}
