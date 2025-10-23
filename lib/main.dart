import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'services/database_service.dart';
import 'screens/home_screen.dart';
import 'screens/history_screen.dart';
import 'screens/preset_screen.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize database service
  await DatabaseService.instance.isar;
  
  runApp(const BubbleTeaTrackerApp());
}

class BubbleTeaTrackerApp extends StatelessWidget {
  const BubbleTeaTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '珍好記',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home: const MainNavigationScreen(),
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color(int.parse(DrinkConstants.primaryColor.substring(1), radix: 16) + 0xFF000000),
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(int.parse(DrinkConstants.primaryColor.substring(1), radix: 16) + 0xFF000000),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(int.parse(DrinkConstants.primaryColor.substring(1), radix: 16) + 0xFF000000),
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, DrinkConstants.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DrinkConstants.borderRadius),
          ),
          elevation: DrinkConstants.cardElevation,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: DrinkConstants.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DrinkConstants.borderRadius),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: DrinkConstants.spacing,
          vertical: DrinkConstants.smallSpacing,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DrinkConstants.borderRadius),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: DrinkConstants.spacing,
          vertical: DrinkConstants.smallSpacing,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Color(int.parse(DrinkConstants.primaryColor.substring(1), radix: 16) + 0xFF000000),
        unselectedItemColor: Color(int.parse(DrinkConstants.textSecondaryColor.substring(1), radix: 16) + 0xFF000000),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const HistoryScreen(),
    const PresetScreen(),
  ];

  void _onTabTapped(int index) {
    if (index != _currentIndex) {
      // Provide haptic feedback for tab switching
      HapticFeedback.lightImpact();
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: '記錄',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            activeIcon: Icon(Icons.history),
            label: '歷史',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: '常喝',
          ),
        ],
      ),
    );
  }
}
