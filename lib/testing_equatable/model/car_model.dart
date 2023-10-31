// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Car extends Equatable {
  final int id;
  final String name;

  Car({
    required this.id,
    required this.name,
  });

  Car copyWith({
    int? id,
    String? name,
  }) {
    return Car(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
