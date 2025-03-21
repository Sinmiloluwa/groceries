class BottomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFFF2F7F2)
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(0, 20) // Start from left with some padding
      ..lineTo(0, size.height) // Left bottom corner
      ..lineTo(size.width, size.height) // Right bottom corner
      ..lineTo(size.width, 20) // Right side with same padding as left

      ..lineTo(size.width / 2 + 30, 20) // Right side of the dent
      ..quadraticBezierTo(size.width / 2, 0, size.width / 2 - 30, 20) // Curved dent

      ..close();

    canvas.drawShadow(path, Colors.black.withOpacity(0.2), 8, false);
    // Draw the path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariantType oldDelegate) {
    return false;
  }
}