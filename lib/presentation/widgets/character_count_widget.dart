import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_colors.dart';

class CharacterCountStyle extends StatelessWidget {
  const CharacterCountStyle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            shadows: const [
              Shadow(
                blurRadius: 4.0,
                color: Colors.black,
                offset: Offset(0.0, 5.0),
              ),
            ],
            fontSize: 16,
            letterSpacing: 1.5,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 4
              ..color = Colors.black,
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            letterSpacing: 1.5,
            color: AppColors.appTextColor,
          ),
        ),
      ],
    );
  }
}