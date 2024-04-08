part of '../generated_credentials_page.dart';

class GeneratedCredentialsSkipButton extends StatelessWidget {
  const GeneratedCredentialsSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<GenerateUsernameBloc>();

    return BlocBuilder<GenerateUsernameBloc, GenerateUsernameState>(
      builder: (_, state) {
        return Column(
          children: [
            const SpacerVertical(32),
            TextButton(
              onPressed: state.username != '' && state.username != null
                  ? () {
                      showDialog<void>(
                        useSafeArea: false,
                        context: context,
                        builder: (BuildContext context) {
                          return PopupConfirmDialog(
                            title: l10n.skipGeneratedCredentialsTitle,
                            description:
                                l10n.skipGeneratedCredentialsDescription,
                            onNoPressed: () {
                              FocusScope.of(context).unfocus();
                              Navigator.of(context).pop();
                            },
                            onYesPressed: () {
                              bloc.add(
                                GenerateUsernameAutoSignIn(context),
                              );
                            },
                          );
                        },
                      );
                    }
                  : null,
              child: Text(
                l10n.skip,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ),
          ],
        );
      },
    );
  }
}
