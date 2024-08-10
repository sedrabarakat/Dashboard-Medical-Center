import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class SerivcesTile extends StatefulWidget {
  const SerivcesTile(
      {super.key,
      required this.index,
      required this.lastIndex,
      required this.name,
      required this.price,
      required this.onDeletePressed,
      required this.onEditPressed});
  final int index;
  final int lastIndex;
  final String name;
  final String price;
  final void Function()? onDeletePressed;
  final void Function()? onEditPressed;
  @override
  State<SerivcesTile> createState() => _SerivcesTileState();
}

class _SerivcesTileState extends State<SerivcesTile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: AnimatedContainer(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(10),
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        height: isHover ? 70 : 50,
        decoration: BoxDecoration(
          border: isHover
              ? Border.all(
                  color: ColorsHelper.blue,
                )
              : null,
          borderRadius: BorderRadius.only(
            topRight: (isHover || widget.index == 0
                ? const Radius.circular(20)
                : const Radius.circular(0)),
            topLeft: (isHover || widget.index == 0
                ? const Radius.circular(20)
                : const Radius.circular(0)),
            bottomLeft: (isHover || widget.index == widget.lastIndex - 1
                ? const Radius.circular(20)
                : const Radius.circular(0)),
            bottomRight: (isHover || widget.index == widget.lastIndex - 1
                ? const Radius.circular(20)
                : const Radius.circular(0)),
          ),
          color: ColorsHelper.lightGry,
        ),
        child: SizedBox(
          height: 70,
          child: Column(
            children: [
              SizedBox(
                height: 30,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        widget.name,
                        overflow: TextOverflow.ellipsis,
                        style: StyleManager.fontMedium14.copyWith(
                          color: ColorsHelper.black,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "${widget.price}\$",
                        overflow: TextOverflow.ellipsis,
                        style: StyleManager.fontRegular12.copyWith(
                          color: ColorsHelper.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isHover
                        ? Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: widget.onDeletePressed,
                                  child: Container(
                                    width: 30,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.red,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.close,
                                        size: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: widget.onEditPressed,
                                  child: Container(
                                    width: 30,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: ColorsHelper.blue,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.edit,
                                        size: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
