import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen>
    with TickerProviderStateMixin {
  // 计时器状态
  Timer? _timer;
  int _timeLeftInSeconds = 25 * 60; // 25分钟
  int _totalTimeInSeconds = 25 * 60;
  bool _isRunning = false;
  bool _isRestMode = false;
  int _currentSession = 2; // 当前第几个番茄钟
  int _completedSessions = 1; // 已完成的番茄钟数

  // 动画控制器
  late AnimationController _progressController;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  // 当前任务
  final String _currentTask = "撰寫產品需求文件 - 第一章節";

  @override
  void initState() {
    super.initState();
    
    // 初始化动画控制器
    _progressController = AnimationController(
      duration: Duration(seconds: _totalTimeInSeconds),
      vsync: this,
    );
    
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));
    
    // 设置初始进度
    _updateProgress();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _progressController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _updateProgress() {
    double progress = 1 - (_timeLeftInSeconds / _totalTimeInSeconds);
    _progressController.animateTo(progress, duration: const Duration(milliseconds: 100));
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });
    
    _pulseController.repeat(reverse: true);
    
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeftInSeconds > 0) {
        setState(() {
          _timeLeftInSeconds--;
        });
        _updateProgress();
      } else {
        _onTimerComplete();
      }
    });
  }

  void _pauseTimer() {
    setState(() {
      _isRunning = false;
    });
    _timer?.cancel();
    _pulseController.stop();
  }

  void _stopTimer() {
    setState(() {
      _isRunning = false;
      _timeLeftInSeconds = _totalTimeInSeconds;
    });
    _timer?.cancel();
    _pulseController.stop();
    _progressController.reset();
  }

  void _skipTimer() {
    _onTimerComplete();
  }

  void _onTimerComplete() {
    _timer?.cancel();
    _pulseController.stop();
    
    setState(() {
      _isRunning = false;
      
      if (!_isRestMode) {
        // 完成一个专注番茄钟
        _completedSessions++;
        _currentSession++;
        
        // 检查是否应该长休息
        if (_completedSessions % 4 == 0) {
          // 长休息 15分钟
          _isRestMode = true;
          _timeLeftInSeconds = 15 * 60;
          _totalTimeInSeconds = 15 * 60;
        } else {
          // 短休息 5分钟
          _isRestMode = true;
          _timeLeftInSeconds = 5 * 60;
          _totalTimeInSeconds = 5 * 60;
        }
      } else {
        // 休息结束，开始新的专注时间
        _isRestMode = false;
        _timeLeftInSeconds = 25 * 60;
        _totalTimeInSeconds = 25 * 60;
      }
    });
    
    _updateProgress();
    
    // 显示完成通知
    _showCompletionDialog();
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(_isRestMode ? '🍅 番茄鐘完成！' : '⏱️ 休息結束！'),
        content: Text(_isRestMode ? '休息一下吧' : '準備開始下一個專注時間'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('確定'),
          ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      backgroundColor: _isRestMode 
          ? const Color(0xFFF0FDF4) // 休息模式浅绿色背景
          : colorScheme.surface,
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
              child: Column(
                children: [
                  Text(
                    '專注番茄',
                    style: theme.textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '第 $_currentSession 個番茄鐘',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            
            // 主要内容区域
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 当前任务卡片
                    if (!_isRestMode) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        margin: const EdgeInsets.only(bottom: 30),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: theme.colorScheme.outline.withValues(alpha: 0.2),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              '當前任務',
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              _currentTask,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                    
                    // 计时器圆圈
                    AnimatedBuilder(
                      animation: _pulseAnimation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _isRunning ? _pulseAnimation.value : 1.0,
                          child: Container(
                            width: 280,
                            height: 280,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.colorScheme.surface,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.08),
                                  blurRadius: 32,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                // 进度环
                                Positioned.fill(
                                  child: AnimatedBuilder(
                                    animation: _progressController,
                                    builder: (context, child) {
                                      return CustomPaint(
                                        painter: ProgressRingPainter(
                                          progress: _progressController.value,
                                          strokeWidth: 8,
                                          progressColor: _isRestMode 
                                              ? const Color(0xFF22C55E) 
                                              : theme.colorScheme.primary,
                                          backgroundColor: theme.colorScheme.outline.withValues(alpha: 0.2),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                
                                // 时间显示
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _formatTime(_timeLeftInSeconds),
                                        style: theme.textTheme.displayLarge?.copyWith(
                                          fontFamily: 'RobotoMono',
                                          fontSize: 64,
                                          fontWeight: FontWeight.w300,
                                          color: theme.colorScheme.onSurface,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        _isRestMode ? '休息時間' : '專注時間',
                                        style: theme.textTheme.bodyLarge?.copyWith(
                                          color: theme.colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // 番茄钟进度指示器
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index < _completedSessions 
                                ? theme.colorScheme.primary
                                : theme.colorScheme.outline.withValues(alpha: 0.3),
                          ),
                        );
                      }),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // 控制按钮
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 停止按钮
                        _buildControlButton(
                          icon: Icons.stop,
                          onPressed: _isRunning ? _stopTimer : null,
                          isSecondary: true,
                        ),
                        
                        const SizedBox(width: 20),
                        
                        // 主按钮 (播放/暂停)
                        _buildControlButton(
                          icon: _isRunning ? Icons.pause : Icons.play_arrow,
                          onPressed: _isRunning ? _pauseTimer : _startTimer,
                          isPrimary: true,
                        ),
                        
                        const SizedBox(width: 20),
                        
                        // 跳过按钮
                        _buildControlButton(
                          icon: Icons.skip_next,
                          onPressed: _isRunning ? _skipTimer : null,
                          isSecondary: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback? onPressed,
    bool isPrimary = false,
    bool isSecondary = false,
  }) {
    final theme = Theme.of(context);
    
    return Container(
      width: isPrimary ? 84 : 70,
      height: isPrimary ? 84 : 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isPrimary 
            ? theme.colorScheme.primary
            : isSecondary 
                ? theme.colorScheme.surface
                : theme.colorScheme.surface,
        border: isSecondary 
            ? Border.all(
                color: theme.colorScheme.outline.withValues(alpha: 0.2),
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: isPrimary 
                ? theme.colorScheme.primary.withValues(alpha: 0.4)
                : Colors.black.withValues(alpha: 0.15),
            blurRadius: isPrimary ? 16 : 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: isPrimary ? 32 : 24,
          color: isPrimary 
              ? theme.colorScheme.onPrimary
              : onPressed != null
                  ? theme.colorScheme.onSurfaceVariant
                  : theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.38),
        ),
      ),
    );
  }
}

class ProgressRingPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color progressColor;
  final Color backgroundColor;

  ProgressRingPainter({
    required this.progress,
    required this.strokeWidth,
    required this.progressColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - strokeWidth / 2;

    // 背景圆环
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    // 进度圆环
    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * math.pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2, // 从顶部开始
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(ProgressRingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
           oldDelegate.progressColor != progressColor ||
           oldDelegate.backgroundColor != backgroundColor;
  }
}