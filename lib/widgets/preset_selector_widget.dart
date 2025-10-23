import 'package:flutter/material.dart';
import '../models/preset.dart';
import '../utils/constants.dart';

class PresetSelectorWidget extends StatelessWidget {
  final List<Preset> presets;
  final Function(Preset) onPresetSelected;

  const PresetSelectorWidget({
    super.key,
    required this.presets,
    required this.onPresetSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (presets.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      height: 100, // Fixed height for the horizontal list
      margin: const EdgeInsets.symmetric(vertical: DrinkConstants.smallSpacing),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: DrinkConstants.spacing),
        itemCount: presets.length,
        itemBuilder: (context, index) {
          final preset = presets[index];
          return GestureDetector(
            onTap: () => onPresetSelected(preset),
            child: Card(
              margin: const EdgeInsets.only(right: DrinkConstants.smallSpacing),
              child: Container(
                width: 120,
                padding: const EdgeInsets.all(DrinkConstants.smallSpacing),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      preset.presetName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      preset.fullDescription,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
