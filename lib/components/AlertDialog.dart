import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class AlertBox {

  Future showAlert(context, String title, String body,) {

    return Dialogs.materialDialog(
        color: Colors.white,
        msg: body,
        title: title,
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Get.back();
            },
            text: 'Done',
            iconData: Icons.done,
            color: Colors.blue,
            textStyle: const TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
    // return showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Text(title),
    //         content:
    //         Text(body),
    //         actions: <Widget>[
    //           TextButton(
    //             child: Text("OK"),
    //             onPressed: () {
    //               Navigator.of(context)
    //                   .pop(); // Close the dialog
    //             },
    //           ),
    //         ],
    //       );
    //     }
    // );
  }
}

