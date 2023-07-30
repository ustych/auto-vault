import 'package:authentication_repository/authentication_repository.dart';
import 'package:auto_vault/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final _authRepository = getIt.get<AuthenticationRepository>();

    return BlocProvider(
      create: (_) => AppBloc( // create app bloc!
        authenticationRepository: _authRepository,
      ),
      child: Builder(
        builder: (context) {
          print("123")
          return Text("123");
        },
      ),
    );
  }
}
