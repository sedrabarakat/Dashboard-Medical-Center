import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/assets_manager.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatefulWidget {
  const DoctorCard({
    super.key,
    required this.onTap,
    required this.doctorName,
    required this.sectionName,
  });
  final void Function()? onTap;
  final String doctorName;
  final String sectionName;
  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  bool isFocus = false;
  @override
  Widget build(BuildContext context) {
    final hoverTransform = Matrix4.identity()..scale(1.02);
    final transformValue = isFocus ? hoverTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isFocus = true;
        });
      },
      onExit: (event) {
        setState(() {
          isFocus = false;
        });
      },
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: transformValue,
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: isFocus ? 2 : 1,
              color: isFocus ? ColorsHelper.teal : Colors.grey.shade400,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    AssetsManager.doctor,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Doctor name",
                        style: StyleManager.fontSemiBold18,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.sectionName,
                        style: StyleManager.fontregular14,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
