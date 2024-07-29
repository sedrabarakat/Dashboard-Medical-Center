import 'package:dashboad/features/sections/data/models/section_model.dart';
import 'package:dashboad/features/sections/presentation/widgets/section_item_list.dart';
import 'package:flutter/material.dart';

class AddServiceList extends StatelessWidget {
  const AddServiceList({
    super.key,
    required this.animationDuration,
    required this.items,
    required this.listKey,
    required this.onRemovePressed,
  });
  final Duration animationDuration;
  final List<SectionService> items;
  final GlobalKey<AnimatedListState> listKey;
  final void Function(int) onRemovePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedList(
            key: listKey,
            initialItemCount: items.length,
            itemBuilder: (context, index, Animation<double> animation) {
              return SectionItemList(
                onRemovePressed: () {
                  onRemovePressed(index);
                },
                animation: animation,
                value: items[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
