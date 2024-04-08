part of '../web_screening_page.dart';

class VitalBoxesLoader extends StatelessWidget {
  const VitalBoxesLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        children: [
          Row(
            children: const [
              VitalBoxLoader(),
              SizedBox(width: 10),
              VitalBoxLoader(),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              VitalBoxLoader(),
              SizedBox(width: 10),
              VitalBoxLoader(),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              VitalBoxLoader(),
              SizedBox(width: 10),
              VitalBoxLoader(),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              VitalBoxLoader(),
              SizedBox(width: 10),
              VitalBoxLoader(),
            ],
          ),
        ],
      ),
    );
  }
}
