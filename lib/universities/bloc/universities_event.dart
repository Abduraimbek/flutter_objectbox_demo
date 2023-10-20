part of 'universities_bloc.dart';

sealed class UniversitiesEvent extends Equatable {
  const UniversitiesEvent();

  @override
  List<Object> get props => [];
}

final class UniversitiesFetchEvent extends UniversitiesEvent {}
