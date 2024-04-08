part of '../notifications_home_page.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({
    super.key,
    required this.notification,
    this.onSelected,
    this.onActionPressed,
  });

  final Notification notification;

  final void Function(Notification)? onSelected;
  final void Function()? onActionPressed;

  @override
  Widget build(BuildContext context) {
    final appBloc = context.read<AppBloc>();
    return TextButton(
      onPressed: () => onSelected!(notification),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              alignment: Alignment.topCenter,
              width: 38,
              height: 38,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(38.0 / 2)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(38.0 / 2)),
                child: AppImage.asset(
                  notification.imageURL ?? ImageConstant.profileAvatar,
                  width: 38,
                  height: 38,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          notification.name!,
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppColourConstant.grey50535A),
                        ),
                      ),
                    ),
                    Text(
                      timeago
                          .format(notification.createdAt!.getDateTimeInUtc()),
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColourConstant.blue8DA2CD),
                    ),
                  ],
                ),
                const SpacerVertical(4),
                Row(
                  children: [
                    Text(
                      notification.description ?? '',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SpacerVertical(8),
                if (notification.clickAction != null) ...[
                  Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      ActionButton(
                        onPressed: () {
                          if (notification.routePath != null) {
                            appBloc.add(
                              AppNextRoutePath(
                                context,
                                '',
                                notification.routePath!,
                                '',
                              ),
                            );
                          } else {}
                        },
                        isCompleted: notification.isProcessing ?? false,
                        title: notification.name,
                      )
                    ],
                  ),
                  const SpacerVertical(8),
                ],
                Container(
                  height: 1,
                  color: AppColourConstant.whiteEFF3FB,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
