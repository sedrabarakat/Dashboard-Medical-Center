import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import '../../../patients/data/models/session_model.dart';

class SessionCard extends StatelessWidget {
  final Session session;
  final VoidCallback onClose;
  final VoidCallback onEdit;

  const SessionCard({
    super.key,
    required this.session,
    required this.onClose,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorsHelper.backgroundBlue,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: ListTile(
        title: Text('Date: ' ' ${session.createdDate}'),
        trailing: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'Confirm Close this session',
                      style: StyleManager.fontMedium24,
                    ),
                    content: Text('Price: '
                        '${session.total}\$\n\nAre you sure you want to close this session?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel')),
                      TextButton(
                          onPressed: () {
                            onClose();
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Close',
                            style: StyleManager.font20Bold,
                          )),
                    ],
                  );
                });
          },
        ),
        onTap: onEdit,
      ),
    );
  }
}
