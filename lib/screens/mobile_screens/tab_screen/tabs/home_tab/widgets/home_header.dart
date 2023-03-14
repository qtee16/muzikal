import 'package:flutter/material.dart';
import 'package:music_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../../../view_models/user_view_model.dart';
import '../../../../../../widgets/cached_image_widget.dart';
import '../../../../profile_screen/profile_screen.dart';
import '../../../../sign_in_screen/sign_in_screen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (context, model, child) {
        var currUser = model.currentUser;
        print(currUser?.imageURL);
        bool isNullUser = currUser == null;
        bool isNullImage = currUser == null ||
            currUser.imageURL == null ||
            currUser.imageURL!.isEmpty;

        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            model.currentUser != null ? "Welcome back!" : "Welcome to Muzikal!",
            style: const TextStyle(
                color: AppColor.onPrimaryColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                height: 32.0 / 24.0),
          ),
          subtitle: Text(
            "What do you feel like today?",
            style: TextStyle(
                color: AppColor.onPrimaryColor.withOpacity(0.6),
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                height: 19.0 / 14.0),
          ),
        );
      },
    );
  }
}
