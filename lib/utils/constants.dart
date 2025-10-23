class DrinkConstants {
  // Sweetness levels
  static const List<String> sweetnessLevels = [
    '無糖',
    '微糖',
    '半糖',
    '少糖',
    '正常糖',
  ];

  // Ice levels
  static const List<String> iceLevels = [
    '去冰',
    '微冰',
    '少冰',
    '正常冰',
    '多冰',
  ];

  // Tea bases
  static const List<String> teaBases = [
    '紅茶',
    '綠茶',
    '烏龍茶',
    '青茶',
    '茉莉綠茶',
    '阿薩姆紅茶',
    '錫蘭紅茶',
    '四季春',
    '鐵觀音',
  ];

  // Common toppings
  static const List<String> toppings = [
    '珍珠',
    '椰果',
    '仙草',
    '愛玉',
    '布丁',
    '紅豆',
    '綠豆',
    '芋圓',
    '地瓜圓',
    '寒天',
    '蘆薈',
    '奶蓋',
    '奶霜',
    '芝士奶蓋',
  ];

  // Popular brands
  static const List<String> brands = [
    '五十嵐',
    '清心福全',
    '迷客夏',
    '可不可熟成紅茶',
    '茶湯會',
    '春水堂',
    '貢茶',
    '日出茶太',
    '鮮茶道',
    '麻古茶坊',
    '一芳',
    '萬波島嶼紅茶',
    '老虎堂',
    '幸福堂',
    'CoCo都可',
  ];

  // Capacity options
  static const List<String> capacities = [
    '小杯',
    '中杯',
    '大杯',
    '特大杯',
  ];

  // Popular drink names
  static const List<String> popularDrinks = [
    '珍珠奶茶',
    '紅茶拿鐵',
    '綠茶拿鐵',
    '烏龍拿鐵',
    '阿薩姆奶茶',
    '茉莉綠茶',
    '檸檬綠茶',
    '蜂蜜檸檬',
    '冬瓜茶',
    '青茶',
    '四季春茶',
    '鐵觀音',
    '布丁奶茶',
    '椰果奶茶',
    '仙草奶茶',
    '紅豆奶茶',
    '芋頭奶茶',
    '抹茶拿鐵',
    '黑糖珍珠鮮奶',
    '黑糖拿鐵',
  ];

  // Default preset names
  static const List<String> defaultPresetNames = [
    '我的最愛',
    '日常首選',
    '健康特調',
    '甜蜜時光',
    '清爽夏日',
    '溫暖冬日',
    '午後時光',
    '深夜特調',
  ];

  // App theme colors (hex values)
  static const String primaryColor = '#8B4513'; // 奶茶色
  static const String secondaryColor = '#20B2AA'; // 青綠色
  static const String accentColor = '#DAA520'; // 琥珀色
  static const String backgroundColor = '#FAFAFA';
  static const String surfaceColor = '#FFFFFF';
  static const String errorColor = '#F44336';
  static const String textPrimaryColor = '#212121';
  static const String textSecondaryColor = '#757575';

  // Animation durations (milliseconds)
  static const int shortAnimationDuration = 200;
  static const int mediumAnimationDuration = 300;
  static const int longAnimationDuration = 500;

  // UI constants
  static const double borderRadius = 12.0;
  static const double cardElevation = 2.0;
  static const double buttonHeight = 48.0;
  static const double iconSize = 24.0;
  static const double spacing = 16.0;
  static const double smallSpacing = 8.0;
  static const double largeSpacing = 24.0;

  // Database constants
  static const String databaseName = 'bubble_tea_tracker';
  static const int databaseVersion = 1;

  // Validation constants
  static const int maxDrinkNameLength = 50;
  static const int maxPresetNameLength = 30;
  static const int maxNotesLength = 200;
  static const int maxToppingsCount = 5;

  // Statistics constants
  static const int maxRecentOrders = 10;
  static const int maxPopularDrinks = 5;
}
