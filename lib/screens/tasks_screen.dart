import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

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
                      context: context,
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
                      context: context,
                    ),
                    
                    const SizedBox(height: 12),
                    
                    _buildTaskCard(
                      title: '回覆客戶郵件',
                      pomodoroCount: 1,
                      priority: 'low',
                      theme: theme,
                      context: context,
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
                        context: context,
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
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(28),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.small(
              onPressed: () {
                // TODO: Add Task
              },
              heroTag: "addTaskButton",
              elevation: 0,
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
            ),
            FloatingActionButton.small(
              onPressed: () {
                // TODO: 显示AI对话框
              },
              heroTag: "aiButton",
              elevation: 0,
              shape: const CircleBorder(),
              child: const Icon(Icons.smart_toy),
            ),
          ],
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
    required BuildContext context,
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
      child: InkWell(
        onTap: () {
          // TODO: 编辑任务
        },
        borderRadius: BorderRadius.circular(16),
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
                  IconButton(
                    onPressed: () {
                      // 顯示任務詳情的AI分析
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Row(
                            children: [
                              Text('AI 任務分析', style: theme.textTheme.titleLarge),
                            ],
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('任務名稱: $title'),
                              const SizedBox(height: 10),
                              Text('預估時間: $pomodoroCount 個番茄鐘（${pomodoroCount * 25} 分鐘）'),
                              const SizedBox(height: 10),
                              Text('AI 建議:'),
                              const SizedBox(height: 5),
                              Text('• 將任務分成小步驟以提高完成率'),
                              Text('• 每個番茄鐘後記得休息 5 分鐘'),
                              Text('• 設定明確的完成標準'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('關閉'),
                            ),
                          ],
                        ),
                      );
                    },
                    tooltip: 'AI 任務分析',
                    icon: const Icon(Symbols.sticky_note_2, fill: 1,),
                    style: IconButton.styleFrom(
                      minimumSize: const Size(32, 32),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 8),
            Row(
              children: [
                Row(
                  children: [
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
      ),),
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