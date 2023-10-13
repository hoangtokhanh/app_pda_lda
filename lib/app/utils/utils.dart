import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import 'package:intl/intl.dart';

String timeOfDayToString(TimeOfDay timeOfDay) {
  final formattedTime =
      '${timeOfDay.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}';
  return formattedTime;
}

Future<String> showTimePickerAndGetTime(BuildContext context) async {
  final TimeOfDay currentTime = TimeOfDay.now();
  // Show the time picker dialog
  final TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: currentTime,
      initialEntryMode: TimePickerEntryMode.inputOnly
  );

  if (selectedTime != null) {
    // Format the selected time as HH:mm:ss
    final formattedTime =
        '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}:00';
    return formattedTime;
  } else {
    // If the user cancels, return the current time
    final formattedCurrentTime =
        '${currentTime.hour.toString().padLeft(2, '0')}:${currentTime.minute.toString().padLeft(2, '0')}:00';
    return formattedCurrentTime;
  }
}

DateTime getDateTimeFromString(String datetime, String format) {
  try {
    return DateFormat(format).parse(datetime);
  } catch (e) {
    return DateTime.now();
  }
}

DateTime? getDateTimeFromStringDashboard(String datetime, String format) {
  try {
    return DateFormat(format).parse(datetime);
  } catch (e) {
    //  print(e);
    return null;
  }
}

String getStringFromDateTime(DateTime datetime, String format) {
  try {
    return DateFormat(format).format(datetime);
  } catch (e) {
    return '';
  }
}

String getMoneyFormat(dynamic money, {int precision = 0}) {
  int decimals = 0;
  if (money.toString().split('.').length > 2) {
    decimals = money.toString().split('.')[1].length;
  }
  decimals = decimals > 3 ? 3 : 3;
  if (money == null) return '';

  var controller = MoneyMaskedTextController(
      decimalSeparator: (decimals == 0) ? '' : '.', thousandSeparator: ',', precision: decimals);

  controller.updateValue(money * 1.0);

  return controller.text;
}

double convertToDouble(value) {
  try {
    if (value is int) {
      return value.toDouble() * 1.0;
    }
    return value;
  } catch (e) {
    return 0;
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(value: item, child: Text(item));
