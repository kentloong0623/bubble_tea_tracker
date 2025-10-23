import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/constants.dart';

class DrinkConfigurationWidget extends StatefulWidget {
  final String drinkName;
  final String sweetness;
  final String iceLevel;
  final String? teaBase;
  final List<String> toppings;
  final String? brand;
  final String? capacity;
  final String? notes;
  final Function({
    String? drinkName,
    String? sweetness,
    String? iceLevel,
    String? teaBase,
    List<String>? toppings,
    String? brand,
    String? capacity,
    String? notes,
  }) onConfigurationChanged;

  const DrinkConfigurationWidget({
    super.key,
    required this.drinkName,
    required this.sweetness,
    required this.iceLevel,
    this.teaBase,
    required this.toppings,
    this.brand,
    this.capacity,
    this.notes,
    required this.onConfigurationChanged,
  });

  @override
  State<DrinkConfigurationWidget> createState() => _DrinkConfigurationWidgetState();
}

class _DrinkConfigurationWidgetState extends State<DrinkConfigurationWidget> {
  late TextEditingController _drinkNameController;
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _drinkNameController = TextEditingController(text: widget.drinkName);
    _notesController = TextEditingController(text: widget.notes);
  }

  @override
  void didUpdateWidget(covariant DrinkConfigurationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.drinkName != oldWidget.drinkName) {
      _drinkNameController.text = widget.drinkName;
    }
    if (widget.notes != oldWidget.notes) {
      _notesController.text = widget.notes ?? '';
    }
  }

  @override
  void dispose() {
    _drinkNameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Widget _buildOptionSelector({
    required String title,
    required List<String> options,
    String? selectedOption,
    ValueChanged<String?>? onSelected,
    bool allowNone = false,
    bool isMultiSelect = false,
    List<String>? selectedMultiOptions,
    Function(String, bool)? onMultiSelected,
  }) {
    final accentColor = Color(
      int.parse(DrinkConstants.secondaryColor.substring(1), radix: 16) + 0xFF000000,
    );

    return Card(
      margin: const EdgeInsets.symmetric(vertical: DrinkConstants.smallSpacing),
      child: Padding(
        padding: const EdgeInsets.all(DrinkConstants.spacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: DrinkConstants.smallSpacing),
            Wrap(
              spacing: DrinkConstants.smallSpacing,
              runSpacing: DrinkConstants.smallSpacing,
              children: options.map((option) {
                final isSelected = isMultiSelect
                    ? (selectedMultiOptions?.contains(option) ?? false)
                    : (selectedOption == option);
                return ChoiceChip(
                  label: Text(option),
                  selected: isSelected,
                  onSelected: (selected) {
                    HapticFeedback.lightImpact();
                    if (isMultiSelect) {
                      onMultiSelected?.call(option, selected);
                    } else if (onSelected != null) {
                      if (selected) {
                        onSelected(option);
                      } else if (allowNone) {
                        onSelected(null);
                      }
                    }
                  },
                  selectedColor: accentColor.withValues(alpha: 0.2),
                  backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                    color: isSelected ? accentColor : Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(DrinkConstants.borderRadius),
                    side: BorderSide(
                      color: isSelected ? accentColor : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Drink Name Input
        Card(
          margin: const EdgeInsets.symmetric(vertical: DrinkConstants.smallSpacing),
          child: Padding(
            padding: const EdgeInsets.all(DrinkConstants.spacing),
            child: TextField(
              controller: _drinkNameController,
              decoration: const InputDecoration(
                labelText: '飲品名稱',
                hintText: '例如：珍珠奶茶',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => widget.onConfigurationChanged(drinkName: value),
            ),
          ),
        ),

        // Sweetness Selector
        _buildOptionSelector(
          title: '甜度',
          options: DrinkConstants.sweetnessLevels,
          selectedOption: widget.sweetness,
          onSelected: (value) {
            if (value == null) return;
            widget.onConfigurationChanged(sweetness: value);
          },
        ),

        // Ice Level Selector
        _buildOptionSelector(
          title: '冰量',
          options: DrinkConstants.iceLevels,
          selectedOption: widget.iceLevel,
          onSelected: (value) {
            if (value == null) return;
            widget.onConfigurationChanged(iceLevel: value);
          },
        ),

        // Tea Base Selector (Optional)
        _buildOptionSelector(
          title: '茶底 (可選)',
          options: DrinkConstants.teaBases,
          selectedOption: widget.teaBase,
          onSelected: (value) => widget.onConfigurationChanged(teaBase: value),
          allowNone: true,
        ),

        // Toppings Selector (Multi-select)
        _buildOptionSelector(
          title: '配料 (可多選)',
          options: DrinkConstants.toppings,
          isMultiSelect: true,
          selectedOption: null,
          onSelected: null,
          selectedMultiOptions: widget.toppings,
          onMultiSelected: (option, selected) {
            List<String> updatedToppings = List.from(widget.toppings);
            if (selected) {
              updatedToppings.add(option);
            } else {
              updatedToppings.remove(option);
            }
            widget.onConfigurationChanged(toppings: updatedToppings);
          },
        ),

        // Brand Selector (Optional)
        _buildOptionSelector(
          title: '品牌 (可選)',
          options: DrinkConstants.brands,
          selectedOption: widget.brand,
          onSelected: (value) => widget.onConfigurationChanged(brand: value),
          allowNone: true,
        ),

        // Capacity Selector (Optional)
        _buildOptionSelector(
          title: '容量 (可選)',
          options: DrinkConstants.capacities,
          selectedOption: widget.capacity,
          onSelected: (value) => widget.onConfigurationChanged(capacity: value),
          allowNone: true,
        ),

        // Notes Input
        Card(
          margin: const EdgeInsets.symmetric(vertical: DrinkConstants.smallSpacing),
          child: Padding(
            padding: const EdgeInsets.all(DrinkConstants.spacing),
            child: TextField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: '備註 (可選)',
                hintText: '例如：加冰塊，少糖，去冰，去料',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              onChanged: (value) => widget.onConfigurationChanged(notes: value),
            ),
          ),
        ),
      ],
    );
  }
}
