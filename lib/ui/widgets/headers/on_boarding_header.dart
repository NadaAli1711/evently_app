import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_assets.dart';
import '../../../l10n/app_localizations.dart';
import '../../../providers/theme_provider.dart';
import '../buttons/custom_icon_button.dart';
import '../containers/tapped_container.dart';

class OnBoardingHeader extends StatelessWidget {
  final int currentPage;
  final VoidCallback onIntroEnd;
  final introKey;
  const OnBoardingHeader({super.key,required this.currentPage,required this.onIntroEnd,required this.introKey});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return  Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        currentPage != 0
            ? CustomIconButton(onPressed: _toPreviousPage,)
            : const SizedBox(width: 48),
        Image.asset(
          themeProvider.isDark
              ? AppImages.eventlyDarkLogo
              : AppImages.eventlyLogo,
          fit: .fill,
        ),
        TappedContainer(
          onTap: onIntroEnd,
          text: AppLocalizations.of(context)!.skip,
          hasIcon: false,
        ),
      ],
    );
  }
  void _toPreviousPage() {
    introKey.currentState?.controller.previousPage(
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }
}
