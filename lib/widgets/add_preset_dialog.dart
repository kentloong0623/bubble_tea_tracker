import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/preset.dart';
import '../utils/constants.dart';

class AddPresetDialog extends StatefulWidget {
  const AddPresetDialog({super.key});

  @override
  State<AddPresetDialog> createState() => _AddPresetDialogState();
}

class _AddPresetDialogState extends State<AddPresetDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _presetNameController;
  late TextEditingController _drinkNameController;

  String _sweetness = DrinkConstants.sweetnessLevels[2]; // Default: 半糖
  String _iceLevel = DrinkConstants.iceLevels[2]; // Default: 少冰
  String? _teaBase;
  final List<String> _toppings = [];
  String? _brand;
  String? _capacity;

  @override
  void initState() {
    super.initState();
    _presetNameController = TextEditingController();
    _drinkNameController = TextEditingController();
  }

  @override
  void dispose() {
    _presetNameController.dispose();
    _drinkNameController.dispose();
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

    return Column(
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
        const SizedBox(height: DrinkConstants.spacing),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("新增常喝設定"),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _presetNameController,
                decoration: const InputDecoration(
                  labelText: "常喝名稱",
                  hintText: "例如：我的最愛、健康特調",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "請輸入常喝名稱";
                  }
                  return null;
                },
              ),
              const SizedBox(height: DrinkConstants.spacing),
              TextFormField(
                controller: _drinkNameController,
                decoration: const InputDecoration(
                  labelText: "飲品名稱",
                  hintText: "例如：珍珠奶茶",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "請輸入飲品名稱";
                  }
                  return null;
                },
              ),
              const SizedBox(height: DrinkConstants.spacing),
              _buildOptionSelector(
                title: "甜度",
                options: DrinkConstants.sweetnessLevels,
                selectedOption: _sweetness,
                onSelected: (value) {
                  if (value == null) return;
                  setState(() {
                    _sweetness = value;
                  });
                },
              ),
              _buildOptionSelector(
                title: "冰量",
                options: DrinkConstants.iceLevels,
                selectedOption: _iceLevel,
                onSelected: (value) {
                  if (value == null) return;
                  setState(() {
                    _iceLevel = value;
                  });
                },
              ),
              _buildOptionSelector(
                title: "茶底 (可選)",
                options: DrinkConstants.teaBases,
                selectedOption: _teaBase,
                onSelected: (value) {
                  setState(() {
                    _teaBase = value;
                  });
                },
                allowNone: true,
              ),
              _buildOptionSelector(
                title: "配料 (可多選)",
                options: DrinkConstants.toppings,
                isMultiSelect: true,
                selectedOption: null,
                onSelected: null,
                selectedMultiOptions: _toppings,
                onMultiSelected: (option, selected) {
                  setState(() {
                    if (selected) {
                      _toppings.add(option);
                    } else {
                      _toppings.remove(option);
                    }
                  });
                },
              ),
              _buildOptionSelector(
                title: "品牌 (可選)",
                options: DrinkConstants.brands,
                selectedOption: _brand,
                onSelected: (value) {
                  setState(() {
                    _brand = value;
                  });
                },
                allowNone: true,
              ),
              _buildOptionSelector(
                title: "容量 (可選)",
                options: DrinkConstants.capacities,
                selectedOption: _capacity,
                onSelected: (value) {
                  setState(() {
                    _capacity = value;
                  });
                },
                allowNone: true,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("取消"),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final newPreset = Preset.create(
                presetName: _presetNameController.text.trim(),
                drinkName: _drinkNameController.text.trim(),
                sweetness: _sweetness,
                iceLevel: _iceLevel,
                teaBase: _teaBase,
                toppings: _toppings,
                brand: _brand,
                capacity: _capacity,
              );
              Navigator.of(context).pop(newPreset);
            }
          },
          child: const Text("新增"),
        ),
      ],
    );
  }
}
