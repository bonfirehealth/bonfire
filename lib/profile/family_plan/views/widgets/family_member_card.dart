// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/gen/assets.gen.dart';
import 'package:bonfirehealth/profile/family_plan/blocs/add_family_member_cubit.dart';
import 'package:bonfirehealth/profile/family_plan/views/delete_family_member_page.dart';

class FamilyMemberCard extends StatelessWidget {
  const FamilyMemberCard({super.key, required this.user});

  final User user;

  String getAvatarPath(String? avatarName) {
    return avatarName == null ? Assets.images.avatars.avatar1.path : 'images/avatars/$avatarName';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColourConstant.greyF5F5F8),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 24,
            backgroundImage: AssetImage(getAvatarPath(user.avatar)),
          ),
          const SpacerHorizontal(12),
          Text(
            '${user.firstName?.toLowerCase().capitalizeFirstofEach} ${user.lastName?.toLowerCase().capitalizeFirstofEach}',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColourConstant.black1E1F2B,
                ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                if (user.uniqueLinkValue != null && user.emailAddress != null) {
                  final url = AddFamilyMemberCubit.getFamilyPlanUrl(user.uniqueLinkValue!, user.emailAddress!);
                  Share.share(url);
                }
              },
              icon: SvgPicture.asset(
                'images/external_link.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                context.router.push(DeleteFamilyMemberRoute(id: user.id));
              },
              icon: Icon(Icons.delete),
            ),
          )
        ],
      ),
    );
  }
}
