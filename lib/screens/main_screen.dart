import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  
  const MainScreen({super.key, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  
  static const List<NavigationItem> _navigationItems = [
    NavigationItem(
      path: '/timer',
      icon: Icons.access_time,
      label: '計時器',
    ),
    NavigationItem(
      path: '/tasks', 
      icon: Icons.list_alt,
      label: '任務',
    ),
    NavigationItem(
      path: '/stats',
      icon: Icons.trending_up,
      label: '統計',
    ),
    NavigationItem(
      path: '/settings',
      icon: Icons.settings,
      label: '設定',
    ),
  ];

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
      context.go(_navigationItems[index].path);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateSelectedIndex();
  }

  void _updateSelectedIndex() {
    final String location = GoRouterState.of(context).uri.path;
    for (int i = 0; i < _navigationItems.length; i++) {
      if (location.startsWith(_navigationItems[i].path)) {
        setState(() {
          _selectedIndex = i;
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 0,
          items: _navigationItems.map((item) => BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(2), // Reduced padding to prevent overflow
              child: Icon(
                item.icon,
                size: 22, // Slightly smaller icon
              ),
            ),
            label: item.label,
          )).toList(),
        ),
      ),
    );
  }
}

class NavigationItem {
  final String path;
  final IconData icon;
  final String label;

  const NavigationItem({
    required this.path,
    required this.icon,
    required this.label,
  });
}