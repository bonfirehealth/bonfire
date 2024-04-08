part of '../profile_home_page.dart';

class ProfileHomeProfileView extends StatelessWidget {
  const ProfileHomeProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<ProfileHomeBloc>();
    return BlocBuilder<ProfileHomeBloc, ProfileHomeState>(
      builder: (_, state) {
        return Column(
          children: [
            Row(
              children: [
                const SpacerHorizontal(16),
                Stack(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: ClipOval(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: AppColourConstant.black1E1F2B,
                          child: AppImage.asset(
                            state.photoBase64 ?? ImageConstant.profileAvatar,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: InkWell(
                        onTap: () => showDialog<void>(
                          useSafeArea: false,
                          context: context,
                          builder: (BuildContext context) {
                            return PopupSingleMenuDialog(
                              onButtonPressed: () {
                                bloc.add(
                                  const ProfileHomeProfilePhotoSelect(),
                                );
                                FocusScope.of(context).unfocus();
                                Navigator.of(context).pop();
                              },
                              buttonText: l10n.selectPhoto,
                            );
                          },
                        ),
                        child: AppImage.asset(
                          ImageConstant.edit,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                if (state.user?.username != null) ...[
                  const SpacerHorizontal(16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.52,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          state.user?.username ?? '',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        AutoSizeText(
                          '@${AppConstant.emailDomainUrl}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ],
                const Expanded(child: SizedBox.shrink()),
                if (PlatformHelper.isMobile()) ...[
                  IconButton(
                    onPressed: () => bloc.add(ProfileHomeSignOut(context)),
                    icon: const Icon(Icons.logout_rounded),
                    color: AppColourConstant.whiteF8F8F8,
                  ),
                  const SpacerHorizontal(16),
                ],
              ],
            ),
            if (state.aggregateHourAssessmentsByOneDay == null || state.aggregateHourAssessmentsByOneDay!.isEmpty) ...[
              const SpacerVertical(8),
            ],
          ],
        );
      },
    );
  }
}
