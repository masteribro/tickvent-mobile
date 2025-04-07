import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String formatDayWithSuffix(int day) {
  if (day >= 11 && day <= 13) {
    return '${day}th';
  } else if (day % 10 == 1) {
    return '${day}st';
  } else if (day % 10 == 2) {
    return '${day}nd';
  } else if (day % 10 == 3) {
    return '${day}rd';
  } else {
    return '${day}th';
  }
}

void copyToClipboard(BuildContext context, String textToCopy,
    {String? itemTitle}) {
  Clipboard.setData(ClipboardData(text: textToCopy));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('${itemTitle ?? "Item"} copied to clipboard')),
  );
}
