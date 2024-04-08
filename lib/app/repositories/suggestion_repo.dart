// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class SuggestionRepo {
  SuggestionRepo._();

  static Future<List<Suggestion>?> getAllSuggestions() async {
    logInfo('getAllSuggestions()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'suggestions',
      'listSuggestions',
      fromJson: Suggestion.fromJson,
    );
  }

  static Future<List<Suggestion>?> getAllSuggestionsByOrganisation(
    String organisationId,
  ) async {
    logInfo('getAllSuggestionsByOrganisation()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'suggestions_by_organisation',
      'listSuggestions',
      variables: <String, dynamic>{
        'organisationID': organisationId,
      },
      fromJson: Suggestion.fromJson,
    );
  }

  static Future<List<Suggestion>?> getAllSuggestionsByStressLevel({
    StressLevel stressLevel = StressLevel.normal,
    bool isHidden = false,
  }) async {
    logInfo('getAllSuggestionsByStressLevel()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'suggestions_by_stress_level',
      'listSuggestions',
      variables: <String, dynamic>{
        'stressLevel': stressLevel.name.capitalizeFirstofEach,
        'isHidden': isHidden,
      },
      fromJson: Suggestion.fromJson,
    );
  }

  static Future<List<Suggestion>?>
      getAllSuggestionsByOrganisationAndStressLevel({
    required String organisationId,
    StressLevel? stressLevel = StressLevel.normal,
    bool isHidden = false,
    String sortDirection = 'DESC',
  }) async {
    logInfo('getAllSuggestionsByOrganisationAndStressLevel()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'suggestions_by_organisation_and_stress_level',
      'listSuggestionsByIndex',
      variables: <String, dynamic>{
        'organisationID': organisationId,
        'stressLevel': stressLevel!.name.capitalizeFirstofEach,
        'isHidden': isHidden,
        'sortDirection': sortDirection,
      },
      fromJson: Suggestion.fromJson,
    );
  }

  static Future<Tuple2<Suggestion?, int?>?> getSuggestion(
    String suggestionId,
  ) async {
    logInfo('getSuggestion(): $suggestionId');
    await CoreRepo.init();
    return CoreRepo.getItem<Suggestion>(
      'suggestion',
      'getSuggestion',
      variables: <String, dynamic>{
        'suggestionID': suggestionId,
      },
      fromJson: Suggestion.fromJson,
    );
  }

  static Future<List<ProfileSuggestion>?>
      getAllProfileSuggestionsByProfile() async {
    logInfo('getAllProfileSuggestionsByProfile()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'profile_suggestions_by_profile',
      'listProfileSuggestions',
      variables: <String, dynamic>{
        'profileID': CoreRepo.profileId,
        'limit': 999999999,
      },
      fromJson: ProfileSuggestion.fromJson,
    );
  }

  static Future<Tuple2<ProfileSuggestion?, int?>?> getProfileSuggestion(
    String profileSuggestionId,
  ) async {
    logInfo('getProfileSuggestion(): $profileSuggestionId');
    await CoreRepo.init();
    return CoreRepo.getItem<ProfileSuggestion>(
      'profile_suggestion',
      'getProfileSuggestion',
      variables: <String, dynamic>{
        'profileSuggestionID': profileSuggestionId,
      },
      fromJson: ProfileSuggestion.fromJson,
    );
  }

  static Future<Tuple2<Suggestion?, int?>?> updateSuggestion({
    String? suggestionId,
    int? numberOfClicks,
    int? numberOfViews,
    int? version = 1,
  }) async {
    logInfo('updateSuggestion()');
    await CoreRepo.init();
    return CoreRepo.updateItem<Suggestion>(
      'suggestion_update',
      'updateSuggestion',
      variables: <String, dynamic>{
        'input': {
          'id': suggestionId,
          'numberOfClicks': numberOfClicks,
          'numberOfViews': numberOfViews,
          '_version': version,
        },
      },
      fromJson: Suggestion.fromJson,
    );
  }
}
