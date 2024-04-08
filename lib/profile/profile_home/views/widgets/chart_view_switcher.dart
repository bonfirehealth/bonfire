part of '../profile_home_page.dart';

class ChartViewSwitcher extends StatefulWidget {
  const ChartViewSwitcher({super.key});

  @override
  State<ChartViewSwitcher> createState() => _ChartViewSwitcherState();
}

class _ChartViewSwitcherState extends State<ChartViewSwitcher> with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<ProfileHomeBloc>();
    return BlocBuilder<ProfileHomeBloc, ProfileHomeState>(
      builder: (_, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: TabBar(
                controller: _controller,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                tabs: [
                  Text(l10n.day),
                  Text(l10n.week),
                  Text(l10n.month),
                  Text(l10n.year),
                ],
                labelColor: AppColourConstant.black1E1F2B,
                labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                unselectedLabelColor: AppColourConstant.black1E1F2B,
                unselectedLabelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(color: AppColourConstant.black1E1F2B, width: 2),
                  insets: EdgeInsets.only(top: 4),
                ),
                onTap: (index) {
                  if (index == 0) {
                    bloc.add(const ProfileHomeAggregateTypeSet());
                  } else if (index == 1) {
                    bloc.add(const ProfileHomeAggregateTypeSet(aggregateType: AggregateType.week));
                  } else if (index == 2) {
                    bloc.add(const ProfileHomeAggregateTypeSet(aggregateType: AggregateType.month));
                  } else if (index == 3) {
                    bloc.add(const ProfileHomeAggregateTypeSet(aggregateType: AggregateType.year));
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
