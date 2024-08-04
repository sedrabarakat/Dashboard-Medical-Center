import 'package:dashboad/core/data/models/user_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/core/widgets/table/shimmer_table_row.dart';
import 'package:dashboad/core/widgets/table/table_header.dart';
import 'package:dashboad/core/widgets/table/table_row.dart';
import 'package:dashboad/features/reseptions/presentation/cubits/reseption_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../drawer_basiclayout/presentation/screens/baselayout.dart';

class ReseptionsList extends StatelessWidget {
  const ReseptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReseptionCubit(getIt())..getReseptions(),
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
                BlocBuilder<ReseptionCubit, ReseptionState>(
                    buildWhen: (previous, current) {
                  if (current is GetReseptionsLoadingState) {
                    return true;
                  } else if (current is GetReseptionsSuccessState) {
                    return true;
                  } else if (current is GetReseptionsErrorState) {
                    return true;
                  } else if (current is DeleteReseptionSuccessState) {
                    return true;
                  } else {
                    return false;
                  }
                }, builder: (context, state) {
                  if (state is GetReseptionsErrorState) {
                    return Text(NetworkExceptions.getErrorMessage(state.error));
                  } else if (state is GetReseptionsLoadingState) {
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            const ShimmerTableRow(),
                        itemCount: 10,
                      ),
                    );
                  } else if (state is GetReseptionsSuccessState) {
                    return _buildTable(state.reseptions);
                  } else if (state is DeleteReseptionSuccessState) {
                    return _buildTable(state.reseptions);
                  } else {
                    return const SizedBox();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTable(List<UserModel> directors) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => MyTableRow(
          user: directors[index],
          onEditPressed: () {},
          onRemovePressed: () {
            BlocProvider.of<ReseptionCubit>(context)
                .deleteReseptionist(context, directors[index].id);
          },
        ),
        itemCount: directors.length,
      ),
    );
  }
}
