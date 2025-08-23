import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Theme mode notifier
class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system) {
    _loadThemeMode();
  }

  static const String _themeKey = 'theme_mode';

  // Load theme mode from shared preferences
  Future<void> _loadThemeMode() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeModeString = prefs.getString(_themeKey);
      
      if (themeModeString != null) {
        switch (themeModeString) {
          case 'light':
            state = ThemeMode.light;
            break;
          case 'dark':
            state = ThemeMode.dark;
            break;
          case 'system':
          default:
            state = ThemeMode.system;
            break;
        }
      }
    } catch (e) {
      // If there's an error loading preferences, default to system theme
      state = ThemeMode.system;
    }
  }

  // Save theme mode to shared preferences
  Future<void> _saveThemeMode(ThemeMode mode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String themeModeString;
      
      switch (mode) {
        case ThemeMode.light:
          themeModeString = 'light';
          break;
        case ThemeMode.dark:
          themeModeString = 'dark';
          break;
        case ThemeMode.system:
        default:
          themeModeString = 'system';
          break;
      }
      
      await prefs.setString(_themeKey, themeModeString);
    } catch (e) {
      // Handle error silently - theme will still work for this session
    }
  }

  // Set light theme
  void setLightTheme() {
    state = ThemeMode.light;
    _saveThemeMode(ThemeMode.light);
  }

  // Set dark theme
  void setDarkTheme() {
    state = ThemeMode.dark;
    _saveThemeMode(ThemeMode.dark);
  }

  // Set system theme
  void setSystemTheme() {
    state = ThemeMode.system;
    _saveThemeMode(ThemeMode.system);
  }

  // Toggle between light and dark (ignoring system)
  void toggleTheme() {
    if (state == ThemeMode.light) {
      setDarkTheme();
    } else {
      setLightTheme();
    }
  }

  // Get if dark mode is enabled (considering system theme)
  bool isDarkMode(BuildContext context) {
    switch (state) {
      case ThemeMode.light:
        return false;
      case ThemeMode.dark:
        return true;
      case ThemeMode.system:
        return MediaQuery.of(context).platformBrightness == Brightness.dark;
    }
  }

  // Get theme mode as string for display
  String getThemeModeString() {
    switch (state) {
      case ThemeMode.light:
        return '淺色模式';
      case ThemeMode.dark:
        return '深色模式';
      case ThemeMode.system:
        return '跟隨系統';
    }
  }
}

// Provider for theme mode
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(),
);

// Convenient provider to check if dark mode is active
final isDarkModeProvider = Provider<bool>((ref) {
  final themeMode = ref.watch(themeModeProvider);
  // Note: This will not react to system theme changes automatically
  // For that, you'd need to use a different approach or listener
  return themeMode == ThemeMode.dark;
});