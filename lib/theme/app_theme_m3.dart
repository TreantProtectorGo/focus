import 'package:flutter/material.dart';

class AppTheme {
  // Material 3 色彩系统 (基于紫色主题)
  static const Color _primarySeed = Color(0xFF6366F1);
  
  // Light theme colors (Material 3 tokens)
  static const Color _lightPrimary = Color(0xFF6366F1);
  static const Color _lightOnPrimary = Color(0xFFFFFFFF);
  static const Color _lightPrimaryContainer = Color(0xFFE0E7FF);
  static const Color _lightOnPrimaryContainer = Color(0xFF1E1B4B);
  
  static const Color _lightSecondary = Color(0xFF7C3AED);
  static const Color _lightOnSecondary = Color(0xFFFFFFFF);
  static const Color _lightSecondaryContainer = Color(0xFFF3E8FF);
  static const Color _lightOnSecondaryContainer = Color(0xFF2D1B4E);
  
  static const Color _lightTertiary = Color(0xFF059669);
  static const Color _lightOnTertiary = Color(0xFFFFFFFF);
  static const Color _lightTertiaryContainer = Color(0xFFD1FAE5);
  static const Color _lightOnTertiaryContainer = Color(0xFF064E3B);
  
  static const Color _lightError = Color(0xFFDC2626);
  static const Color _lightOnError = Color(0xFFFFFFFF);
  static const Color _lightErrorContainer = Color(0xFFFEE2E2);
  static const Color _lightOnErrorContainer = Color(0xFF7F1D1D);
  
  static const Color _lightSurface = Color(0xFFFFFBFF);
  static const Color _lightOnSurface = Color(0xFF1C1B1F);
  static const Color _lightSurfaceVariant = Color(0xFFE7E0EC);
  static const Color _lightOnSurfaceVariant = Color(0xFF49454F);
  static const Color _lightOutline = Color(0xFF79747E);
  static const Color _lightOutlineVariant = Color(0xFFCAC4D0);
  
  // Dark theme colors (Material 3 tokens)
  static const Color _darkPrimary = Color(0xFFBEBCFF);
  static const Color _darkOnPrimary = Color(0xFF2B2D42);
  static const Color _darkPrimaryContainer = Color(0xFF4F46E5);
  static const Color _darkOnPrimaryContainer = Color(0xFFE0E7FF);
  
  static const Color _darkSecondary = Color(0xFFDDD6FE);
  static const Color _darkOnSecondary = Color(0xFF3C2A5A);
  static const Color _darkSecondaryContainer = Color(0xFF5B21B6);
  static const Color _darkOnSecondaryContainer = Color(0xFFF3E8FF);
  
  static const Color _darkTertiary = Color(0xFFA3F3D0);
  static const Color _darkOnTertiary = Color(0xFF0D2818);
  static const Color _darkTertiaryContainer = Color(0xFF047857);
  static const Color _darkOnTertiaryContainer = Color(0xFFD1FAE5);
  
  static const Color _darkError = Color(0xFFFCA5A5);
  static const Color _darkOnError = Color(0xFF7F1D1D);
  static const Color _darkErrorContainer = Color(0xFFDC2626);
  static const Color _darkOnErrorContainer = Color(0xFFFEE2E2);
  
  static const Color _darkSurface = Color(0xFF141218);
  static const Color _darkOnSurface = Color(0xFFE6E0E9);
  static const Color _darkSurfaceVariant = Color(0xFF49454F);
  static const Color _darkOnSurfaceVariant = Color(0xFFCAC4D0);
  static const Color _darkOutline = Color(0xFF938F99);
  static const Color _darkOutlineVariant = Color(0xFF49454F);
  
