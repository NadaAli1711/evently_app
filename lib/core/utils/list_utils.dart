import 'package:easy_localization/easy_localization.dart';
import 'app_assets.dart';

class ListUtils {
  static final List<String> darkImagesList = [
    AppImages.sportDark,
    AppImages.birthdayDark,
    AppImages.meetingDark,
    AppImages.exhibitionDark,
    AppImages.bookClubDark,
  ];
  static final List<String> lightImagesList = [
    AppImages.sportLight,
    AppImages.birthdayLight,
    AppImages.meetingLight,
    AppImages.exhibitionLight,
    AppImages.bookClubLight,
  ];
  static List<String> getHomeCategoryList() {
    return ['all'.tr(), ...getDetailsCategoryList()];
  }

  static List<String> getDetailsCategoryList() {
    return [
      'sport'.tr(),
      'birthday'.tr(),
      'meeting'.tr(),
      'exhibition'.tr(),
      'book_club'.tr(),
    ];
  }

  static final List<String> itemIconsList = [
    AppImages.squars,
    AppImages.bike,
    AppImages.birthdayCake,
    AppImages.book,
    AppImages.book,
    AppImages.book,
  ];
  static final List<String> _baseIcons = [
    AppImages.bike,
    AppImages.birthdayCake,
    AppImages.book,
    AppImages.book,
    AppImages.book,
  ];

  static List<String> getHomeIcons() {
    return [AppImages.squars, ..._baseIcons];
  }

  static List<String> getDetailsIcons() {
    return _baseIcons;
  }
}
