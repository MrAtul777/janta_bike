import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const PageIndicator({
    Key? key,
    required this.currentPage,
    required this.pageCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
            (index) => _buildDot(index == currentPage),
      ),
    );
  }

  // Build individual dot indicator
  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      width: isActive ? 12.0 : 8.0, // Active dot is larger
      height: isActive ? 12.0 : 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? Colors.indigo.shade900
            : Colors.grey, // indigo.shade900 for active, grey for inactive
      ),
    );
  }
}
