import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_colors.dart';
import 'package:neobis_flutter_rick_and_morty/data/remote/models/character.dart';


class StackImage extends StatelessWidget {
  const StackImage({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 218,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              AppColors.appColor.withOpacity(0.65),
              BlendMode.srcATop,
            ),
            child: Image.network(
              character.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            color: Colors.transparent,
          ),
        ),
        Positioned(
          bottom: -100,
          child: CircleAvatar(
            radius: 98,
            backgroundColor: AppColors.appColor,
            child:  CircleAvatar(
              backgroundImage: NetworkImage(
                  character.image),
              radius: 90,
            ),
          ),
        ),
      ],
    );
  }
}
