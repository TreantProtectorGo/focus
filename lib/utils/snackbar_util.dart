import 'package:flutter/material.dart';

/// 顯示 Snackbar 的工具類
/// 確保同一時間只顯示一個 Snackbar
class SnackBarUtil {
  /// 顯示簡單的提示訊息
  static void showInfoSnackBar(
    BuildContext context, {
    required String message,
    IconData? icon,
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
  }) {
    _showSnackBar(
      context,
      message: message,
      icon: icon,
      duration: duration,
      action: action,
    );
  }

  /// 顯示成功訊息的 Snackbar
  static void showSuccessSnackBar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
  }) {
    _showSnackBar(
      context,
      message: message,
      icon: Icons.check_circle_outline,
      duration: duration,
      action: action,
    );
  }

  /// 顯示錯誤訊息的 Snackbar
  static void showErrorSnackBar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
  }) {
    _showSnackBar(
      context,
      message: message,
      icon: Icons.error_outline,
      duration: duration,
      action: action,
    );
  }

  /// 基礎 Snackbar 顯示方法
  static void _showSnackBar(
    BuildContext context, {
    required String message,
    IconData? icon,
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
  }) {
    // 在顯示新 Snackbar 之前，先清除當前顯示的 Snackbar
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final theme = Theme.of(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: theme.colorScheme.onInverseSurface,
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: theme.colorScheme.onInverseSurface),
              ),
            ),
          ],
        ),
        backgroundColor: theme.colorScheme.inverseSurface.withValues(alpha: 0.9),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(16),
        duration: duration,
        action: action,
      ),
    );
  }
}
