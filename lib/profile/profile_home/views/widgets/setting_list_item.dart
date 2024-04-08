part of '../profile_home_page.dart';

class SettingListItem extends StatelessWidget {
  const SettingListItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    this.markAsNew = false,
  });

  final String icon;
  final String title;
  final bool markAsNew;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 18),
            width: MediaQuery.of(context).size.width - (20 * 2),
            decoration: BoxDecoration(
              border: Border.all(color: AppColourConstant.whiteEFF3FB),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: GestureDetector(
              onTap: onPressed,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 13),
                    width: 26,
                    height: 26,
                    child: Image.asset(
                      icon,
                      width: 26,
                      height: 26,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColourConstant.grey50535A,
                          ),
                    ),
                  ),
                  if (markAsNew)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      width: 70,
                      height: 22,
                      alignment: Alignment.center,
                      decoration:
                          BoxDecoration(color: AppColourConstant.redFF5034, borderRadius: BorderRadius.circular(26)),
                      child: Text(
                        context.l10n.newText.allInCaps,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColourConstant.whiteFFFFFF,
                            ),
                      ),
                    ),
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: 24,
                    height: 24,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColourConstant.grey50535A.withOpacity(0.6),
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
