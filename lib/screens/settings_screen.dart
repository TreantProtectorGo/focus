import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // 设定状态
  int _focusTime = 25;
  int _shortBreak = 5;
  int _longBreak = 15;
  bool _autoStartBreak = true;
  bool _notifications = true;
  bool _vibration = false;
  bool _darkMode = false;
  bool _aiTaskBreakdown = true;
  bool _smartSuggestions = true;
  bool _dataAnalysis = false;
  bool _cloudSync = true;
  String _soundEffect = '鈴鐺';
  String _themeColor = '藍色 (預設)';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            // 头部
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                border: Border(
                  bottom: BorderSide(
                    color: theme.colorScheme.outline.withValues(alpha: 0.2),
                  ),
                ),
              ),
              child: Text(
                '設定',
                style: theme.textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
            ),
            
            // 内容区域
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // 用户信息
                    _buildUserProfile(theme),
                    const SizedBox(height: 16),
                    
                    // 番茄钟设定
                    _buildPomodoroSettings(theme),
                    const SizedBox(height: 16),
                    
                    // 通知设定
                    _buildNotificationSettings(theme),
                    const SizedBox(height: 16),
                    
                    // 外观设定
                    _buildAppearanceSettings(theme),
                    const SizedBox(height: 16),
                    
                    // AI 设定
                    _buildAISettings(theme),
                    const SizedBox(height: 16),
                    
                    // 数据与同步
                    _buildDataSettings(theme),
                    const SizedBox(height: 16),
                    
                    // 危险区域
                    _buildDangerZone(theme),
                    const SizedBox(height: 16),
                    
                    // 版本信息
                    _buildVersionInfo(theme),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserProfile(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6366F1), Color(0xFF4F46E5)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                '王',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '王小明',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'wang@example.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFF59E0B), Color(0xFFD97706)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    '👑 Premium 會員',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection({
    required String title,
    required String subtitle,
    required String icon,
    required List<Widget> children,
    required ThemeData theme,
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: borderColor ?? theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: backgroundColor != null 
                  ? const Color(0xFFFEE2E2)
                  : theme.colorScheme.surfaceContainerHighest,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Text(icon, style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: backgroundColor != null 
                              ? const Color(0xFFDC2626)
                              : theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subtitle,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    required String subtitle,
    required Widget control,
    required ThemeData theme,
    bool isLast = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: !isLast 
            ? Border(
                bottom: BorderSide(
                  color: theme.colorScheme.outline.withValues(alpha: 0.1),
                ),
              )
            : null,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          control,
        ],
      ),
    );
  }

  Widget _buildToggleSwitch(bool value, ValueChanged<bool> onChanged) {
    return Switch(
      value: value,
      onChanged: onChanged,
    );
  }

  Widget _buildTimeInput(int value, ValueChanged<int> onChanged, int min, int max) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 8),
            ),
            controller: TextEditingController(text: value.toString()),
            onChanged: (text) {
              final newValue = int.tryParse(text) ?? value;
              if (newValue >= min && newValue <= max) {
                onChanged(newValue);
              }
            },
          ),
        ),
        const SizedBox(width: 8),
        const Text('分鐘'),
      ],
    );
  }

  Widget _buildDropdown<T>(T value, List<T> items, ValueChanged<T?> onChanged) {
    return DropdownButton<T>(
      value: value,
      items: items.map((item) => DropdownMenuItem<T>(
        value: item,
        child: Text(item.toString()),
      )).toList(),
      onChanged: onChanged,
      underline: Container(),
    );
  }

  Widget _buildPomodoroSettings(ThemeData theme) {
    return _buildSettingsSection(
      title: '番茄鐘設定',
      subtitle: '自訂您的專注與休息時間',
      icon: '⏰',
      theme: theme,
      children: [
        _buildSettingItem(
          title: '專注時間',
          subtitle: '每個番茄鐘的專注時長',
          control: _buildTimeInput(_focusTime, (value) {
            setState(() => _focusTime = value);
          }, 1, 60),
          theme: theme,
        ),
        _buildSettingItem(
          title: '短休息',
          subtitle: '完成一個番茄鐘後的休息時間',
          control: _buildTimeInput(_shortBreak, (value) {
            setState(() => _shortBreak = value);
          }, 1, 30),
          theme: theme,
        ),
        _buildSettingItem(
          title: '長休息',
          subtitle: '完成4個番茄鐘後的休息時間',
          control: _buildTimeInput(_longBreak, (value) {
            setState(() => _longBreak = value);
          }, 5, 60),
          theme: theme,
        ),
        _buildSettingItem(
          title: '自動開始休息',
          subtitle: '專注時間結束後自動開始休息計時',
          control: _buildToggleSwitch(_autoStartBreak, (value) {
            setState(() => _autoStartBreak = value);
          }),
          theme: theme,
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildNotificationSettings(ThemeData theme) {
    return _buildSettingsSection(
      title: '通知設定',
      subtitle: '管理提醒和通知偏好',
      icon: '🔔',
      theme: theme,
      children: [
        _buildSettingItem(
          title: '推播通知',
          subtitle: '時間結束時發送通知',
          control: _buildToggleSwitch(_notifications, (value) {
            setState(() => _notifications = value);
          }),
          theme: theme,
        ),
        _buildSettingItem(
          title: '提示音效',
          subtitle: '選擇計時器結束時的音效',
          control: _buildDropdown<String>(
            _soundEffect,
            ['鈴鐺', '鳥鳴', '海浪', '無音效'],
            (value) => setState(() => _soundEffect = value!),
          ),
          theme: theme,
        ),
        _buildSettingItem(
          title: '震動提醒',
          subtitle: '時間結束時震動提醒',
          control: _buildToggleSwitch(_vibration, (value) {
            setState(() => _vibration = value);
          }),
          theme: theme,
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildAppearanceSettings(ThemeData theme) {
    return _buildSettingsSection(
      title: '外觀設定',
      subtitle: '自訂應用程式的外觀與主題',
      icon: '🎨',
      theme: theme,
      children: [
        _buildSettingItem(
          title: '深色模式',
          subtitle: '使用深色主題保護眼睛',
          control: _buildToggleSwitch(_darkMode, (value) {
            setState(() => _darkMode = value);
          }),
          theme: theme,
        ),
        _buildSettingItem(
          title: '主題色彩',
          subtitle: '選擇您喜歡的主題配色',
          control: _buildDropdown<String>(
            _themeColor,
            ['藍色 (預設)', '綠色', '紫色', '橙色'],
            (value) => setState(() => _themeColor = value!),
          ),
          theme: theme,
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildAISettings(ThemeData theme) {
    return _buildSettingsSection(
      title: 'AI 設定',
      subtitle: '管理 AI 功能和個人化設定',
      icon: '🤖',
      theme: theme,
      children: [
        _buildSettingItem(
          title: 'AI 任務拆解',
          subtitle: '允許 AI 幫助拆解複雜任務',
          control: _buildToggleSwitch(_aiTaskBreakdown, (value) {
            setState(() => _aiTaskBreakdown = value);
          }),
          theme: theme,
        ),
        _buildSettingItem(
          title: '智慧建議',
          subtitle: '根據使用習慣提供個人化建議',
          control: _buildToggleSwitch(_smartSuggestions, (value) {
            setState(() => _smartSuggestions = value);
          }),
          theme: theme,
        ),
        _buildSettingItem(
          title: '數據分析',
          subtitle: '允許分析使用數據以改善服務',
          control: _buildToggleSwitch(_dataAnalysis, (value) {
            setState(() => _dataAnalysis = value);
          }),
          theme: theme,
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildDataSettings(ThemeData theme) {
    return _buildSettingsSection(
      title: '數據與同步',
      subtitle: '管理您的資料備份和同步設定',
      icon: '💾',
      theme: theme,
      children: [
        _buildSettingItem(
          title: '雲端同步',
          subtitle: '自動同步數據到雲端',
          control: _buildToggleSwitch(_cloudSync, (value) {
            setState(() => _cloudSync = value);
          }),
          theme: theme,
        ),
        _buildSettingItem(
          title: '匯出數據',
          subtitle: '下載您的統計數據',
          control: ElevatedButton(
            onPressed: () {},
            child: const Text('匯出 CSV'),
          ),
          theme: theme,
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildDangerZone(ThemeData theme) {
    return _buildSettingsSection(
      title: '危險區域',
      subtitle: '這些操作無法復原，請謹慎操作',
      icon: '⚠️',
      theme: theme,
      backgroundColor: const Color(0xFFFEF2F2),
      borderColor: const Color(0xFFFECACA),
      children: [
        _buildSettingItem(
          title: '清除所有數據',
          subtitle: '刪除所有統計數據和設定',
          control: ElevatedButton(
            onPressed: () => _showConfirmDialog('清除數據'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC2626),
              foregroundColor: Colors.white,
            ),
            child: const Text('清除數據'),
          ),
          theme: theme,
        ),
        _buildSettingItem(
          title: '刪除帳號',
          subtitle: '永久刪除您的帳號和所有資料',
          control: ElevatedButton(
            onPressed: () => _showConfirmDialog('刪除帳號'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC2626),
              foregroundColor: Colors.white,
            ),
            child: const Text('刪除帳號'),
          ),
          theme: theme,
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildVersionInfo(ThemeData theme) {
    return Center(
      child: Column(
        children: [
          Text(
            '專注番茄 v1.0.0',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '© 2024 Focus Tomato Team',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmDialog(String action) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('確認$action'),
        content: Text('確定要執行$action操作嗎？此操作無法復原。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$action功能將在正式版本中實現')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC2626),
              foregroundColor: Colors.white,
            ),
            child: const Text('確定'),
          ),
        ],
      ),
    );
  }
}