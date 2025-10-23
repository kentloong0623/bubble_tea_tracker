import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/order.dart';
import '../models/preset.dart';
import '../services/database_service.dart';
import '../utils/constants.dart';
import '../widgets/drink_configuration_widget.dart';
import '../widgets/preset_selector_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseService _databaseService = DatabaseService.instance;
  
  // Current drink configuration
  String _drinkName = '';
  String _sweetness = DrinkConstants.sweetnessLevels[2]; // Default: 半糖
  String _iceLevel = DrinkConstants.iceLevels[2]; // Default: 少冰
  String? _teaBase;
  List<String> _toppings = [];
  String? _brand;
  String? _capacity;
  String? _notes;

  // UI state
  bool _isRecording = false;
  List<Preset> _presets = [];

  @override
  void initState() {
    super.initState();
    _loadPresets();
  }

  Future<void> _loadPresets() async {
    final presets = await _databaseService.getAllPresets();
    if (!mounted) return;
    setState(() {
      _presets = presets;
    });
  }

  void _updateDrinkConfiguration({
    String? drinkName,
    String? sweetness,
    String? iceLevel,
    String? teaBase,
    List<String>? toppings,
    String? brand,
    String? capacity,
    String? notes,
  }) {
    setState(() {
      if (drinkName != null) _drinkName = drinkName;
      if (sweetness != null) _sweetness = sweetness;
      if (iceLevel != null) _iceLevel = iceLevel;
      if (teaBase != null) _teaBase = teaBase;
      if (toppings != null) _toppings = toppings;
      if (brand != null) _brand = brand;
      if (capacity != null) _capacity = capacity;
      if (notes != null) _notes = notes;
    });
  }

  void _loadPreset(Preset preset) async {
    // Provide haptic feedback
    HapticFeedback.mediumImpact();
    
    // Increment usage count
    await _databaseService.incrementPresetUsage(preset.id);
    if (!mounted) return;
    
    setState(() {
      _drinkName = preset.drinkName;
      _sweetness = preset.sweetness;
      _iceLevel = preset.iceLevel;
      _teaBase = preset.teaBase;
      _toppings = List.from(preset.toppings);
      _brand = preset.brand;
      _capacity = preset.capacity;
    });

    // Show confirmation snackbar
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('已載入「${preset.presetName}」'),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _recordDrink() async {
    if (_drinkName.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('請輸入飲品名稱'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isRecording = true;
    });

    try {
      final order = Order.create(
        drinkName: _drinkName.trim(),
        sweetness: _sweetness,
        iceLevel: _iceLevel,
        teaBase: _teaBase,
        toppings: _toppings,
        brand: _brand,
        capacity: _capacity,
        notes: _notes?.trim(),
      );

      await _databaseService.saveOrder(order);

      // Provide strong haptic feedback for successful recording
      HapticFeedback.heavyImpact();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('記錄成功！'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              label: '查看',
              textColor: Colors.white,
              onPressed: () {
                // Switch to history tab
                // This would require passing a callback from parent
              },
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('記錄失敗：$e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isRecording = false;
        });
      }
    }
  }

  bool get _canRecord => _drinkName.trim().isNotEmpty && !_isRecording;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('珍好記'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadPresets,
            tooltip: '重新載入常喝',
          ),
        ],
      ),
      body: Column(
        children: [
          // Preset selector
          if (_presets.isNotEmpty)
            PresetSelectorWidget(
              presets: _presets,
              onPresetSelected: _loadPreset,
            ),
          
          // Main configuration area
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(DrinkConstants.spacing),
              child: DrinkConfigurationWidget(
                drinkName: _drinkName,
                sweetness: _sweetness,
                iceLevel: _iceLevel,
                teaBase: _teaBase,
                toppings: _toppings,
                brand: _brand,
                capacity: _capacity,
                notes: _notes,
                onConfigurationChanged: _updateDrinkConfiguration,
              ),
            ),
          ),
        ],
      ),
      
      // Record button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _canRecord ? _recordDrink : null,
        backgroundColor: _canRecord 
            ? Color(int.parse(DrinkConstants.primaryColor.substring(1), radix: 16) + 0xFF000000)
            : Colors.grey,
        foregroundColor: Colors.white,
        icon: _isRecording 
            ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Icon(Icons.add_circle),
        label: Text(_isRecording ? '記錄中...' : '記一杯'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
