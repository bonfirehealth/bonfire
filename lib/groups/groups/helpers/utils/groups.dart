part of '../groups_helper.dart';

void _generateGroupOnReportedPopupDialog(
  BuildContext context,
  GroupsBloc bloc,
  Group group,
) {
  final l10n = context.l10n;
  showDialog<void>(
    useSafeArea: false,
    context: context,
    builder: (BuildContext context) {
      return PopupForm(
        onTitleTextChanged: (String value) {},
        onDescriptionTextChanged: (String value) {},
        onSubmit: (
          String title,
          String description,
        ) {
          bloc.add(GroupsUserReport(group.suggester!.id, title, description));
          Navigator.of(context).pop();
          showDialog<void>(
            useSafeArea: false,
            context: context,
            builder: (BuildContext context) {
              return PopupTextDialog(
                onButtonPressed: () {
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                buttonText: l10n.ok,
                title: l10n.confirmReportGroupTitle,
                subtitle1: l10n.confirmReportGroupSubtitle,
                subtitle2: '',
                subtitle3: '',
              );
            },
          );
        },
        header: l10n.reportGroup,
        submitText: l10n.send,
      );
    },
  );
  showDialog<void>(
    useSafeArea: false,
    context: context,
    builder: (BuildContext context) {
      return const SizedBox.shrink();
    },
  );
}
