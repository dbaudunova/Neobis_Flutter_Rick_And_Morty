import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_colors.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_styles.dart';

class CheckboxList extends StatelessWidget {
  const CheckboxList({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  final String text;
  final bool value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        checkColor: Colors.black,
        activeColor: AppColors.episode,
        value: value,
        title: Text(
          text,
          style: AppStyles.searchBar.copyWith(color: Colors.white),
        ),
        onChanged: onChanged);
  }
}
