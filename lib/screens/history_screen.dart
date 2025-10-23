import 'package:flutter/material.dart';
import '../models/order.dart';
import '../services/database_service.dart';
import '../utils/constants.dart';
import '../widgets/order_list_item.dart';
import '../widgets/statistics_widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final DatabaseService _databaseService = DatabaseService.instance;
  
  Map<String, List<Order>> _groupedOrders = {};
  int _weeklyCount = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadOrderHistory();
  }

  Future<void> _loadOrderHistory() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final groupedOrders = await _databaseService.getOrdersGroupedByDate();
      final weeklyCount = await _databaseService.getOrdersCountThisWeek();
      
      if (!mounted) return;
      setState(() {
        _groupedOrders = groupedOrders;
        _weeklyCount = weeklyCount;
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
            content: Text('載入歷史記錄失敗：$e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _deleteOrder(Order order) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('確認刪除'),
        content: Text('確定要刪除「${order.drinkName}」的記錄嗎？'),
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
        await _databaseService.deleteOrder(order.id);
        await _loadOrderHistory(); // Refresh the list
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('記錄已刪除'),
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
        title: const Text('歷史記錄'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadOrderHistory,
            tooltip: '重新載入',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Statistics section
                StatisticsWidget(
                  weeklyCount: _weeklyCount,
                  totalCount: _groupedOrders.values
                      .expand((orders) => orders)
                      .length,
                ),
                
                // Orders list
                Expanded(
                  child: _groupedOrders.isEmpty
                      ? _buildEmptyState()
                      : _buildOrdersList(),
                ),
              ],
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.local_cafe_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: DrinkConstants.spacing),
          Text(
            '還沒有任何記錄',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: DrinkConstants.smallSpacing),
          Text(
            '去記錄你的第一杯手搖飲吧！',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersList() {
    final sortedDates = _groupedOrders.keys.toList()
      ..sort((a, b) => b.compareTo(a)); // Sort dates in descending order

    return RefreshIndicator(
      onRefresh: _loadOrderHistory,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: DrinkConstants.largeSpacing),
        itemCount: sortedDates.length,
        itemBuilder: (context, index) {
          final date = sortedDates[index];
          final orders = _groupedOrders[date]!;
          
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: DrinkConstants.spacing,
                  vertical: DrinkConstants.smallSpacing,
                ),
                margin: EdgeInsets.only(
                  top: index == 0 ? DrinkConstants.smallSpacing : DrinkConstants.spacing,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border(
                    left: BorderSide(
                      color: Color(int.parse(DrinkConstants.primaryColor.substring(1), radix: 16) + 0xFF000000),
                      width: 4,
                    ),
                  ),
                ),
                child: Text(
                  _formatDateHeader(date),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              
              // Orders for this date
              ...orders.map((order) => OrderListItem(
                order: order,
                onDelete: () => _deleteOrder(order),
              )),
            ],
          );
        },
      ),
    );
  }

  String _formatDateHeader(String dateString) {
    final date = DateTime.parse(dateString);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final orderDate = DateTime(date.year, date.month, date.day);

    if (orderDate == today) {
      return '今天 ($dateString)';
    } else if (orderDate == yesterday) {
      return '昨天 ($dateString)';
    } else {
      final weekdays = ['週日', '週一', '週二', '週三', '週四', '週五', '週六'];
      final weekday = weekdays[date.weekday % 7];
      return '$weekday ($dateString)';
    }
  }
}
