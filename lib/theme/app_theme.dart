import 'package:flutter/material.dart';

class AppTheme {
  // PRD中定义的色彩系统
  static const Color _primaryColor = Color(0xFF6366F1);
  static const Color _onPrimary = Color(0xFFFFFFFF);
  static const Color _primaryContainer = Color(0xFFE0E7FF);
  static const Color _onPrimaryContainer = Color(0xFF1E293B);
  
  static const Color _surface = Color(0xFFFFFFFF);
  static const Color _surfaceVariant = Color(0xFFF8FAFC);
  static const Color _onSurface = Color(0xFF1E293B);
  static const Color _onSurfaceVariant = Color(0xFF64748B);
  
  static const Color _error = Color(0xFFDC2626);
  
  // 形状系统
  static const RoundedRectangleBorder _cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
  
  static const RoundedRectangleBorder _buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(24)),
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto',
      
      // 色彩方案
      colorScheme: const ColorScheme.light(
        primary: _primaryColor,
        onPrimary: _onPrimary,
        primaryContainer: _primaryContainer,
        onPrimaryContainer: _onPrimaryContainer,
        surface: _surface,
        surfaceContainerHighest: _surfaceVariant,
        onSurface: _onSurface,
        onSurfaceVariant: _onSurfaceVariant,
        error: _error,
      ),
      
      // 文字主题
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.w300,
          fontFamily: 'RobotoMono',
          color: _onSurface,
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: _onSurface,
        ),
        headlineMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: _onSurface,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: _onSurface,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: _onSurface,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: _onSurfaceVariant,
        ),
        labelLarge: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: _onSurfaceVariant,
        ),
      ),
      
      // App Bar主题
      appBarTheme: const AppBarTheme(
        backgroundColor: _surface,
        foregroundColor: _onSurface,
        elevation: 1,
        shadowColor: Colors.black12,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: _onSurface,
        ),
      ),
      
      // 卡片主题
      cardTheme: CardThemeData(
        color: _surface,  
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.08),
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
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto',
      brightness: Brightness.dark,
      
      colorScheme: const ColorScheme.dark(
        primary: _primaryColor,
        onPrimary: _onPrimary,
        primaryContainer: Color(0xFF1E1B4B),
        onPrimaryContainer: Color(0xFFE0E7FF),
        surface: Color(0xFF1E293B),
        surfaceContainerHighest: Color(0xFF334155),
        onSurface: Color(0xFFF8FAFC),
        onSurfaceVariant: Color(0xFFCBD5E1),
        error: Color(0xFFFCA5A5),
      ),
      
      // 其他组件主题保持类似，但颜色调整为深色模式
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