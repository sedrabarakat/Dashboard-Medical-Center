import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/features/director/presentation/cubits/director_cubit.dart';
import 'package:dashboad/features/doctors/presentation/widgets/table/shimmer_table_row.dart';
import 'package:dashboad/features/doctors/presentation/widgets/table/table_header.dart';
import 'package:dashboad/features/doctors/presentation/widgets/table/table_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../drawer_basiclayout/presentation/screens/baselayout.dart';

class DirectorsList extends StatelessWidget {
  const DirectorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DirectorCubit(getIt())..getDirectors(),
      child: BaseLayout(
        child: Padding(
          padding: const EdgeInsets.all(
            AppPadding.p30,
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorsHelper.lightGry,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const TableHeader(),
                BlocBuilder<DirectorCubit, DirectorState>(
                  buildWhen: (previous, current) {
                    return current.maybeWhen(
                      directorsSuccess: (_) => true,
                      directorsLoading: () => true,
                      directorsFailure: (_) => true,
                      deleteDirectorSuccess: (_) => true,
                      orElse: () => false,
                    );
                  },
                  builder: (context, state) => state.maybeWhen(
                    directorsFailure: (e) =>
                        Text(NetworkExceptions.getErrorMessage(e)),
                    directorsLoading: () => Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            const ShimmerTableRow(),
                        itemCount: 10,
                      ),
                    ),
                    directorsSuccess: (directors) => Expanded(
                      key: Key(directors.length.toString()),
                      child: ListView.builder(
                        itemBuilder: (context, index) => MyTableRow(
                          user: directors[index],
                          onEditPressed: () {},
                          onRemovePressed: () {
                            BlocProvider.of<DirectorCubit>(context)
                                .deleteDirector(context, directors[index].id);
                          },
                        ),
                        itemCount: directors.length,
                      ),
                    ),
                    deleteDirectorSuccess: (directors) => Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => MyTableRow(
                          user: directors[index],
                          onEditPressed: () {},
                          onRemovePressed: () {
                            BlocProvider.of<DirectorCubit>(context)
                                .deleteDirector(context, directors[index].id);
                          },
                        ),
                        itemCount: directors.length,
                      ),
                    ),
                    orElse: () => const SizedBox(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
