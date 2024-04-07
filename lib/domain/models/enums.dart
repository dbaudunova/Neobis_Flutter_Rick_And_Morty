import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/config/constants/app_colors.dart';

enum Status { dead, alive, unknown }

Status statusString(String? statusString) {
  if (statusString == 'Dead') {
    return Status.dead;
  } else if (statusString == 'Alive') {
    return Status.alive;
  } else {
    return Status.unknown;
  }
}

Color statusColor(Status status) {
  switch (status) {
    case Status.dead:
      return AppColors.statusDead;
    case Status.alive:
      return AppColors.statusAlive;
    case Status.unknown:
      return AppColors.episode;
  }
}
