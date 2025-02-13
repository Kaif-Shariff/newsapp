import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  final double width;
  final double height;
  final String message;

  const MyErrorWidget({
    super.key,
    required this.width,
    required this.height,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
          child: Container(
        width: width / 1.1,
        height: height / 3.2,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(
            20,
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/exhausted.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.6),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 180,
              left: width / 4,
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
