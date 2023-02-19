import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Create a DateTime picker widget for use in a [Dialog]
/// Can also be used outside a dialog
class SpinnerDateTimePicker extends StatefulWidget {
  const SpinnerDateTimePicker({
    Key? key,
    required this.initialDateTime,
    required this.maximumDate,
    required this.minimumDate,
    this.use24hFormat = true,
    this.mode = CupertinoDatePickerMode.date,
    required this.didSetTime,
  }) : super(key: key);

  /// Callback called when set time button is tapped.
  final Function(DateTime) didSetTime;

  /// The initial date and/or time of the picker. Defaults to the present date
  /// and time and must not be null.
  final DateTime initialDateTime;

  /// The maximum selectable date that the picker can settle on.
  /// Can not be null.
  final DateTime maximumDate;

  /// The minimum selectable date that the picker can settle on.
  /// Can not be null.
  final DateTime minimumDate;

  /// Whether to use 24 hour format. Defaults to false.
  final bool use24hFormat;

  /// The mode of the date picker as one of [CupertinoDatePickerMode].
  /// Defaults to [CupertinoDatePickerMode.dateAndTime]. Cannot be null and
  /// value cannot change after initial build.
  /// Options:
  /// [CupertinoDatePickerMode.date]
  /// [CupertinoDatePickerMode.time]
  /// [CupertinoDatePickerMode.dateAndTime]
  final CupertinoDatePickerMode mode;

  @override
  State<SpinnerDateTimePicker> createState() => _SpinnerDateTimePickerState();
}

class _SpinnerDateTimePickerState extends State<SpinnerDateTimePicker> {
  late DateTime initialDate;
  late DateTime maximumDate;
  late DateTime minimumDate;
  late DateTime selectedDateTime;

  /// sets up the [DateTime] object to only use year, month, day, hour, minute.
  /// [Datetime] usually has additional values that seem to mess up the min-max dates in the spinner
  void setupDateTime() {
    DateTime now = DateTime.now();
    now = widget.initialDateTime;

    initialDate = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
      now.minute,
    );

    selectedDateTime = initialDate;

    var max = widget.maximumDate;
    maximumDate = DateTime(
      max.year,
      max.month,
      max.day,
      max.hour,
      max.minute,
    );

    var min = widget.minimumDate;
    minimumDate = DateTime(
      min.year,
      min.month,
      min.day,
      min.hour,
      min.minute,
    );
  }

  /// changes the button text based picker mode
  var buttonTitle = "CONFERMA";

  /// check if mobile to change the scroll behavior based on mouse or touch
  bool isMobile = false;

  @override
  void initState() {
    super.initState();
    setupDateTime();

    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      isMobile = true;
    }

    if (widget.mode == CupertinoDatePickerMode.date) {
      buttonTitle = "CONFERMA";
    } else if (widget.mode == CupertinoDatePickerMode.time) {
      buttonTitle = "SET TIME";
    } else if (widget.mode == CupertinoDatePickerMode.dateAndTime) {
      buttonTitle = "SET DATE & TIME";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kIsWeb ? 320 : double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  child: ScrollConfiguration(
                    behavior: isMobile
                        ? const ScrollBehavior()
                        : const ScrollBehavior().copyWith(
                      dragDevices: {
                        PointerDeviceKind.mouse,
                      },
                    ),
                    child: CupertinoDatePicker(
                      initialDateTime: initialDate,
                      maximumDate: maximumDate,
                      minimumDate: minimumDate,
                      use24hFormat: widget.use24hFormat,
                      mode: widget.mode,
                      onDateTimeChanged: (dateTime) {
                        selectedDateTime = dateTime;
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                      ),
                      child: const Text(
                        "ANNULLA",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    TextButton(
                      onPressed: () {
                        widget.didSetTime(selectedDateTime);
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                      ),
                      child: Text(
                        buttonTitle,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}