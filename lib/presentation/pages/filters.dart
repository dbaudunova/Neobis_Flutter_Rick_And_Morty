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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 52,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.searchBarBackground,
        actions: [
          if (_anyCheckboxSelected) _buildIconButton(),
        ],
        title: Text(
          'Фильтры',
          style: AppStyles.filterText,
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
                style: AppStyles.countAndResult,
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 16),
                Text(
                  'По алфавиту',
                  style: AppStyles.searchBar.copyWith(
                    color: Colors.white,
                  ),
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
              padding: const EdgeInsets.only(left: 16, bottom: 24),
              child: Text(
                'Статус'.toUpperCase(),
                style: AppStyles.countAndResult,
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
              padding: const EdgeInsets.only(left: 16, bottom: 24),
              child: Text(
                'Пол'.toUpperCase(),
                style: AppStyles.countAndResult,
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

  IconButton _buildIconButton() {
    return IconButton(
      onPressed: () {
        _clearFilters();
      },
      icon: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: SvgPicture.asset(
          AppAssets.deleteFilter,
        ),
      ),
    );
  }

  bool get _anyCheckboxSelected {
    List<Map> allLists = [..._statusList, ..._genderList];
    return allLists.any((element) => element['isChecked']);
  }

  void _selectCheckbox(Map list, bool? val) {
    setState(() {
      list['isChecked'] = val;
    });
  }

  void _clearFilters() {
    setState(() {
      for (var element in _statusList) {
        element['isChecked'] = false;
      }

      for (var element in _genderList) {
        element['isChecked'] = false;
      }
    });
  }
}
