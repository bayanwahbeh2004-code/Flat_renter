import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';

class BottomNativigation extends StatelessWidget {
  const BottomNativigation({
    super.key,
    required this.onItemTap,
    required this.selectbottom,
  });
  final Function(int index) onItemTap;
  final int selectbottom;
  @override
  Widget build(BuildContext context) {
    final Color selscted = KPurple;
    final Color notselscted = ktextColor;
    return BottomAppBar(
      elevation: 0,
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: ktextColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildItem(
              context,
              Icons.home,
              'Home',
              0,
              selscted,
              notselscted,
              selectbottom,
            ),
            _buildItem(
              context,
              Icons.calendar_month,
              'Bookings',
              1,
              selscted,
              notselscted,
              selectbottom,
            ),
            _buildItem(
              context,
              Icons.house_outlined,
              'Your estate',
              2,
              selscted,
              notselscted,
              selectbottom,
            ),
            _buildItem(
              context,
              Icons.chat_bubble_outline,
              'Chats',
              3,
              selscted,
              notselscted,
              selectbottom,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    IconData icon,
    String label,
    int number,
    Color selected,
    Color notselected,
    int SelectedIndexNow,
  ) {
    final bool select = number == SelectedIndexNow;
    final Color itemColor = select ? selected : notselected;
    return GestureDetector(
      onTap: () => onItemTap(number),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: select ? selected : notselected, size: 24),
          Text(
            label,
            style: TextStyle(
              color: select ? selected : notselected,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
