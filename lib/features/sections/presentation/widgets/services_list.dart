import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/features/sections/data/models/section_model.dart';
import 'package:dashboad/features/sections/presentation/cubits/section_cubit.dart';
import 'package:dashboad/features/sections/presentation/widgets/service_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({
    super.key,
    required this.services,
  });

  final List<SectionService> services;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          decoration: BoxDecoration(
            color: ColorsHelper.lightGry,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  BlocProvider.of<SectionCubit>(context).showServiceDialog(
                    context: context,
                    type: ServiceCrud.addToServer,
                  );
                },
                style: TextButton.styleFrom(
                  overlayColor: Colors.transparent,
                ),
                child: Text(
                  "Add Service",
                  style: StyleManager.fontMedium14.copyWith(
                    color: ColorsHelper.teal,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => SerivcesTile(
                    onDeletePressed: () async {
                      await BlocProvider.of<SectionCubit>(context)
                          .deleteService(services[index].id);
                    },
                    onEditPressed: () async {
                      await BlocProvider.of<SectionCubit>(context)
                          .showServiceDialog(
                        context: context,
                        type: ServiceCrud.edit,
                        index: index,
                      );
                    },
                    name: services[index].name,
                    price: services[index].price,
                    index: index,
                    lastIndex: services.length,
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 0,
                  ),
                  itemCount: services.length,
                ),
              ),
            ],
          )),
    );
  }
}
