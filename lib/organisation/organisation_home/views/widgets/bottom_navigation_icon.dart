part of '../organisation_home_page.dart';

class BottomNavigationIcon extends StatelessWidget {
  const BottomNavigationIcon({
    super.key,
    required this.color,
    required this.imageAsset,
    required this.unread,
  });

  final Color color;
  final String imageAsset;
  final bool unread;

  @override
  Widget build(BuildContext context) {
    return unread == true
        ? Stack(
            children: [
              Align(
                child: Container(
                  margin: const EdgeInsets.all(6),
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  child: imageAsset.contains('https')
                      ? CachedNetworkImage(
                          imageUrl: imageAsset,
                          fit: BoxFit.cover,
                          width: 38,
                          height: 38,
                          color: color,
                        )
                      : AppImage.asset(imageAsset, color: color),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 2, left: 12),
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '+1',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              )
            ],
          )
        : Container(
            margin: const EdgeInsets.all(5),
            height: 30,
            width: 30,
            alignment: Alignment.center,
            child: imageAsset.contains('https')
                ? CachedNetworkImage(
                    imageUrl: imageAsset,
                    fit: BoxFit.cover,
                    width: 38,
                    height: 38,
                    color: color,
                  )
                : AppImage.asset(imageAsset, color: color),
          );
  }
}
