import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/helpers/dimensions_helper.dart';
import 'package:dashboad/core/utils/assets_manager.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/features/sections/presentation/cubits/section_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SectionDetailsHeader extends StatelessWidget {
  const SectionDetailsHeader({
    super.key,
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: DimensionsHelper.heightPercentage(context, 10),
      decoration: BoxDecoration(
        color: ColorsHelper.blue.withOpacity(.9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          //TODO change it to network image
          Hero(
            tag: id,
            child: Image.asset(
              AssetsManager.heart,
            ),
          ),
          Hero(
            tag: name,
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: StyleManager.fontSemiBold22.copyWith(color: Colors.white),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () async {
              BlocProvider.of<SectionCubit>(context).sectionName.text = name;
              context.go('/Sections_list/edit_section');
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            style: IconButton.styleFrom(
              padding: const EdgeInsets.all(5),
              iconSize: 22,
              maximumSize: const Size(32, 32),
              minimumSize: const Size(32, 32),
              backgroundColor: ColorsHelper.blueDarker,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () async {
              BlocProvider.of<SectionCubit>(context).deleteSection(id);
            },
            icon: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
            style: IconButton.styleFrom(
              padding: const EdgeInsets.all(5),
              iconSize: 22,
              maximumSize: const Size(32, 32),
              minimumSize: const Size(32, 32),
              backgroundColor: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
