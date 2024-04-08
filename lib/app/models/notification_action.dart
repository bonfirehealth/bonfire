/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

// Package imports:
import 'package:amplify_core/amplify_core.dart' as amplify_core;

// Project imports:
import 'model_provider.dart';

/** This is an auto generated class representing the NotificationAction type in your schema. */
class NotificationAction extends amplify_core.Model {
  static const classType = const _NotificationActionModelType();
  final String id;
  final String? _action;
  final String? _description;
  final String? _name;
  final String? _identifier;
  final bool? _isCompleted;
  final String? _routePath;
  final String? _url;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get action {
    return _action;
  }
  
  String? get description {
    return _description;
  }
  
  String? get name {
    return _name;
  }
  
  String? get identifier {
    return _identifier;
  }
  
  bool? get isCompleted {
    return _isCompleted;
  }
  
  String? get routePath {
    return _routePath;
  }
  
  String? get url {
    return _url;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const NotificationAction._internal({required this.id, action, description, name, identifier, isCompleted, routePath, url, createdAt, updatedAt}): _action = action, _description = description, _name = name, _identifier = identifier, _isCompleted = isCompleted, _routePath = routePath, _url = url, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory NotificationAction({String? id, String? action, String? description, String? name, String? identifier, bool? isCompleted, String? routePath, String? url}) {
    return NotificationAction._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      action: action,
      description: description,
      name: name,
      identifier: identifier,
      isCompleted: isCompleted,
      routePath: routePath,
      url: url);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationAction &&
      id == other.id &&
      _action == other._action &&
      _description == other._description &&
      _name == other._name &&
      _identifier == other._identifier &&
      _isCompleted == other._isCompleted &&
      _routePath == other._routePath &&
      _url == other._url;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("NotificationAction {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("action=" + "$_action" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("identifier=" + "$_identifier" + ", ");
    buffer.write("isCompleted=" + (_isCompleted != null ? _isCompleted!.toString() : "null") + ", ");
    buffer.write("routePath=" + "$_routePath" + ", ");
    buffer.write("url=" + "$_url" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  NotificationAction copyWith({String? id, String? action, String? description, String? name, String? identifier, bool? isCompleted, String? routePath, String? url}) {
    return NotificationAction._internal(
      id: id ?? this.id,
      action: action ?? this.action,
      description: description ?? this.description,
      name: name ?? this.name,
      identifier: identifier ?? this.identifier,
      isCompleted: isCompleted ?? this.isCompleted,
      routePath: routePath ?? this.routePath,
      url: url ?? this.url);
  }
  
  NotificationAction copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String?>? action,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String?>? name,
    ModelFieldValue<String?>? identifier,
    ModelFieldValue<bool?>? isCompleted,
    ModelFieldValue<String?>? routePath,
    ModelFieldValue<String?>? url
  }) {
    return NotificationAction._internal(
      id: id == null ? this.id : id.value,
      action: action == null ? this.action : action.value,
      description: description == null ? this.description : description.value,
      name: name == null ? this.name : name.value,
      identifier: identifier == null ? this.identifier : identifier.value,
      isCompleted: isCompleted == null ? this.isCompleted : isCompleted.value,
      routePath: routePath == null ? this.routePath : routePath.value,
      url: url == null ? this.url : url.value
    );
  }
  
  NotificationAction.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _action = json['action'],
      _description = json['description'],
      _name = json['name'],
      _identifier = json['identifier'],
      _isCompleted = json['isCompleted'],
      _routePath = json['routePath'],
      _url = json['url'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'action': _action, 'description': _description, 'name': _name, 'identifier': _identifier, 'isCompleted': _isCompleted, 'routePath': _routePath, 'url': _url, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'action': _action,
    'description': _description,
    'name': _name,
    'identifier': _identifier,
    'isCompleted': _isCompleted,
    'routePath': _routePath,
    'url': _url,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final ACTION = amplify_core.QueryField(fieldName: "action");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final IDENTIFIER = amplify_core.QueryField(fieldName: "identifier");
  static final ISCOMPLETED = amplify_core.QueryField(fieldName: "isCompleted");
  static final ROUTEPATH = amplify_core.QueryField(fieldName: "routePath");
  static final URL = amplify_core.QueryField(fieldName: "url");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "NotificationAction";
    modelSchemaDefinition.pluralName = "NotificationActions";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NotificationAction.ACTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NotificationAction.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NotificationAction.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NotificationAction.IDENTIFIER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NotificationAction.ISCOMPLETED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NotificationAction.ROUTEPATH,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: NotificationAction.URL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _NotificationActionModelType extends amplify_core.ModelType<NotificationAction> {
  const _NotificationActionModelType();
  
  @override
  NotificationAction fromJson(Map<String, dynamic> jsonData) {
    return NotificationAction.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'NotificationAction';
  }
}
