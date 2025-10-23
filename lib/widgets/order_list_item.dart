import 'package:flutter/material.dart';
import '../models/order.dart';
import '../utils/constants.dart';

class OrderListItem extends StatelessWidget {
  final Order order;
  final VoidCallback onDelete;

  const OrderListItem({
    super.key,
    required this.order,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: DrinkConstants.spacing,
        vertical: DrinkConstants.smallSpacing,
      ),
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
                    order.drinkName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  order.formattedTime,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: DrinkConstants.smallSpacing),
            Text(
              '${order.sweetness} / ${order.iceLevel}${order.teaBase != null && order.teaBase!.isNotEmpty ? ' / ${order.teaBase}' : ''}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            if (order.toppings.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: DrinkConstants.smallSpacing / 2),
                child: Text(
                  '配料: ${order.toppingsDisplay}',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            if (order.brand != null && order.brand!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: DrinkConstants.smallSpacing / 2),
                child: Text(
                  '品牌: ${order.brand}',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            if (order.capacity != null && order.capacity!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: DrinkConstants.smallSpacing / 2),
                child: Text(
                  '容量: ${order.capacity}',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            if (order.notes != null && order.notes!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: DrinkConstants.smallSpacing / 2),
                child: Text(
                  '備註: ${order.notes}',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                onPressed: onDelete,
                tooltip: '刪除此記錄',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
