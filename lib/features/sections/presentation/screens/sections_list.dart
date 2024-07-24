import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/core/widgets/toast_bar.dart';
import 'package:dashboad/features/sections/presentation/cubits/section_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../../../drawer_basiclayout/presentation/screens/baselayout.dart';

class SectionsList extends StatelessWidget {
  const SectionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SectionCubit(getIt()),
      child: Builder(builder: (context) {
        return BlocListener<SectionCubit, SectionState>(
          listener: (context, state) {
            if (state is CreateSectionErrorState) {
              ToastBar.onNetworkFailure(context, networkException: state.error);
            }
          },
          child: BaseLayout(
              child: Center(
            child: ElevatedButton(
              child: Text('Get Sections'),
              onPressed: () async {
                await BlocProvider.of<SectionCubit>(context).updateSection(2);
              },
            ),
          )),
        );
      }),
    );
  }
}
