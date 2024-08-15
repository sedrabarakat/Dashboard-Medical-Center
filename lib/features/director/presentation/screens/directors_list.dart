import 'package:dashboad/core/data/models/user_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/domain/services/locator.dart';
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/features/director/presentation/cubits/director_cubit.dart';
import 'package:dashboad/core/widgets/table/shimmer_table_row.dart';
import 'package:dashboad/core/widgets/table/table_header.dart';
import 'package:dashboad/core/widgets/table/table_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DirectorsList extends StatelessWidget {
  const DirectorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DirectorCubit(getIt())..getDirectors(),
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
                if (current is GetDirectorsLoadingState) {
                  return true;
                } else if (current is GetDirectorsSuccessState) {
                  return true;
                } else if (current is GetDirectorsErrorState) {
                  return true;
                } else if (current is DeleteDirectorSuccessState) {
                  return true;
                } else {
                  return false;
                }
              }, builder: (context, state) {
                if (state is GetDirectorsErrorState) {
                  return Text(NetworkExceptions.getErrorMessage(state.error));
                } else if (state is GetDirectorsLoadingState) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          const ShimmerTableRow(),
                      itemCount: 10,
                    ),
                  );
                } else if (state is GetDirectorsSuccessState) {
                  return _buildTable(state.directors);
                } else if (state is DeleteDirectorSuccessState) {
                  return _buildTable(state.directors);
                } else {
                  return const SizedBox();
                }
              }),
            ],
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
            BlocProvider.of<DirectorCubit>(context)
                .deleteDirector(context, directors[index].id);
          },
        ),
        itemCount: directors.length,
      ),
    );
  }
}
