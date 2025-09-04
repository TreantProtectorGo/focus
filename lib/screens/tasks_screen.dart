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
            // 頭部
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '今日任務',
                    style: theme.textTheme.headlineLarge,
                  ),
                  FloatingActionButton.small(
                    onPressed: () {
                      // TODO: 添加新任务
                    },
                    elevation: 2,
                    heroTag: "addTask",
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            
            // 内容区域
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 进行中任务
                    _buildSectionHeader('進行中', theme),
                    const SizedBox(height: 15),
                    
                    _buildTaskCard(
                      title: '撰寫產品需求文件 - 第一章節',
                      pomodoroCount: 2,
                      priority: 'high',
                      theme: theme,
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // 待办事项
                    _buildSectionHeader('待辦事項', theme),
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
                    _buildSectionHeader('已完成', theme),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: 显示AI对话框
        },
        backgroundColor: theme.colorScheme.primaryContainer,
        foregroundColor: theme.colorScheme.onPrimaryContainer,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.smart_toy),
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
        priorityColor = theme.colorScheme.error;
        priorityBackgroundColor = theme.colorScheme.errorContainer;
        priorityText = '高優先級';
        break;
      case 'medium':
        priorityColor = theme.colorScheme.tertiary;
        priorityBackgroundColor = theme.colorScheme.tertiaryContainer;
        priorityText = '中優先級';
        break;
      case 'low':
        priorityColor = theme.colorScheme.primary;
        priorityBackgroundColor = theme.colorScheme.primaryContainer;
        priorityText = '低優先級';
        break;
      case 'completed':
        priorityColor = theme.colorScheme.secondary;
        priorityBackgroundColor = theme.colorScheme.secondaryContainer;
        priorityText = '已完成';
        break;
      default:
        priorityColor = theme.colorScheme.onSurfaceVariant;
        priorityBackgroundColor = theme.colorScheme.surfaceVariant;
        priorityText = '';
    }
    
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      surfaceTintColor: theme.colorScheme.surfaceTint,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
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
                      icon: const Icon(Icons.smart_toy),
                      style: IconButton.styleFrom(
                        minimumSize: const Size(32, 32),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // TODO: 编辑任务
                      },
                      icon: Icon(
                        Icons.edit_outlined,
                        size: 16,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      style: IconButton.styleFrom(
                        minimumSize: const Size(32, 32),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                    const Icon(Icons.timer_outlined),
                    const SizedBox(width: 4),
                    Text(
                      '$pomodoroCount 個番茄鐘',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Chip(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 2, vertical: -2),
                  padding: EdgeInsets.zero,
                  backgroundColor: priorityBackgroundColor,
                  label: Text(
                    priorityText,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: priorityColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAIBreakdownCard(ThemeData theme) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      color: theme.colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          // TODO: AI 拆解任務處理
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
                child: const Icon(Icons.smart_toy),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  '讓 AI 幫你拆解大任務',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}