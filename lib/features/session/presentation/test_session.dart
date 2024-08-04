import 'package:dashboad/features/session/domain/repositories/session_repository.dart';
import 'package:dashboad/features/session/presentation/cubit/session_cubit.dart';
import 'package:dashboad/features/session/presentation/widgets/session_card.dart';
import 'package:dashboad/features/session/presentation/widgets/session_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/domain/services/locator.dart';

class TestSession extends StatelessWidget {
  const TestSession({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SessionCubit(getIt<SessionRepository>()),
      child: const Scaffold(
        body: Center(
          child: SessionContainer(),
        ),
      ),
    );
  }
}
