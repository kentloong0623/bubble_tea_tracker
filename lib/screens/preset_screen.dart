import 'package:flutter/material.dart';
import '../models/preset.dart';
import '../services/database_service.dart';
import '../utils/constants.dart';
import '../widgets/preset_card.dart';
import '../widgets/add_preset_dialog.dart';

class PresetScreen extends StatefulWidget {
  const PresetScreen({super.key});

  @override
  State<PresetScreen> createState() => _PresetScreenState();
}

class _PresetScreenState extends State<PresetScreen> {
  final DatabaseService _databaseService = DatabaseService.instance;
  
  List<Preset> _presets = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPresets();
  }

  Future<void> _loadPresets() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final presets = await _databaseService.getAllPresets();
      if (!mounted) return;
      setState(() {
        _presets = presets;
        _isLoading = false;
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('載入常喝設定失敗：$e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _showAddPresetDialog() async {
    final result = await showDialog<Preset>(
      context: context,
      builder: (context) => const AddPresetDialog(),
    );

    if (result != null) {
      try {
        await _databaseService.savePreset(result);
        await _loadPresets(); // Refresh the list
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('已新增「${result.presetName}」'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('新增失敗：$e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Future<void> _deletePreset(Preset preset) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('確認刪除'),
        content: Text('確定要刪除「${preset.presetName}」嗎？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('刪除'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await _databaseService.deletePreset(preset.id);
        await _loadPresets(); // Refresh the list
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('已刪除「${preset.presetName}」'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('刪除失敗：$e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('常喝設定'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadPresets,
            tooltip: '重新載入',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _presets.isEmpty
              ? _buildEmptyState()
              : _buildPresetsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddPresetDialog,
        backgroundColor: Color(int.parse(DrinkConstants.primaryColor.substring(1), radix: 16) + 0xFF000000),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_outline,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: DrinkConstants.spacing),
          Text(
            '還沒有常喝設定',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: DrinkConstants.smallSpacing),
          Text(
            '新增你的第一個常喝配置吧！',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: DrinkConstants.largeSpacing),
          ElevatedButton.icon(
            onPressed: _showAddPresetDialog,
            icon: const Icon(Icons.add),
            label: const Text('新增常喝'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: DrinkConstants.largeSpacing,
                vertical: DrinkConstants.spacing,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPresetsList() {
    return RefreshIndicator(
      onRefresh: _loadPresets,
      child: ListView.builder(
        padding: const EdgeInsets.all(DrinkConstants.spacing),
        itemCount: _presets.length,
        itemBuilder: (context, index) {
          final preset = _presets[index];
          return PresetCard(
            preset: preset,
            onDelete: () => _deletePreset(preset),
          );
        },
      ),
    );
  }
}
