import 'package:dashboad/core/helpers/responsive_helper.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:dashboad/features/sections/data/models/section_model.dart';
import 'package:dashboad/features/sections/presentation/cubits/section_cubit.dart';
import 'package:dashboad/features/sections/presentation/widgets/section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SectionsResponsiveList extends StatelessWidget {
  const SectionsResponsiveList({required this.sections, super.key});
  final List<SectionModel> sections;

  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isMobile(context)
        ? ListView.separated(
            padding: const EdgeInsets.all(AppPadding.p30),
            itemBuilder: (context, index) => SectionCard(
              id: sections[index].id,
              onTap: () async {
                context.go(
                    '/Sections_list/section_details/${sections[index].id}/${sections[index].sectionName}',
                    extra: sections[index].image);
              },
              name: sections[index].sectionName,
              image: sections[index].image,
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: sections.length,
          )
        : GridView.builder(
            padding: const EdgeInsets.all(AppPadding.p30),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              mainAxisExtent: 125,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => SectionCard(
              id: sections[index].id,
              onTap: () async {
                context.go(
                  '/Sections_list/section_details/${sections[index].id}/${sections[index].sectionName}',
                );
                await BlocProvider.of<SectionCubit>(context)
                    .getSectionInformation(sections[index].id);
              },
              name: sections[index].sectionName,
              image: sections[index].image,
            ),
            itemCount: sections.length,
          );
  }
}
