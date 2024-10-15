import 'package:flutter/material.dart';

/// A custom table widget that optimizes layout for expandable items.
/// It pre-calculates the maximum number of columns to fit content
/// without layout shifts during item expansion.
class CustomTable extends StatelessWidget {
  const CustomTable({
    super.key,
    required this.children,
    required this.defaultItemWidth,
    required this.expandedItemWidth,
    this.spacing = 8.0,
  });

  final List<Widget> children;
  final double defaultItemWidth;
  final double expandedItemWidth;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxColumns = _calculateMaxColumns(screenWidth);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _buildRows(maxColumns),
      ),
    );
  }

  int _calculateMaxColumns(double screenWidth) {
    final availableWidth = screenWidth - spacing;
    final columnsWithExpandedWidth =
        (availableWidth / (expandedItemWidth + spacing)).floor();
    return columnsWithExpandedWidth > 0 ? columnsWithExpandedWidth : 1;
  }

  List<Widget> _buildRows(int maxColumns) {
    final List<Widget> rows = [];
    for (int i = 0; i < children.length; i += maxColumns) {
      final rowChildren = children.sublist(i, (i + maxColumns).clamp(0, children.length));
      rows.add(
        Padding(
          padding: EdgeInsets.only(bottom: spacing),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: rowChildren
                .map((child) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: spacing / 2),
                      child: child,
                    ))
                .toList(),
          ),
        ),
      );
    }
    return rows;
  }
}
