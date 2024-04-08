// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:file_picker/file_picker.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AWSS3StorageHelper {
  AWSS3StorageHelper._();

  static Future<List<GroupFile>> pickAndUploadGroupFiles() async {
    final newGroupFiles = <GroupFile>[];
    final result = await FilePicker.platform.pickFiles(
      withReadStream: true,
      allowMultiple: true,
      allowedExtensions: [
        'jpg',
        'png',
        'gif',
        'pdf',
        'docx',
        'doc',
        'txt',
        'xls',
        'xlsx',
        'ppt',
        'pptx',
      ],
    );

    if (result == null) {
      logInfo('No file selected');
      return newGroupFiles;
    }

    for (final platformFile in result.files) {
      try {
        final result = await Amplify.Storage.uploadFile(
          localFile: AWSFile.fromStream(
            platformFile.readStream!,
            size: platformFile.size,
          ),
          key: platformFile.name,
          options: const S3UploadFileOptions(
            accessLevel: StorageAccessLevel.private,
          ),
          onProgress: (progress) {
            logInfo('Fraction completed: ${progress.fractionCompleted}');
          },
        ).result;
        logInfo('Successfully uploaded file: ${result.uploadedItem.key}');
        final itemUrl = await getDownloadUrl(
          key: result.uploadedItem.key,
          accessLevel: StorageAccessLevel.private,
        );

        // ignore: cascade_invocations
        newGroupFiles.add(
          GroupFile(
            key: result.uploadedItem.key,
            isHidden: false,
            name: platformFile.name,
            url: itemUrl,
            user: User(id: CoreRepo.userId),
          ),
        );
      } on StorageException catch (e) {
        logInfo('Error uploading file: $e');
      }
    }
    return newGroupFiles;
  }

  static Future<List<GroupFile>> removeGroupFile(
    int index,
    String key,
    List<GroupFile>? newGroupFiles,
  ) async {
    try {
      final result = await Amplify.Storage.remove(
        key: key,
        options: const S3RemoveOptions(
          accessLevel: StorageAccessLevel.private,
        ),
      ).result;
      logInfo('Removed file: ${result.removedItem.key}');

      final updatedNewGroupFiles = newGroupFiles ?? <GroupFile>[];
      // ignore: cascade_invocations
      updatedNewGroupFiles.removeAt(index);
      return updatedNewGroupFiles;
    } on StorageException catch (e) {
      logInfo('Error deleting file: $e');
    }

    return <GroupFile>[];
  }

  static Future<List<QuestionFile>> pickAndUploadQuestionFiles() async {
    final newQuestionFiles = <QuestionFile>[];
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      withReadStream: true,
      allowMultiple: true,
      allowedExtensions: [
        'jpg',
        'png',
        'gif',
        'pdf',
        'docx',
        'doc',
        'txt',
        'xls',
        'xlsx',
        'ppt',
        'pptx',
      ],
    );

    if (result == null) {
      logInfo('No file selected');
      return newQuestionFiles;
    }

    for (final platformFile in result.files) {
      try {
        final result = await Amplify.Storage.uploadFile(
          localFile: AWSFile.fromStream(
            platformFile.readStream!,
            size: platformFile.size,
          ),
          key: platformFile.name,
          options: const S3UploadFileOptions(
            accessLevel: StorageAccessLevel.private,
          ),
          onProgress: (progress) {
            logInfo('Fraction completed: ${progress.fractionCompleted}');
          },
        ).result;
        logInfo('Successfully uploaded file: ${result.uploadedItem.key}');
        final itemUrl = await getDownloadUrl(
          key: result.uploadedItem.key,
          accessLevel: StorageAccessLevel.private,
        );
        newQuestionFiles.add(
          QuestionFile(
            key: result.uploadedItem.key,
            isHidden: false,
            name: platformFile.name,
            url: itemUrl,
            user: User(id: CoreRepo.userId),
          ),
        );
      } on StorageException catch (e) {
        logInfo('Error uploading file: $e');
      }
    }
    return newQuestionFiles;
  }

  static Future<List<QuestionFile>> removeQuestionFile(
    int index,
    String key,
    List<QuestionFile>? newQuestionFiles,
  ) async {
    try {
      final result = await Amplify.Storage.remove(
        key: key,
        options: const S3RemoveOptions(
          accessLevel: StorageAccessLevel.private,
        ),
      ).result;
      logInfo('Removed file: ${result.removedItem.key}');
      final updatedNewQuestionFiles = newQuestionFiles ?? <QuestionFile>[];
      // ignore: cascade_invocations
      updatedNewQuestionFiles.removeAt(index);
      return updatedNewQuestionFiles;
    } on StorageException catch (e) {
      logInfo('Error deleting file: $e');
    }
    return <QuestionFile>[];
  }

  static Future<List<AnswerFile>> pickAndUploadAnswerFiles() async {
    final newAnswerFiles = <AnswerFile>[];
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      withReadStream: true,
      allowMultiple: true,
      allowedExtensions: [
        'jpg',
        'png',
        'gif',
        'pdf',
        'docx',
        'doc',
        'txt',
        'xls',
        'xlsx',
        'ppt',
        'pptx',
      ],
    );

    if (result == null) {
      logInfo('No file selected');
      return newAnswerFiles;
    }

    for (final platformFile in result.files) {
      try {
        final result = await Amplify.Storage.uploadFile(
          localFile: AWSFile.fromStream(
            platformFile.readStream!,
            size: platformFile.size,
          ),
          key: platformFile.name,
          options: const S3UploadFileOptions(
            accessLevel: StorageAccessLevel.private,
          ),
          onProgress: (progress) {
            logInfo('Fraction completed: ${progress.fractionCompleted}');
          },
        ).result;
        logInfo('Successfully uploaded file: ${result.uploadedItem.key}');
        final itemUrl = await getDownloadUrl(
          key: result.uploadedItem.key,
          accessLevel: StorageAccessLevel.private,
        );
        newAnswerFiles.add(
          AnswerFile(
            key: result.uploadedItem.key,
            isHidden: false,
            name: platformFile.name,
            url: itemUrl,
            user: User(id: CoreRepo.userId),
          ),
        );
      } on StorageException catch (e) {
        logInfo('Error uploading file: $e');
      }
    }
    return newAnswerFiles;
  }

  static Future<List<AnswerFile>> removeAnswerFile(
    int index,
    String key,
    List<AnswerFile>? newAnswerFiles,
  ) async {
    try {
      final result = await Amplify.Storage.remove(
        key: key,
        options: const S3RemoveOptions(
          accessLevel: StorageAccessLevel.private,
        ),
      ).result;
      logInfo('Removed file: ${result.removedItem.key}');
      final updatedNewAnswerFiles = newAnswerFiles ?? <AnswerFile>[];
      // ignore: cascade_invocations
      updatedNewAnswerFiles.removeAt(index);
      return updatedNewAnswerFiles;
    } on StorageException catch (e) {
      logInfo('Error deleting file: $e');
    }
    return <AnswerFile>[];
  }

  static Future<List<CommentFile>> pickAndUploadCommentFiles() async {
    final newCommentFiles = <CommentFile>[];
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      withReadStream: true,
      allowMultiple: true,
      allowedExtensions: [
        'jpg',
        'png',
        'gif',
        'pdf',
        'docx',
        'doc',
        'txt',
        'xls',
        'xlsx',
        'ppt',
        'pptx',
      ],
    );

    if (result == null) {
      logInfo('No file selected');
      return newCommentFiles;
    }

    for (final platformFile in result.files) {
      try {
        final result = await Amplify.Storage.uploadFile(
          localFile: AWSFile.fromStream(
            platformFile.readStream!,
            size: platformFile.size,
          ),
          key: platformFile.name,
          options: const S3UploadFileOptions(
            accessLevel: StorageAccessLevel.private,
          ),
          onProgress: (progress) {
            logInfo('Fraction completed: ${progress.fractionCompleted}');
          },
        ).result;
        logInfo('Successfully uploaded file: ${result.uploadedItem.key}');
        final itemUrl = await getDownloadUrl(
          key: result.uploadedItem.key,
          accessLevel: StorageAccessLevel.private,
        );
        newCommentFiles.add(
          CommentFile(
            key: result.uploadedItem.key,
            isHidden: false,
            name: platformFile.name,
            url: itemUrl,
            user: User(id: CoreRepo.userId),
          ),
        );
      } on StorageException catch (e) {
        logInfo('Error uploading file: $e');
      }
    }
    return newCommentFiles;
  }

  static Future<List<CommentFile>> removeCommentFile(
    int index,
    String key,
    List<CommentFile>? newCommentFiles,
  ) async {
    try {
      final result = await Amplify.Storage.remove(
        key: key,
        options: const S3RemoveOptions(
          accessLevel: StorageAccessLevel.private,
        ),
      ).result;
      logInfo('Removed file: ${result.removedItem.key}');
      final updatedNewCommentFiles = newCommentFiles ?? <CommentFile>[];
      // ignore: cascade_invocations
      updatedNewCommentFiles.removeAt(index);
      return updatedNewCommentFiles;
    } on StorageException catch (e) {
      logInfo('Error deleting file: $e');
    }
    return <CommentFile>[];
  }

  static Future<String> getDownloadUrl({
    required String key,
    required StorageAccessLevel accessLevel,
  }) async {
    try {
      final result = await Amplify.Storage.getUrl(
        key: key,
        options: S3GetUrlOptions(
          accessLevel: accessLevel,
          checkObjectExistence: true,
          expiresIn: const Duration(days: 7),
        ),
      ).result;
      return result.url.toString();
    } on StorageException catch (e) {
      logInfo(e.message);
      rethrow;
    }
  }
}
