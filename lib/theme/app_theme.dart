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
    borderRadius: BorderRadius.all(Radius.circular(12)), // Material 3 standard
  );
  
  static const RoundedRectangleBorder _buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)), // Material 3 standard
  );
  
  static const RoundedRectangleBorder _fabShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)), // Material 3 FAB
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
      
      // Material 3 Typography tokens
      textTheme: const TextTheme(
        // Display styles
        displayLarge: TextStyle(
          fontSize: 57,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.25,
        ),
        displayMedium: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        ),
        
        // Headline styles
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        ),
        
        // Title styles
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        
        // Body styles
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        
        // Label styles
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
      ),
      
      // Material 3 AppBar主题
      appBarTheme: const AppBarTheme(
        backgroundColor: _lightSurface,
        foregroundColor: _lightOnSurface,
        elevation: 0,
        scrolledUnderElevation: 3,
        surfaceTintColor: _lightSurface,
        centerTitle: true,
      ),
      
      // Material 3 Card主题
      cardTheme: CardThemeData(
        elevation: 1,
        surfaceTintColor: _lightPrimary,
        shape: _cardShape,
        margin: const EdgeInsets.all(8),
      ),
      
      // 按钮主题
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          foregroundColor: _onPrimary,
          elevation: 4,
          shadowColor: _primaryColor.withValues(alpha: 0.4),
          shape: _buttonShape,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _primaryColor,
          side: const BorderSide(color: _primaryColor),
          shape: _buttonShape,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primaryColor,
          shape: _buttonShape,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      
      // FloatingActionButton主题
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: _primaryColor,
        foregroundColor: _onPrimary,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      
      // BottomNavigationBar主题
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _surface,
        selectedItemColor: _primaryColor,
        unselectedItemColor: _onSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        elevation: 1,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
      
      // 输入框主题
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _primaryColor),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        filled: true,
        fillColor: _surface,
      ),
      
      // 切换开关主题
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return _onPrimary;
          }
          return const Color(0xFFCBD5E1);
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return _primaryColor;
          }
          return const Color(0xFFE2E8F0);
        }),
      ),
      
      // 进度指示器主题
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: _primaryColor,
        linearTrackColor: Color(0xFFE2E8F0),
        circularTrackColor: Color(0xFFE2E8F0),
      ),
    );
  }
  
  static ThemeData get darkTheme {
    const darkSurface = Color(0xFF1E293B);
    const darkSurfaceVariant = Color(0xFF334155);
    const darkOnSurface = Color(0xFFF8FAFC);
    const darkOnSurfaceVariant = Color(0xFFCBD5E1);
    
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto',
      brightness: Brightness.dark,
      
      colorScheme: const ColorScheme.dark(
        primary: _primaryColor,
        onPrimary: _onPrimary,
        primaryContainer: Color(0xFF1E1B4B),
        onPrimaryContainer: Color(0xFFE0E7FF),
        surface: darkSurface,
        surfaceContainerHighest: darkSurfaceVariant,
        onSurface: darkOnSurface,
        onSurfaceVariant: darkOnSurfaceVariant,
        error: Color(0xFFFCA5A5),
        outline: Color(0xFF475569),
      ),
      
      // 文字主题
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.w300,
          fontFamily: 'RobotoMono',
          color: darkOnSurface,
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: darkOnSurface,
        ),
        headlineMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: darkOnSurface,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: darkOnSurface,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: darkOnSurface,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: darkOnSurfaceVariant,
        ),
        labelLarge: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: darkOnSurfaceVariant,
        ),
      ),
      
      // App Bar主题
      appBarTheme: const AppBarTheme(
        backgroundColor: darkSurface,
        foregroundColor: darkOnSurface,
        elevation: 1,
        shadowColor: Colors.black26,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: darkOnSurface,
        ),
      ),
      
      // 卡片主题
      cardTheme: CardThemeData(
        color: darkSurface,  
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.3),
        shape: _cardShape,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      
      // 按钮主题
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          foregroundColor: _onPrimary,
          elevation: 4,
          shadowColor: _primaryColor.withValues(alpha: 0.4),
          shape: _buttonShape,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _primaryColor,
          side: const BorderSide(color: _primaryColor),
          shape: _buttonShape,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primaryColor,
          shape: _buttonShape,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      
      // FloatingActionButton主题
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: _primaryColor,
        foregroundColor: _onPrimary,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      
      // BottomNavigationBar主题
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkSurface,
        selectedItemColor: _primaryColor,
        unselectedItemColor: darkOnSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        elevation: 1,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
      
      // 输入框主题
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF475569)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _primaryColor),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        filled: true,
        fillColor: darkSurfaceVariant,
      ),
      
      // 切换开关主题
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return _onPrimary;
          }
          return const Color(0xFF64748B);
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return _primaryColor;
          }
          return const Color(0xFF475569);
        }),
      ),
      
      // 进度指示器主题
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: _primaryColor,
        linearTrackColor: Color(0xFF475569),
        circularTrackColor: Color(0xFF475569),
      ),
    );
  }
}

// 自定义颜色扩展
extension AppColors on ColorScheme {
  Color get success => const Color(0xFF22C55E);
  Color get warning => const Color(0xFFF59E0B);
  Color get restModeBackground => const Color(0xFFF0FDF4);
  Color get restModeAccent => const Color(0xFF22C55E);
}