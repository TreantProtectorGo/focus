import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import '../theme/app_theme_m3.dart';

class ThemeService {
  static Future<ThemeData> getLightTheme() async {
    final corePalette = await DynamicColorPlugin.getCorePalette();
    
    if (corePalette != null) {
      // Use dynamic colors from the system
      return ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1), // Fallback seed color
          brightness: Brightness.light,
        ).harmonized(),
      );
    }
    
    // Fallback to static theme
    return AppTheme.lightTheme;
  }
  
  static Future<ThemeData> getDarkTheme() async {
    final corePalette = await DynamicColorPlugin.getCorePalette();
    
    if (corePalette != null) {
      // Use dynamic colors from the system
      return ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1), // Fallback seed color
          brightness: Brightness.dark,
        ).harmonized(),
      );
    }
    
    // Fallback to static theme
    return AppTheme.darkTheme;
  }
  
  static Future<ColorScheme?> getDynamicColorScheme(Brightness brightness) async {
    try {
      final corePalette = await DynamicColorPlugin.getCorePalette();
      if (corePalette != null) {
        return ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: brightness,
        ).harmonized();
      }
    } catch (e) {
      // Dynamic colors not supported, return null
    }
    return null;
  }
}