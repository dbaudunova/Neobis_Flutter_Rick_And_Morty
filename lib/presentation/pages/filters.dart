import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_assets.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_colors.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_styles.dart';
import 'package:neobis_flutter_rick_and_morty/presentation/widgets/checkbox_list.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final List<Map> _statusList = [
    {'name': 'Живой', "isChecked": false},
    {'name': 'Мертвый', "isChecked": false},
    {'name': 'Неизвестно', "isChecked": false},
  ];

  final List<Map> _genderList = [
    {'name': 'Мужской', "isChecked": false},
    {'name': 'Женский', "isChecked": false},
    {'name': 'Бесполый', "isChecked": false},
  ];

  void _selectCheckbox(Map<dynamic, dynamic> list, bool? val) {
    setState(() {
      list['isChecked'] = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 52,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.searchBarBackground,
        title: Text(
          'Фильтры',
          style: Styles.filterText,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: Text(
                'Сортировать'.toUpperCase(),
                style: Styles.countAndResult,
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 16),
                Text(
                  'По алфавиту',
                  style: Styles.alphabetText,
                ),
                const Spacer(),
                SvgPicture.asset(AppAssets.sortAsc),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 24,
                  ),
                  child: SvgPicture.asset(AppAssets.sortDesc),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
              child: Divider(color: AppColors.searchBarBackground),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16,bottom: 24),
              child: Text(
                'Статус'.toUpperCase(),
                style: Styles.countAndResult,
              ),
            ),
            Column(
              children: _statusList.map((list) {
                return CheckboxList(
                  text: list['name'],
                  value: list['isChecked'],
                  onChanged: (bool? value) {
                    _selectCheckbox(list, value);
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
              child: Divider(color: AppColors.searchBarBackground),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16,bottom: 24),
              child: Text(
                'Пол'.toUpperCase(),
                style: Styles.countAndResult,
              ),
            ),
            Column(
              children: _genderList.map((list) {
                return CheckboxList(
                  text: list['name'],
                  value: list['isChecked'],
                  onChanged: (bool? value) {
                    _selectCheckbox(list, value);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
