import 'package:isar/isar.dart';

part 'order.g.dart';

@collection
class Order {
  Id id = Isar.autoIncrement;

  @Index()
  late DateTime createdAt;

  late String drinkName;

  late String sweetness;

  late String iceLevel;

  String? teaBase;

  List<String> toppings = [];

  String? brand;

  String? capacity;

  double? price;

  String? notes;

  Order();

  Order.create({
    required this.drinkName,
    required this.sweetness,
    required this.iceLevel,
    this.teaBase,
    List<String> toppings = const [],
    this.brand,
    this.capacity,
    this.price,
    this.notes,
  }) {
    createdAt = DateTime.now();
    this.toppings = List<String>.from(toppings);
  }

  // Helper method to get formatted date string
  String get formattedDate {
    return '${createdAt.year}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}';
  }

  // Helper method to get formatted time string
  String get formattedTime {
    return '${createdAt.hour.toString().padLeft(2, '0')}:${createdAt.minute.toString().padLeft(2, '0')}';
  }

  // Helper method to get display string for toppings
  String get toppingsDisplay {
    if (toppings.isEmpty) return '無配料';
    return toppings.join('、');
  }

  // Helper method to create a copy of the order
  Order copyWith({
    String? drinkName,
    String? sweetness,
    String? iceLevel,
    String? teaBase,
    List<String>? toppings,
    String? brand,
    String? capacity,
    double? price,
    String? notes,
  }) {
    final copy = Order()
      ..id = id
      ..createdAt = createdAt
      ..drinkName = drinkName ?? this.drinkName
      ..sweetness = sweetness ?? this.sweetness
      ..iceLevel = iceLevel ?? this.iceLevel
      ..teaBase = teaBase ?? this.teaBase
      ..toppings = List<String>.from(toppings ?? this.toppings)
      ..brand = brand ?? this.brand
      ..capacity = capacity ?? this.capacity
      ..price = price ?? this.price
      ..notes = notes ?? this.notes;
    return copy;
  }

  @override
  String toString() {
    return 'Order{id: $id, drinkName: $drinkName, sweetness: $sweetness, iceLevel: $iceLevel, createdAt: $createdAt}';
  }
}
