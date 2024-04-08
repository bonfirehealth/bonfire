part of 'complete_profile_bloc.dart';

class CompleteProfileState {
  const CompleteProfileState({
    this.isLoading = true,
    this.age = 18,
    this.gender = 'Male',
    this.weight = 80,
    this.weightUnit = 'kg',
    this.weightUnitName = 'kilogram',
    this.height = 165,
    this.heightUnit = 'cm',
    this.heightUnitName = 'centimetre',
  });

  final bool isLoading;
  final int age;
  final String? gender;
  final int weight;
  final String weightUnit;
  final String? weightUnitName;
  final int height;
  final String heightUnit;
  final String? heightUnitName;

  CompleteProfileState copyWith({
    bool? isLoading,
    int? age,
    String? gender,
    int? weight,
    String? weightUnit,
    String? weightUnitName,
    int? height,
    String? heightUnit,
    String? heightUnitName,
  }) {
    return CompleteProfileState(
      isLoading: isLoading ?? this.isLoading,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      weightUnit: weightUnit ?? this.weightUnit,
      weightUnitName: weightUnitName ?? this.weightUnitName,
      height: height ?? this.height,
      heightUnit: heightUnit ?? this.heightUnit,
      heightUnitName: heightUnitName ?? this.heightUnitName,
    );
  }
}
