import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '今日任務',
                    style: theme.textTheme.headlineLarge,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        // TODO: 添加新任务
                      },
                      icon: Icon(
                        Icons.add,
                        color: theme.colorScheme.onPrimary,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // 内容区域
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 进行中任务
                    _buildSectionHeader('🎯 進行中', theme),
                    const SizedBox(height: 15),
                    
                    _buildTaskCard(
                      title: '撰寫產品需求文件 - 第一章節',
                      pomodoroCount: 2,
                      priority: 'high',
                      theme: theme,
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // 待办事项
                    _buildSectionHeader('📋 待辦事項', theme),
                    const SizedBox(height: 15),
                    
                    // AI 拆解卡片
                    _buildAIBreakdownCard(theme),
                    
                    const SizedBox(height: 12),
                    
                    _buildTaskCard(
                      title: '準備明天的會議簡報',
                      pomodoroCount: 3,
                      priority: 'medium',
                      theme: theme,
                    ),
                    
                    const SizedBox(height: 12),
                    
                    _buildTaskCard(
                      title: '回覆客戶郵件',
                      pomodoroCount: 1,
                      priority: 'low',
                      theme: theme,
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // 已完成
                    _buildSectionHeader('✅ 已完成', theme),
                    const SizedBox(height: 15),
                    
                    Opacity(
                      opacity: 0.6,
                      child: _buildTaskCard(
                        title: '檢查並回覆 Slack 訊息',
                        pomodoroCount: 1,
                        priority: 'completed',
                        theme: theme,
                      ),
                    ),
                    
                    const SizedBox(height: 100), // Add bottom padding for FAB
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      
      // 浮动操作按钮
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IconButton(
          onPressed: () {
            // TODO: 显示AI对话框
          },
          icon: const Text(
            '🤖',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, ThemeData theme) {
    return Row(
      children: [
        Text(
          title,
          style: theme.textTheme.headlineMedium?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildTaskCard({
    required String title,
    required int pomodoroCount,
    required String priority,
    required ThemeData theme,
  }) {
    Color priorityColor;
    Color priorityBackgroundColor;
    String priorityText;
    
    switch (priority) {
      case 'high':
        priorityColor = const Color(0xFFDC2626);
        priorityBackgroundColor = const Color(0xFFFEF2F2);
        priorityText = '高優先級';
        break;
      case 'medium':
        priorityColor = const Color(0xFFD97706);
        priorityBackgroundColor = const Color(0xFFFFFBEB);
        priorityText = '中優先級';
        break;
      case 'low':
        priorityColor = const Color(0xFF16A34A);
        priorityBackgroundColor = const Color(0xFFF0FDF4);
        priorityText = '低優先級';
        break;
      case 'completed':
        priorityColor = const Color(0xFF16A34A);
        priorityBackgroundColor = const Color(0xFFF0FDF4);
        priorityText = '✅ 已完成';
        break;
      default:
        priorityColor = theme.colorScheme.onSurfaceVariant;
        priorityBackgroundColor = theme.colorScheme.surface;
        priorityText = '';
    }
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // TODO: AI 拆解
                    },
                    icon: const Text('🤖', style: TextStyle(fontSize: 16)),
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // TODO: 编辑任务
                    },
                    icon: Icon(
                      Icons.edit,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Row(
                children: [
                  const Text('🍅', style: TextStyle(fontSize: 12)),
                  const SizedBox(width: 4),
                  Text(
                    '$pomodoroCount 個番茄鐘',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: priorityBackgroundColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  priorityText,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: priorityColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAIBreakdownCard(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6366F1), Color(0xFF4F46E5)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text('🤖', style: TextStyle(fontSize: 12)),
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              '讓 AI 幫你拆解大任務',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}