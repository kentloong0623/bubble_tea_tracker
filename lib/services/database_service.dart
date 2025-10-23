import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/order.dart';
import '../models/preset.dart';

class DatabaseService {
  static DatabaseService? _instance;
  static Isar? _isar;

  DatabaseService._internal();

  static DatabaseService get instance {
    _instance ??= DatabaseService._internal();
    return _instance!;
  }

  Future<Isar> get isar async {
    if (_isar != null) return _isar!;
    
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [OrderSchema, PresetSchema],
      directory: dir.path,
    );
    
    return _isar!;
  }

  // Order operations
  Future<void> saveOrder(Order order) async {
    final db = await isar;
    await db.writeTxn(() async {
      await db.orders.put(order);
    });
  }

  Future<List<Order>> getAllOrders() async {
    final db = await isar;
    return await db.orders.where().sortByCreatedAtDesc().findAll();
  }

  Future<List<Order>> getOrdersByDateRange(DateTime start, DateTime end) async {
    final db = await isar;
    return await db.orders
        .where()
        .createdAtBetween(start, end)
        .sortByCreatedAtDesc()
        .findAll();
  }

  Future<List<Order>> getOrdersThisWeek() async {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final startOfWeekMidnight = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
    final endOfWeek = startOfWeekMidnight.add(const Duration(days: 7));
    
    return await getOrdersByDateRange(startOfWeekMidnight, endOfWeek);
  }

  Future<Map<String, List<Order>>> getOrdersGroupedByDate() async {
    final orders = await getAllOrders();
    final Map<String, List<Order>> groupedOrders = {};
    
    for (final order in orders) {
      final dateKey = order.formattedDate;
      if (groupedOrders[dateKey] == null) {
        groupedOrders[dateKey] = [];
      }
      groupedOrders[dateKey]!.add(order);
    }
    
    return groupedOrders;
  }

  Future<void> deleteOrder(int orderId) async {
    final db = await isar;
    await db.writeTxn(() async {
      await db.orders.delete(orderId);
    });
  }

  // Preset operations
  Future<void> savePreset(Preset preset) async {
    final db = await isar;
    await db.writeTxn(() async {
      await db.presets.put(preset);
    });
  }

  Future<List<Preset>> getAllPresets() async {
    final db = await isar;
    return await db.presets.where().sortByUsageCountDesc().findAll();
  }

  Future<Preset?> getPresetByName(String name) async {
    final db = await isar;
    return await db.presets.where().presetNameEqualTo(name).findFirst();
  }

  Future<void> incrementPresetUsage(int presetId) async {
    final db = await isar;
    await db.writeTxn(() async {
      final preset = await db.presets.get(presetId);
      if (preset != null) {
        preset.incrementUsage();
        await db.presets.put(preset);
      }
    });
  }

  Future<void> deletePreset(int presetId) async {
    final db = await isar;
    await db.writeTxn(() async {
      await db.presets.delete(presetId);
    });
  }

  // Statistics
  Future<int> getTotalOrdersCount() async {
    final db = await isar;
    return await db.orders.count();
  }

  Future<int> getOrdersCountThisWeek() async {
    final orders = await getOrdersThisWeek();
    return orders.length;
  }

  Future<Map<String, int>> getDrinkPopularity() async {
    final orders = await getAllOrders();
    final Map<String, int> popularity = {};
    
    for (final order in orders) {
      popularity[order.drinkName] = (popularity[order.drinkName] ?? 0) + 1;
    }
    
    return popularity;
  }

  Future<Map<String, int>> getSweetnessPreference() async {
    final orders = await getAllOrders();
    final Map<String, int> preference = {};
    
    for (final order in orders) {
      preference[order.sweetness] = (preference[order.sweetness] ?? 0) + 1;
    }
    
    return preference;
  }

  // Utility methods
  Future<void> clearAllData() async {
    final db = await isar;
    await db.writeTxn(() async {
      await db.orders.clear();
      await db.presets.clear();
    });
  }

  Future<void> close() async {
    if (_isar != null) {
      await _isar!.close();
      _isar = null;
    }
  }
}
