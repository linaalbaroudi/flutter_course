import 'package:flutter/material.dart';

enum SnackBarType {
  info(icon: Icon(Icons.info, color: Colors.blue)),
  error(icon: Icon(Icons.error, color: Colors.red));

  final Icon icon;

  const SnackBarType({required this.icon});
}

class CustomSnackBar {

  SnackBar infoSnackBar(BuildContext context, String message, [void Function()? action]) {
    return SnackBar(
      elevation: 2,
      margin: EdgeInsets.all(16),
      backgroundColor: Colors.black54,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          SnackBarType.info.icon,
          const SizedBox(width: 16,),
          Text(message,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white)),
        ],
      ),
      action: action != null ?
      SnackBarAction(
        label: "Undo",
        onPressed: action,
        textColor: Colors.white,
      )
          : SnackBarAction(
        label: "OK",
        onPressed: () {},
        textColor: Colors.white,
      ),
    );
  }

  SnackBar errorSnackBar(BuildContext context, String message, [void Function()? action]) {
    return SnackBar(
      elevation: 2,
      margin: EdgeInsets.all(16),
      backgroundColor: Colors.black54,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          SnackBarType.error.icon,
          const SizedBox(width: 16,),
          Text(message),
        ],
      ),
      action: action != null ?
      SnackBarAction(
        label: "Undo",
        onPressed: action,
      )
          : SnackBarAction(
        label: "OK",
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
