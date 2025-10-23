import 'package:flutter/material.dart';
import '../utils/constants.dart';

class StatisticsWidget extends StatelessWidget {
  final int weeklyCount;
  final int totalCount;

  const StatisticsWidget({
    super.key,
    required this.weeklyCount,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(DrinkConstants.spacing),
      child: Padding(
        padding: const EdgeInsets.all(DrinkConstants.spacing),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem(
              context,
              '本週總杯數',
              weeklyCount,
              Icons.local_cafe,
            ),
            _buildStatItem(
              context,
              '總記錄數',
              totalCount,
              Icons.history,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String title, int count, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          size: 32,
          color: Color(int.parse(DrinkConstants.primaryColor.substring(1), radix: 16) + 0xFF000000),
        ),
        const SizedBox(height: DrinkConstants.smallSpacing),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        Text(
          count.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
