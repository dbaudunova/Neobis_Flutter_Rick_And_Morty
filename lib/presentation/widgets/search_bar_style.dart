import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_assets.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_colors.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_styles.dart';

class SearchBarStyle extends StatelessWidget {
  const SearchBarStyle({
    super.key,
    required this.hint,
    required this.trailing,
    required this.onChanged,
  });

  final String hint;
  final List<Widget> trailing;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onChanged: onChanged,
      textStyle: MaterialStateTextStyle.resolveWith(
        (states) => const TextStyle(color: Colors.white, fontSize: 16),
      ),
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateColor.resolveWith(
        (states) => AppColors.searchBarBackground,
      ),
      hintText: hint,
      hintStyle: MaterialStateTextStyle.resolveWith(
        (states) => AppStyles.searchBar,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
        child: SvgPicture.asset(AppAssets.search),
      ),
      trailing: trailing,
    );
  }
}
