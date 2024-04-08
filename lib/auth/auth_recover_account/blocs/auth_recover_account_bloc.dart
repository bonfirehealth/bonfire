// Flutter imports:
// ignore_for_file: use_build_context_synchronously

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

part 'auth_recover_account_event.dart';
part 'auth_recover_account_state.dart';

class AuthRecoverAccountBloc
    extends Bloc<AuthRecoverAccountEvent, AuthRecoverAccountState> {
  AuthRecoverAccountBloc() : super(const AuthRecoverAccountState()) {
    on<AuthRecoverAccountInitSet>(_onAuthRecoverAccountInitSet);
    on<AuthRecoverAccountIsLoadingSet>(_onAuthRecoverAccountIsLoadingSet);
    on<AuthRecoverAccountEmailAddressSet>(_onAuthRecoverAccountEmailAddressSet);
    on<AuthRecoverAccountRecoveryCodeSet>(_onAuthRecoverAccountRecoveryCodeSet);
    on<AuthRecoverAccountFormSubmit>(_onAuthRecoverAccountFormSubmit);
    on<AuthRecoverAccountPasswordSet>(_onAuthRecoverAccountPasswordSet);
    on<AuthRecoverAccountConfirmPasswordSet>(
      _onAuthRecoverAccountConfirmPasswordSet,
    );
    on<AuthRecoverAccountResetFormSubmit>(_onAuthRecoverAccountResetFormSubmit);
  }

  Future<void> _onAuthRecoverAccountInitSet(
    AuthRecoverAccountInitSet event,
    Emitter<AuthRecoverAccountState> emit,
  ) async {}

  void _onAuthRecoverAccountIsLoadingSet(
    AuthRecoverAccountIsLoadingSet event,
    Emitter<AuthRecoverAccountState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: event.isLoading,
      ),
    );
  }

  Future<void> _onAuthRecoverAccountEmailAddressSet(
    AuthRecoverAccountEmailAddressSet event,
    Emitter<AuthRecoverAccountState> emit,
  ) async {
    emit(state.copyWith(emailAddress: event.emailAddress));
  }

  Future<void> _onAuthRecoverAccountRecoveryCodeSet(
    AuthRecoverAccountRecoveryCodeSet event,
    Emitter<AuthRecoverAccountState> emit,
  ) async {
    emit(state.copyWith(recoveryCode: event.recoveryCode));
  }

  Future<void> _onAuthRecoverAccountFormSubmit(
    AuthRecoverAccountFormSubmit event,
    Emitter<AuthRecoverAccountState> emit,
  ) async {
    final context = event.context;
    final appBloc = context.read<AppBloc>();
    final l10n = context.l10n;
    final emailAddress = state.emailAddress;
    final recoveryCode = state.recoveryCode;

    if (emailAddress != null && recoveryCode != null) {
      context.read<AppBloc>().add(const AppIsLoadingSet());

      final recoveryCodeId =
          await AmplifyRepo.recoverAccount(emailAddress, recoveryCode);

      if (recoveryCodeId != null) {
        emit(state.copyWith(recoveryCodeId: recoveryCodeId));
        appBloc
          ..add(const AppIsLoadingSet(isLoading: false))
          ..add(
            AppNextRoute(
              context,
              const AuthResetPasswordRoute(),
            ),
          );
      } else {
        appBloc
          ..add(const AppIsLoadingSet(isLoading: false))
          ..add(
            AppErrorMessageSet(
              context,
              l10n.credentialsNotValidTitle,
              l10n.credentialsNotValidMessage,
            ),
          );
      }
      Future<void>.delayed(const Duration(milliseconds: 3000), () async {
        appBloc.add(const AppReset());
      });
    }
  }

  Future<void> _onAuthRecoverAccountPasswordSet(
    AuthRecoverAccountPasswordSet event,
    Emitter<AuthRecoverAccountState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onAuthRecoverAccountConfirmPasswordSet(
    AuthRecoverAccountConfirmPasswordSet event,
    Emitter<AuthRecoverAccountState> emit,
  ) async {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }

  Future<void> _onAuthRecoverAccountResetFormSubmit(
    AuthRecoverAccountResetFormSubmit event,
    Emitter<AuthRecoverAccountState> emit,
  ) async {
    final context = event.context;
    final appBloc = context.read<AppBloc>();
    final l10n = context.l10n;
    final emailAddress = state.emailAddress;
    final password = state.password;
    final confirmPassword = state.confirmPassword;
    final recoveryCode = state.recoveryCode;
    final recoveryCodeId = state.recoveryCodeId;
    if (emailAddress != null &&
        password != null &&
        confirmPassword != null &&
        recoveryCode != null &&
        recoveryCodeId != null) {
      appBloc.add(const AppIsLoadingSet());
      final isPasswordMatched =
          AuthHelper.isPasswordMatched(password, confirmPassword);
      final isPasswordRequirementMet =
          AuthHelper.isPasswordRequirementMet(password);

      if (isPasswordMatched && isPasswordRequirementMet) {
        final isPasswordReset = await AmplifyRepo.resetPassword(
          emailAddress,
          password,
          recoveryCode,
          recoveryCodeId,
        );
        emit(state.copyWith(isPasswordReset: isPasswordReset));

        if (isPasswordReset) {
          appBloc
            ..add(const AppIsLoadingSet(isLoading: false))
            ..add(
              AppInfoMessageSet(
                context,
                l10n.resetPasswordSuccessTitle,
                l10n.resetPasswordSuccessMessage,
              ),
            );
          Future<void>.delayed(const Duration(milliseconds: 3000), () async {
            appBloc
              ..add(const AppReset())
              ..add(
                AppNextRoute(
                  context,
                  const AuthSignInRoute(),
                ),
              );
          });
        } else {
          appBloc
            ..add(const AppIsLoadingSet(isLoading: false))
            ..add(
              AppErrorMessageSet(
                context,
                l10n.resetPasswordFailedTitle,
                l10n.resetPasswordFailedMessage,
              ),
            );
        }
      } else {
        var errorMessageTitle = l10n.passwordNotMatchedTitle;
        var errorMessage = l10n.passwordNotMatchedMessage;

        if (isPasswordMatched && !isPasswordRequirementMet) {
          errorMessageTitle = l10n.passwordNotMetRequirementTitle;
          errorMessage = l10n.passwordNotMetRequirementMessage;
        }
        appBloc
          ..add(const AppIsLoadingSet(isLoading: false))
          ..add(
            AppErrorMessageSet(
              context,
              errorMessageTitle,
              errorMessage,
            ),
          );
      }
    }
  }
}
