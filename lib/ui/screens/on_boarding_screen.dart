import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_context.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../core/utils/app_assets.dart';
import '../widgets/custom_rows/on_boarding_header.dart';
import '../widgets/introduction_body.dart';
import 'main_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int currentPage = 0;

  void onIntroEnd() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const MainScreen()));
  }

  void _toNextPage() {
    introKey.currentState?.controller.nextPage(
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {

    return IntroductionScreen(
      key: introKey,
      isProgress: false,
      showBottomPart: false,

      onChange: (index) {
        setState(() {
          currentPage = index;
        });
      },
      globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,

      globalHeader: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width*0.03),
          child: OnBoardingHeader(currentPage: currentPage,onIntroEnd: onIntroEnd,introKey: introKey,),
        ),
      ),

      pages: [
        buildPageViewModel(
          body: IntroductionBody(
            currentIndex: currentPage,
            buttonText: 'next'.tr(),
            firstText: 'find_events_that_inspire_you'.tr(),
            secondText: 'dive_into_a_world_of_events_crafted_to_fit_your_unique_interests_whether_youre_into_live_music_art_workshops_professional_networking_or_simply_discovering_new_experiences_we_have_something_for_everyone_our_curated_recommendations_will_help_you_explore_connect_and_make_the_most_of_every_opportunity_around_you'.tr(),
            darkAssetName: AppImages.hotTrendingDark,
            lightAssetName: AppImages.hotTrending,
            onPressed: _toNextPage,
          ),
        ),
        buildPageViewModel(
          body: IntroductionBody(
            currentIndex: currentPage,
            buttonText: 'next'.tr(),
            firstText: 'effortless_event_planning'.tr(),
            secondText: 'take_the_hassle_out_of_organizing_events_with_our_all_in_one_planning_tools_from_setting_up_invites_and_managing_rsvps_to_scheduling_reminders_and_coordinating_details_we_ve_got_you_covered_plan_with_ease_and_focus_on_what_matters_creating_an_unforgettable_experience_for_you_and_your_guests'.tr(),
            darkAssetName: AppImages.managerDeskDark,
            lightAssetName: AppImages.managerDesk,
            onPressed: _toNextPage,
          ),
        ),
        buildPageViewModel(
          body: IntroductionBody(
            currentIndex: currentPage,
            buttonText: 'get_started'.tr(),
            firstText: 'connect_with_friends_share_moments'.tr(),
            secondText: 'make_every_event_memorable_by_sharing_the_experience_with_others_our_platform_lets_you_invite_friends_keep_everyone_in_the_loop_and_celebrate_moments_together_capture_and_share_the_excitement_with_your_network_so_you_can_relive_the_highlights_and_cherish_the_memories'.tr(),
            darkAssetName: AppImages.socialMediaDark,
            lightAssetName: AppImages.socialMedia,
            onPressed: onIntroEnd,
          ),
        ),
      ],
      showNextButton: false,
      showBackButton: false,
      showDoneButton: false,


    );
  }

  PageViewModel buildPageViewModel({required Widget body}) {
    return PageViewModel(
      title: "",
      bodyWidget: body,


      decoration: PageDecoration(
        bodyPadding: EdgeInsets.only(top: context.height * 0.02,bottom: 0,),
      ),
    );
  }
}
