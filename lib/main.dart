
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
import 'package:shared_preferences_assignment/home_page.dart';


void main() {
  runApp(
    DevicePreview(
      backgroundColor: Colors.white,  // Professional, clean background
      enabled: true,                 // Let the magic begin!
      defaultDevice: Devices.ios.iPhone13ProMax,  // Start with a bang
      isToolbarVisible: true,                     // Give users control
      availableLocales: [Locale('en', 'US')],    // Keep it focused
      tools: const [
        DeviceSection(
          model: true,          // Let them switch devices
          orientation: false,   // Keep it simple
          frameVisibility: false, // Clean presentation
          virtualKeyboard: false, // Focus on the UI
        ),
      ],
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return(GetMaterialApp(
      home: HomePage(),
    ));
  }

}