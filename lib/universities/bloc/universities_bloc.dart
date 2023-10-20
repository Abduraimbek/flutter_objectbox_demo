import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_objectbox_demo/universities/model/university_model.dart';
import 'package:flutter_objectbox_demo/universities/repository/universities_repository.dart';

part 'universities_event.dart';
part 'universities_state.dart';

class UniversitiesBloc extends Bloc<UniversitiesEvent, UniversitiesState> {
  final UniversitiesRepository _universitiesRepository;

  UniversitiesBloc({
    required UniversitiesRepository universitiesRepository,
  })  : _universitiesRepository = universitiesRepository,
        super(UniversitiesInitial()) {
    on<UniversitiesFetchEvent>((event, emit) async {
      emit(UniversitiesLoading());

      try {
        final apiList = await _universitiesRepository.fetchUniversities();
        await _universitiesRepository.deleteAllUniversities();
        await _universitiesRepository.saveUniversitiesIntoDB(apiList);
        final list = await _universitiesRepository.getUniversitiesFromDB();

        emit(UniversitiesData(universities: list));
      } catch (err) {
        emit(UniversitiesError(error: err.toString()));
      }
    });
  }
}
