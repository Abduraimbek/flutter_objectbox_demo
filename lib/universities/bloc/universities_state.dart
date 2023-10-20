part of 'universities_bloc.dart';

sealed class UniversitiesState extends Equatable {
  const UniversitiesState();

  @override
  List<Object> get props => [];
}

final class UniversitiesInitial extends UniversitiesState {}

final class UniversitiesLoading extends UniversitiesState {}

final class UniversitiesError extends UniversitiesState {
  final String error;

  const UniversitiesError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

final class UniversitiesData extends UniversitiesState {
  final List<UniversityModel> universities;

  const UniversitiesData({
    required this.universities,
  });

  @override
  List<Object> get props => [universities];
}
