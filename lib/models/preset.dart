import 'package:isar/isar.dart';

import 'order.dart';

part 'preset.g.dart';

@collection
class Preset {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String presetName;

  late String drinkName;

  late String sweetness;

  late String iceLevel;

  String? teaBase;

  List<String> toppings = [];

  String? brand;

  String? capacity;

  late DateTime createdAt;

  late DateTime updatedAt;

  int usageCount = 0;

  Preset();

  Preset.create({
    required this.presetName,
    required this.drinkName,
    required this.sweetness,
    required this.iceLevel,
    this.teaBase,
    List<String> toppings = const [],
    this.brand,
    this.capacity,
  }) {
    createdAt = DateTime.now();
    updatedAt = DateTime.now();
    usageCount = 0;
    this.toppings = List<String>.from(toppings);
  }

  // Helper method to increment usage count
  void incrementUsage() {
    usageCount++;
    updatedAt = DateTime.now();
  }

  // Helper method to get display string for toppings
  String get toppingsDisplay {
    if (toppings.isEmpty) return '無配料';
    return toppings.join('、');
  }

  // Helper method to get full drink description
  String get fullDescription {
    List<String> parts = [drinkName];
    
    if (brand != null && brand!.isNotEmpty) {
      parts.insert(0, brand!);
    }
    
    if (capacity != null && capacity!.isNotEmpty) {
      parts.add(capacity!);
    }
    
    parts.add(sweetness);
    parts.add(iceLevel);
    
    if (teaBase != null && teaBase!.isNotEmpty) {
      parts.add(teaBase!);
    }
    
    if (toppings.isNotEmpty) {
      parts.add(toppingsDisplay);
    }
    
    return parts.join(' ');
  }

  // Helper method to create an Order from this preset
  Order toOrder() {
    return Order.create(
      drinkName: drinkName,
      sweetness: sweetness,
      iceLevel: iceLevel,
      teaBase: teaBase,
      toppings: List.from(toppings),
      brand: brand,
      capacity: capacity,
    );
  }

  // Helper method to update preset from order
  void updateFromOrder(Order order) {
    drinkName = order.drinkName;
    sweetness = order.sweetness;
    iceLevel = order.iceLevel;
    teaBase = order.teaBase;
    toppings = List.from(order.toppings);
    brand = order.brand;
    capacity = order.capacity;
    updatedAt = DateTime.now();
  }

  @override
  String toString() {
    return 'Preset{id: $id, presetName: $presetName, drinkName: $drinkName, usageCount: $usageCount}';
  }
}
