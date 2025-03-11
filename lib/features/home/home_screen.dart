import 'package:flutter/material.dart';
import 'package:flutterflow_task/config/theming/theming.dart';
import 'package:flutterflow_task/core/extensions/context.dart';
import 'package:flutterflow_task/core/resources/assets.dart';
import 'package:flutterflow_task/features/general_widgets/main_button.dart';
import 'package:flutterflow_task/features/general_widgets/spacing.dart';
import 'package:flutterflow_task/features/user_info_form/view/user_info_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.assetsPngHome),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black26,
              BlendMode.darken,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: AppConsts.defaultPadding,
            child: Column(
              children: [
                Text(
                  'Balanced Meal',
                  style: TStyle.whiteBold(40),
                ),
                HorizontalSpacing(double.infinity),
                Spacer(),
                Text(
                  'Craft your ideal meal effortlessly with our app. Select nutritious ingredients tailored to your taste and well-being.',
                  style: TStyle.whiteSemi(22),
                  textAlign: TextAlign.center,
                ),
                VerticalSpacing(24),
                MainButton(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  text: 'Order Food',
                  ontap: () {
                    context.myPush(const UserInfoForm());
                  }
                  ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
