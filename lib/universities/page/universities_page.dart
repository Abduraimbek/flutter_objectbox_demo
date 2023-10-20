import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_objectbox_demo/universities/bloc/universities_bloc.dart';
import 'package:flutter_objectbox_demo/universities/repository/universities_repository.dart';

class UniversitiesPage extends StatelessWidget {
  const UniversitiesPage({super.key});

  static const path = '/universities';

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UniversitiesRepository(),
      child: const _BlocWrapper(),
    );
  }
}

class _BlocWrapper extends StatelessWidget {
  const _BlocWrapper();

  @override
  Widget build(BuildContext context) {
    final repository = context.read<UniversitiesRepository>();

    return BlocProvider(
      create: (context) => UniversitiesBloc(
        universitiesRepository: repository,
      )..add(UniversitiesFetchEvent()),
      child: const _PageContent(),
    );
  }
}

class _PageContent extends StatelessWidget {
  const _PageContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universities'),
        actions: [
          BlocBuilder<UniversitiesBloc, UniversitiesState>(
            builder: (context, state) {
              if (state is UniversitiesLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              if (state is UniversitiesData) {
                return Text('Count: ${state.universities.length}');
              }

              return const Text('Count: 0');
            },
          ),
          BlocBuilder<UniversitiesBloc, UniversitiesState>(
            builder: (context, state) {
              return TextButton(
                onPressed: state is UniversitiesLoading
                    ? null
                    : () => BlocProvider.of<UniversitiesBloc>(context)
                        .add(UniversitiesFetchEvent()),
                child: const Text('Fetch'),
              );
            },
          ),
        ],
      ),
      body: const _BuildUniversitiesList(),
    );
  }
}

class _BuildUniversitiesList extends StatelessWidget {
  const _BuildUniversitiesList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UniversitiesBloc, UniversitiesState>(
      builder: (context, state) {
        if (state is UniversitiesLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        if (state is UniversitiesError) {
          return Center(
            child: Text(state.error),
          );
        }

        if (state is UniversitiesData) {
          return ListView.builder(
            itemCount: state.universities.length,
            itemBuilder: (context, index) {
              final item = state.universities[index];

              return ListTile(
                leading: Text(item.id.toString()),
                title: Text(item.name),
                subtitle: Text(item.country),
                trailing: Text(item.alphaTwoCode),
              );
            },
          );
        }

        return const Center(
          child: Text('No data'),
        );
      },
    );
  }
}
