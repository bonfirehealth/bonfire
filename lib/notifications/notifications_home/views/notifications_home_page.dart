// Flutter imports:
import 'package:flutter/material.dart' hide Notification;

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/notifications/notifications.dart';

part 'widgets/action_button.dart';
part 'widgets/notification_list_item.dart';

class NotificationsHomePage extends StatelessWidget {
  const NotificationsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: NotificationsHomeBody(),
      ),
    );
  }
}

class NotificationsHomeBody extends StatelessWidget {
  const NotificationsHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final appBloc = context.read<AppBloc>();

    return BlocSelector<NotificationsHomeBloc, NotificationsHomeState,
        List<Notification>>(
      selector: (state) => state.notifications ?? [],
      builder: (_, notifications) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: notifications.length,
          itemBuilder: (BuildContext context, int index) {
            final notification = notifications[index];

            return Column(
              children: [
                NotificationListItem(
                  onSelected: (Notification? notification) {
                    appBloc.add(
                      AppNextRoutePath(
                        context,
                        '',
                        notification!.routePath!,
                        '',
                      ),
                    );
                  },
                  onActionPressed: () {},
                  notification: notification,
                ),
                if (notifications.length - 1 == index) ...[
                  const SpacerVertical(72),
                ],
              ],
            );
          },
        );
      },
    );
  }
}
