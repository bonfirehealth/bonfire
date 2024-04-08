part of '../web_screening_page.dart';

class WebScreeningFloatingActionButton extends StatelessWidget {
  const WebScreeningFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WebScreeningBloc>();
    return BlocBuilder<WebScreeningBloc, WebScreeningState>(
      builder: (context, state) {
        if (!state.isBrowserSupported ||
            state.cameraPermissionStatus == PermissionStatus.denied ||
            state.screeningStatus != ScreeningStatus.setup) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.all(80),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () => bloc.add(WebScreeningStart(context)),
            elevation: 12,
            foregroundColor: AppColourConstant.black1E1F2B,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(Icons.qr_code_scanner_outlined),
          ),
        );
      },
    );
  }
}
