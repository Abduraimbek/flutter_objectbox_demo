import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_objectbox_demo/testing_equatable/bloc/test_bloc.dart';
import 'package:flutter_objectbox_demo/testing_equatable/model/car_model.dart';

class TestingEquatablePage extends StatefulWidget {
  const TestingEquatablePage({super.key});

  @override
  State<TestingEquatablePage> createState() => _TestingEquatablePageState();
}

class _TestingEquatablePageState extends State<TestingEquatablePage> {
  var cars = [
    Car(id: 3, name: 'Tico'),
    Car(id: 4, name: 'Nexia'),
  ];

  Car? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Column(
        children: [
          BlocBuilder<TestBloc, TestState>(
            builder: (context, state) {
              return state.when(
                initial: () => Text(''),
                data: (data) => Text(data),
                error: (message) => Text(
                  message,
                  style: TextStyle(color: Colors.red),
                ),
              );
            },
          ),
          Center(
            child: DropdownButton<Car>(
              value: selected,
              items: cars
                  .map(
                    (e) => DropdownMenuItem<Car>(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              onChanged: (Car? value) {
                if (value == null) return;
                selected = Car(
                  id: value.id,
                  name: value.name,
                );
                setState(() {});
              },
            ),
          ),
          const TButton(),
        ],
      ),
    );
  }
}

class TButton extends StatelessWidget {
  const TButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestBloc, TestState>(
      builder: (context, state) {
        return state.when(
          initial: () => Text(''),
          data: (data) => Text(''),
          error: (message) => Text(''),
        );
      },
    );
  }
}
