// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gender_selection/gender_selection.dart';
import 'package:weight_slider/weight_slider.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/app/widgets/footer_view_wrapper.dart';
import 'package:bonfirehealth/onboarding/onboarding.dart';

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage({super.key, this.profile, this.isEdit = false});

  final Profile? profile;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompleteProfileBloc>(
      create: (_) => CompleteProfileBloc()..add(CompleteProfileInitSet(profile: profile)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: CompleteProfileBody(profile: profile, isEdit: isEdit),
        ),
      ),
    );
  }
}

class CompleteProfileBody extends StatefulWidget {
  const CompleteProfileBody({super.key, this.profile, required this.isEdit});

  final Profile? profile;
  final bool isEdit;

  @override
  State<CompleteProfileBody> createState() => _CompleteProfileBodyState();
}

class _CompleteProfileBodyState extends State<CompleteProfileBody> with AfterLayoutMixin<CompleteProfileBody> {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    context.read<AppBloc>().add(const AppIsLoadingSet(isLoading: false));
  }

  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<CompleteProfileBloc>();

    return BlocBuilder<CompleteProfileBloc, CompleteProfileState>(
      builder: (_, state) {
        if (state.isLoading) {
          return Center(
            child: SpinKitCircle(
              color: Theme.of(context).primaryColor,
            ),
          );
        }

        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: FooterViewWrapper(
            footer: RoundedButton(
              onPressed: () => bloc.add(
                CompleteProfileFormSubmit(
                  context,
                  isEdit: widget.isEdit,
                ),
              ),
              title: l10n.submit,
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: Column(
              children: [
                const SpacerVertical(48),
                Text(
                  l10n.completeProfileTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SpacerVertical(38),
                GenderSelection(
                  onChanged: (Gender? gender) {
                    logInfo(gender!.name);
                    bloc.add(CompleteProfileGenderSet(gender.name));
                  },
                  maleImage: const AssetImage(ImageConstant.male),
                  maleText: l10n.male,
                  femaleImage: const AssetImage(ImageConstant.female),
                  femaleText: l10n.female,
                  linearGradient: const LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                    ],
                  ),
                  unSelectedGenderTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  selectedGenderIconBackgroundColor: Theme.of(context).primaryColor,
                  selectedGenderTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                  checkIconAlignment: Alignment.bottomRight,
                  selectedGenderCheckIcon: FontAwesomeIcons.check,
                  selectedGender: getGender(state.gender),
                  animationDuration: const Duration(milliseconds: 400),
                  padding: const EdgeInsets.all(3),
                  size: 80,
                ),
                const SpacerVertical(32),
                Text(
                  l10n.age,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColourConstant.black1E1F2B,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                WeightSlider(
                  onChange: (value) => bloc.add(CompleteProfileAgeSet(value)),
                  weight: state.age,
                  minWeight: 12,
                  unit: '',
                  height: 45,
                ),
                const SpacerVertical(32),
                Text(
                  l10n.height,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColourConstant.black1E1F2B,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                WeightSlider(
                  weight: state.height,
                  minWeight: 130,
                  maxWeight: 200,
                  onChange: (value) => bloc.add(CompleteProfileHeightSet(value)),
                  unit: state.heightUnit,
                  height: 45,
                ),
                const SpacerVertical(32),
                Text(
                  l10n.weight,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColourConstant.black1E1F2B,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                WeightSlider(
                  weight: state.weight,
                  minWeight: 25,
                  maxWeight: 150,
                  onChange: (value) => bloc.add(CompleteProfileWeightSet(value)),
                  unit: state.weightUnit,
                  height: 45,
                ),
                const SpacerVertical(32),
              ],
            ),
          ),
        );
      },
    );
  }
}
