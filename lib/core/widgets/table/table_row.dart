import 'package:dashboad/core/data/models/user_model.dart';
import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/assets_manager.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_network/image_network.dart';

class MyTableRow extends StatelessWidget {
  const MyTableRow(
      {super.key,
      required this.onEditPressed,
      required this.onRemovePressed,
      required this.user,
      this.rowPadding = const EdgeInsets.symmetric(
        horizontal: AppPadding.p8,
        vertical: AppPadding.p10,
      ),
      this.borderColor = ColorsHelper.lightGry,
      this.editIcon = Icons.settings,
      this.removeIcon = Icons.remove_circle,
      this.thereEdit = false});
  final UserModel user;
  final void Function()? onEditPressed;
  final void Function()? onRemovePressed;
  final EdgeInsets rowPadding;
  final Color borderColor;
  final IconData editIcon;
  final IconData removeIcon;
  final bool thereEdit;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      padding: rowPadding,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Container(
                    clipBehavior: Clip.hardEdge,
                    height: 60.h,
                    width: 60.h,
                    decoration:
                        StyleManager.Circle_Shape(color: ColorsHelper.black26),
                    child: (user.image != null)
                        ? ImageNetwork(
                            image: user.image!,
                            height: 250.h,
                            width: 200.w,
                            fitWeb: BoxFitWeb.fill,
                          )
                        : Image.asset(AssetsManager.DefImage,
                            fit: BoxFit.cover)),
                const SizedBox(
                  width: AppSize.s10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.firstName + " " + user.lastName,
                        overflow: TextOverflow.ellipsis,
                        style: StyleManager.fontRegular16,
                      ),
                      Text(
                        user.phoneNumber,
                        overflow: TextOverflow.ellipsis,
                        style: StyleManager.fontregular14,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p4,
                    horizontal: AppPadding.p12,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsHelper.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    user.userType,
                    overflow: TextOverflow.ellipsis,
                    style: StyleManager.fontRegular12.copyWith(
                      color: ColorsHelper.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Wrap(
              clipBehavior: Clip.hardEdge,
              children: [
                (thereEdit)
                    ? InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: onEditPressed,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              editIcon,
                              size: 18,
                              color: ColorsHelper.lightGry,
                            ),
                            Text(
                              "Edit",
                              style: StyleManager.fontRegular12.copyWith(
                                color: ColorsHelper.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
                const SizedBox(
                  width: AppSize.s8,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: onRemovePressed,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        removeIcon,
                        color: Colors.red,
                        size: 18,
                      ),
                      Text(
                        "Remove",
                        style: StyleManager.fontRegular12.copyWith(
                          color: ColorsHelper.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