  // Material 3 Shape tokens
  static const RoundedRectangleBorder _cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  );
  
  static const RoundedRectangleBorder _buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
  
  static const RoundedRectangleBorder _fabShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto',
      
      // Material 3 色彩方案
      colorScheme: const ColorScheme.light(
        primary: _lightPrimary,
        onPrimary: _lightOnPrimary,
        primaryContainer: _lightPrimaryContainer,
        onPrimaryContainer: _lightOnPrimaryContainer,
        
        secondary: _lightSecondary,
        onSecondary: _lightOnSecondary,
        secondaryContainer: _lightSecondaryContainer,
        onSecondaryContainer: _lightOnSecondaryContainer,
        
        tertiary: _lightTertiary,
        onTertiary: _lightOnTertiary,
        tertiaryContainer: _lightTertiaryContainer,
        onTertiaryContainer: _lightOnTertiaryContainer,
        
        error: _lightError,
        onError: _lightOnError,
        errorContainer: _lightErrorContainer,
        onErrorContainer: _lightOnErrorContainer,
        
        surface: _lightSurface,
        onSurface: _lightOnSurface,
        surfaceVariant: _lightSurfaceVariant,
        onSurfaceVariant: _lightOnSurfaceVariant,
        
        outline: _lightOutline,
        outlineVariant: _lightOutlineVariant,
        
        // Material 3 surface tones
        surfaceContainerLowest: Color(0xFFFFFFFF),
        surfaceContainerLow: Color(0xFFF7F2FA),
        surfaceContainer: Color(0xFFF1ECF4),
        surfaceContainerHigh: Color(0xFFECE6F0),
        surfaceContainerHighest: _lightSurfaceVariant,
      ),
      
      // Material 3 AppBar主题
      appBarTheme: const AppBarTheme(
        backgroundColor: _lightSurface,
        foregroundColor: _lightOnSurface,
        elevation: 0,
        scrolledUnderElevation: 3,
        surfaceTintColor: _lightPrimary,
        centerTitle: true,
      ),
      
      // Material 3 Card主题
      cardTheme: CardThemeData(
        elevation: 1,
        surfaceTintColor: _lightPrimary,
        shape: _cardShape,
        margin: const EdgeInsets.all(8),
      ),
      
      // Material 3 按钮主题
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 1,
          shadowColor: Colors.transparent,
          shape: _buttonShape,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          minimumSize: const Size(64, 40),
        ),
      ),
      
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: _buttonShape,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          minimumSize: const Size(64, 40),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: _buttonShape,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          minimumSize: const Size(64, 40),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: _buttonShape,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          minimumSize: const Size(48, 40),
        ),
      ),
      
      // Material 3 FAB主题
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 6,
        highlightElevation: 8,
        shape: _fabShape,
      ),
      
      // BottomNavigationBar主题
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _lightSurface,
        selectedItemColor: _lightPrimary,
        unselectedItemColor: _lightOnSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showUnselectedLabels: true,
      ),
      
      // 输入框主题
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _lightOutline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _lightPrimary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        filled: true,
        fillColor: Color(0xFFF7F2FA),
      ),
      
      // 切换开关主题 - Material 3 style
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return _lightOnPrimary;
          }
          return _lightOutline;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return _lightPrimary;
          }
          return _lightOutlineVariant;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          return _lightOutline;
        }),
      ),
      
      // 进度指示器主题
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: _lightPrimary,
        linearTrackColor: _lightOutlineVariant,
        circularTrackColor: _lightOutlineVariant,
      ),
      
      // Material 3 Navigation Bar
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: _lightSurface,
        indicatorColor: _lightPrimaryContainer,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        height: 80,
      ),
    );
  }
  
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto',
      brightness: Brightness.dark,
      
      colorScheme: const ColorScheme.dark(
        primary: _darkPrimary,
        onPrimary: _darkOnPrimary,
        primaryContainer: _darkPrimaryContainer,
        onPrimaryContainer: _darkOnPrimaryContainer,
        
        secondary: _darkSecondary,
        onSecondary: _darkOnSecondary,
        secondaryContainer: _darkSecondaryContainer,
        onSecondaryContainer: _darkOnSecondaryContainer,
        
        tertiary: _darkTertiary,
        onTertiary: _darkOnTertiary,
        tertiaryContainer: _darkTertiaryContainer,
        onTertiaryContainer: _darkOnTertiaryContainer,
        
        error: _darkError,
        onError: _darkOnError,
        errorContainer: _darkErrorContainer,
        onErrorContainer: _darkOnErrorContainer,
        
        surface: _darkSurface,
        onSurface: _darkOnSurface,
        surfaceVariant: _darkSurfaceVariant,
        onSurfaceVariant: _darkOnSurfaceVariant,
        
        outline: _darkOutline,
        outlineVariant: _darkOutlineVariant,
        
        // Material 3 surface tones
        surfaceContainerLowest: Color(0xFF0F0D13),
        surfaceContainerLow: Color(0xFF1D1A20),
        surfaceContainer: Color(0xFF211E25),
        surfaceContainerHigh: Color(0xFF2B2831),
        surfaceContainerHighest: _darkSurfaceVariant,
      ),
      
      // Material 3 AppBar主题
      appBarTheme: const AppBarTheme(
        backgroundColor: _darkSurface,
        foregroundColor: _darkOnSurface,
        elevation: 0,
        scrolledUnderElevation: 3,
        surfaceTintColor: _darkPrimary,
        centerTitle: true,
      ),
      
      // Material 3 Card主题
      cardTheme: CardThemeData(
        elevation: 1,
        surfaceTintColor: _darkPrimary,
        shape: _cardShape,
        margin: const EdgeInsets.all(8),
      ),
      
      // Material 3 按钮主题
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 1,
          shadowColor: Colors.transparent,
          shape: _buttonShape,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          minimumSize: const Size(64, 40),
        ),
      ),
      
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: _buttonShape,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          minimumSize: const Size(64, 40),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: _buttonShape,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          minimumSize: const Size(64, 40),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: _buttonShape,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          minimumSize: const Size(48, 40),
        ),
      ),
      
      // Material 3 FAB主题
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 6,
        highlightElevation: 8,
        shape: _fabShape,
      ),
      
      // BottomNavigationBar主题
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _darkSurface,
        selectedItemColor: _darkPrimary,
        unselectedItemColor: _darkOnSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showUnselectedLabels: true,
      ),
      
      // 输入框主题
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _darkOutline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _darkPrimary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        filled: true,
        fillColor: Color(0xFF211E25),
      ),
      
      // 切换开关主题 - Material 3 style
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return _darkOnPrimary;
          }
          return _darkOutline;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return _darkPrimary;
          }
          return _darkOutlineVariant;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          return _darkOutline;
        }),
      ),
      
      // 进度指示器主题
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: _darkPrimary,
        linearTrackColor: _darkOutlineVariant,
        circularTrackColor: _darkOutlineVariant,
      ),
      
      // Material 3 Navigation Bar
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: _darkSurface,
        indicatorColor: _darkPrimaryContainer,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        height: 80,
      ),
    );
  }
}

// 自定义颜色扩展
extension AppColors on ColorScheme {
  Color get success => brightness == Brightness.light 
      ? const Color(0xFF22C55E) 
      : const Color(0xFFA3F3D0);
  Color get warning => brightness == Brightness.light 
      ? const Color(0xFFF59E0B) 
      : const Color(0xFFFCD34D);
  Color get restModeBackground => brightness == Brightness.light 
      ? const Color(0xFFF0FDF4) 
      : const Color(0xFF064E3B);
  Color get restModeAccent => brightness == Brightness.light 
      ? const Color(0xFF22C55E) 
      : const Color(0xFFA3F3D0);
}