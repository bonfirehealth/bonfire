// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:bonfirehealth/global.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:auto_route/src/route/page_route_info.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/app/widgets/footer_view_wrapper.dart';
import 'package:bonfirehealth/profile/profile.dart';
import 'package:bonfirehealth/screening/screening.dart';

// part 'widgets/latest_vital_boxes.dart';
part 'widgets/latest_vital_boxes_loader.dart';
part 'widgets/latest_vital_box_loader.dart';
part 'widgets/latest_vital_boxes.dart';
part 'widgets/latest_vital_box.dart';
part 'widgets/latest_vital_popup_dialog.dart';

class LatestVitalsPage extends StatelessWidget {
  const LatestVitalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LatestVitalsBloc>(
      create: (BuildContext context) => LatestVitalsBloc(),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: LatestVitalsPageBody(),
        ),
      ),
    );
  }
}

class LatestVitalsPageBody extends StatefulWidget {
  const LatestVitalsPageBody({super.key});

  @override
  State<LatestVitalsPageBody> createState() => _LatestVitalsPageBodyState();
}

class _LatestVitalsPageBodyState extends State<LatestVitalsPageBody> with AfterLayoutMixin<LatestVitalsPageBody> {
  @override
  void afterFirstLayout(BuildContext context) {
    context.read<LatestVitalsBloc>().add(LatestVitalsInitSet(context));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Container(
            height: 50,
            color: AppColourConstant.greyE6EFFF,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_outlined),
                      onPressed: () {
                        context.router.push(const HomeRoute());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: AppColourConstant.greyE6EFFF,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      child: ColoredBox(
                        color: Colors.white,
                        child: Image.asset(
                          ImageConstant.vitruvianMan,
                          fit: BoxFit.contain,
                          alignment: Alignment.topLeft, // Căn lề ảnh sát bên trái
                        ),
                      ),
                    ),
                  ),

                  // LatestVitalBoxes section
                  BlocBuilder<LatestVitalsBloc, LatestVitalsState>(
                    builder: (_, state) {
                      if (state.assessment == null) {
                        return const SizedBox(
                          width: double.infinity,
                          child: LatestVitalBoxesLoader(),
                        );
                      }

                      return SizedBox(
                        width: double.infinity,
                        child: LatestVitalBoxes(
                          assessment: state.assessment,
                        ),
                      );
                    },
                  ),
                  // LatestVitalBoxes section end
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
