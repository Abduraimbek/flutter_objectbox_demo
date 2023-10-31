part of 'test_bloc.dart';

@freezed
class TestState with _$TestState {
  const factory TestState.initial() = _Initial;

  const factory TestState.data({
    required String data,
  }) = _Data;

  const factory TestState.error({
    required String message,
  }) = _Error;
}
