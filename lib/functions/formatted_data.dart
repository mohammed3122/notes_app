import 'package:intl/intl.dart';

String formattedDate() {
  var currentDate = DateTime.now();
  var formattedCurrentDate = DateFormat(
    'yyyy , MMM dd\nhh : mm a ',
  ).format(currentDate);
  return formattedCurrentDate;
}
