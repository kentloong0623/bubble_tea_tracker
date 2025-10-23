import 'package:flutter/material.dart';
import '../models/preset.dart';
import '../utils/constants.dart';

class PresetCard extends StatelessWidget {
  final Preset preset;
  final VoidCallback onDelete;

  const PresetCard({
    super.key,
    required this.preset,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: DrinkConstants.smallSpacing),
      child: Padding(
        padding: const EdgeInsets.all(DrinkConstants.spacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    preset.presetName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                  onPressed: onDelete,
                  tooltip: '刪除此常喝設定',
                ),
              ],
            ),
            const SizedBox(height: DrinkConstants.smallSpacing),
            Text(
              preset.fullDescription,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: DrinkConstants.smallSpacing),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '使用次數: ${preset.usageCount}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
