import 'package:Go1Tok/src/features/authentication/controllers/hotel_result_controller.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/hotel/hotel_results/file_item_holder.dart';
import 'package:cupertino_range_slider_improved/cupertino_range_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RangeSliderItem extends StatefulWidget {
  final String title;
  final int initialMinValue;
  final int initialMaxValue;
  final ValueChanged<int> onMinValueChanged;
  final ValueChanged<int> onMaxValueChanged;

  const RangeSliderItem(
      {Key? key,
        required this.title,
        required this.initialMinValue,
        required this.initialMaxValue,
        required this.onMinValueChanged,
        required this.onMaxValueChanged})
      : super(key: key);

  @override
  _RangeSliderItemState createState() => _RangeSliderItemState();
}

class _RangeSliderItemState extends State<RangeSliderItem> {
  late int minValue;
  late int maxValue;

  @override
  void initState() {
    super.initState();
    minValue = widget.initialMinValue;
    maxValue = widget.initialMaxValue;
  }


  final hotelResultController = Get.put(HotelResultController());
  @override
  Widget build(BuildContext context) {
    return FilterItemHolder(
      title: widget.title,
      value: '${hotelResultController.currency}$minValue - ${hotelResultController.currency}$maxValue',
      child: CupertinoRangeSlider(
        minValue: minValue.roundToDouble(),
        maxValue: maxValue.roundToDouble(),
        min: hotelResultController.minSliderValueC.value,
        max: hotelResultController.maxSliderValueC.value,
        onMinChanged: (minVal) {
          setState(() {
            minValue = minVal.round();
            widget.onMinValueChanged(minValue);
          });
        },
        onMaxChanged: (maxVal) {
          setState(() {
            maxValue = maxVal.round();
            widget.onMaxValueChanged(maxValue);
          });
        },
      ),
    );
  }
}