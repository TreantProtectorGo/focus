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
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: _navigationItems.map((item) => NavigationDestination(
          icon: Icon(item.icon),
          selectedIcon: Icon(
            item.icon, 
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          label: item.label,
        )).toList(),
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