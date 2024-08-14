import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/core/widgets/toast_bar.dart';
import 'package:dashboad/features/sections/presentation/cubits/section_cubit.dart';
import 'package:dashboad/features/sections/presentation/widgets/sections_responsive_list.dart';
import 'package:dashboad/features/sections/presentation/widgets/shimmer/sections_list_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SectionsList extends StatelessWidget {
  const SectionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SectionCubit>()..getSections(),
      child: Builder(builder: (context) {
        return BlocListener<SectionCubit, SectionState>(
          listener: (context, state) {
            if (state is CreateSectionErrorState) {
              ToastBar.onNetworkFailure(context, networkException: state.error);
            }
          },
          child: BlocBuilder<SectionCubit, SectionState>(
            buildWhen: (previous, current) {
              if (current is GetSectionsSuccessState) {
                return true;
              } else if (current is GetSectionsErrorState) {
                return true;
              } else if (current is GetSectionsLoadingState) {
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              if (state is GetSectionsLoadingState) {
                return const SectionsListLoading();
              } else if (state is GetSectionsSuccessState) {
                return Scaffold(
                    floatingActionButton: FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<SectionCubit>(context)
                            .sectionServices
                            .clear();
                        context.go('/Sections_list/add_section');
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    body: SectionsResponsiveList(sections: state.sections));
              }
              return const Center(
                child: Text("Something went wrong"),
              );
            },
          ),
        );
      }),
    );
  }
}
