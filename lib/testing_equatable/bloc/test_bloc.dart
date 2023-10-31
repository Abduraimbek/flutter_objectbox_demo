import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_event.dart';
part 'test_state.dart';
part 'test_bloc.freezed.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(_Initial()) {
    on<TestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
