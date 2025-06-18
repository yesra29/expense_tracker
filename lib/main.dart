import 'package:expense_tracker/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: "https://mdwvdfkdaywlnjyrvdho.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1kd3ZkZmtkYXl3bG5qeXJ2ZGhvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDkxOTg4NzEsImV4cCI6MjA2NDc3NDg3MX0.NGQn3FX5sIK6TGk6VR-qobPtjCHK0nLEDApb29YQ2EA",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
