import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_number_picker.dart';
import 'package:get/get.dart';
import '../../../../../constants/colors.dart';
import '../../../controllers/hotel_rooms_controller.dart';

class HotelRooms extends StatelessWidget {
  HotelRooms({super.key});

  final hotelRoomsController = Get.put(HotelRoomsController());

  @override
  Widget build(BuildContext context) {
    final hotelRoomsController = Get.put(HotelRoomsController());

    return Scaffold(
        appBar: AppBar(
          title: const Text(tGuestInfo),
          centerTitle: true,
          leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: tWhiteColor,
            ),
          ),
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                tPrimaryColor,
                secondPrimaryColor,
              ]),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
                children: [

              const SizedBox(
                height: tDefaultSize,
              ),
              classAdult(context),
                  const SizedBox(
                    height: tDefaultSize - 10.0,
                  ),
              classChildren(context),
                  const SizedBox(
                    height: tDefaultSize,
                  ),
         hotelRoomsController.child.value != 0  ? Container(


                  color: greyColor.withOpacity(0.2),
                  child: hotelRoomsController.child.value == 1 ? classChildrenNumber1(context)
                      : hotelRoomsController.child.value == 2 ? classChildrenNumber2(context)
                      : hotelRoomsController.child.value == 3 ? classChildrenNumber3(context)
                      : classChildrenNumber4(context),

         ) : const SizedBox(),

              const SizedBox(height: tDefaultSize,),

              InkWell(
                onTap: () => hotelRoomsController.apply(),
                child: Container(
                  width: Helper.screenWidth() * 0.7,

                  margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding, ),

                  decoration: BoxDecoration(
                      color: tAccentColor,
                      borderRadius: BorderRadius.circular(40)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: tDefaultPadding,
                      vertical: tDefaultPadding - 2.0),
                  child: Center(
                    child: Text(
                      tApply,
                      style: Theme.of(context).textTheme.headlineSmall?.apply(
                            color: tWhiteColor,
                          ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }

  Widget classAdult(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultPadding, vertical: tDefaultPadding),
            child: Text(
              tAdult12,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Obx(
            () => Container(
              margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(tSmallRadius),
                  border: Border.all(
                    color: greyColor,
                    width: 2.0,
                  )),
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: tSmallPadding + tDefaultElevation,
                      vertical: tSmallPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(hotelRoomsController.adult1.value.toString()),
                      const Icon(Icons.arrow_drop_down_outlined)
                    ],
                  ),
                ),
                onTap: () => showMaterialNumberPicker(
                  context: context,
                  title: tSelectNumber,
                  maxNumber: 6,
                  minNumber: 1,
                  step: 1,
                  confirmText: tConfirm,
                  cancelText: tCancel,
                  headerColor: tPrimaryColor,
                  headerTextColor: tWhiteColor,
                  selectedNumber: hotelRoomsController.adult1.value,
                  onChanged: (value) =>
                      hotelRoomsController.setAdultNumber(value),
                ),
              ),
            ),
          ),
        ],
      );

  Widget classChildren(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultPadding, vertical: tDefaultPadding),
            child: Text(
              tChildren,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          Obx(
                () => Container(
              margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(tSmallRadius),
                  border: Border.all(
                    color: greyColor,
                    width: 2.0,
                  )),
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: tSmallPadding + tDefaultElevation,
                      vertical: tSmallPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(hotelRoomsController.child.value.toString()),
                      const Icon(Icons.arrow_drop_down_outlined)
                    ],
                  ),
                ),
                onTap: () => showMaterialNumberPicker(
                  context: context,
                  title: tSelectNumber,
                  maxNumber: 4,
                  minNumber: 0,
                  step: 1,
                  confirmText: tConfirm,
                  cancelText: tCancel,
                  headerColor: tPrimaryColor,
                  headerTextColor: tWhiteColor,
                  selectedNumber: hotelRoomsController.child.value,
                  onChanged: (value) =>
                      hotelRoomsController.setChildrenNumber(value),
                ),
              ),
            ),
          ),


        ],
      );


  Widget classChildrenNumber1(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultPadding, vertical: tDefaultPadding),
            child: Text(
              tChildrenText,
              style: Theme.of(context).textTheme.headlineMedium?.apply(
                color: tDarkColor.withOpacity(0.5)
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Text(
                  tChild1,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),

      const Spacer(),

       Container(
                  margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(tSmallRadius),
                      border: Border.all(
                        color: greyColor,
                        width: 2.0,
                      )),
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: tSmallPadding + tDefaultElevation,
                          vertical: tSmallPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(hotelRoomsController.child1.value.toString()),
                          const Icon(Icons.arrow_drop_down_outlined)
                        ],
                      ),
                    ),
                    onTap: () => showMaterialNumberPicker(
                      context: context,
                      title: tSelectAge,
                      maxNumber: 11,
                      minNumber: 0,
                      step: 1,
                      confirmText: tConfirm,
                      cancelText: tCancel,
                      headerColor: tPrimaryColor,
                      headerTextColor: tWhiteColor,
                      selectedNumber: hotelRoomsController.child1.value,
                      onChanged: (value) =>
                          hotelRoomsController.setChild(value,),
                    ),
                  ),
                ),
            ],
          ),






        ],
      );
  Widget classChildrenNumber2(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultPadding, vertical: tDefaultPadding),
            child: Text(
              tChildrenText,
              style: Theme.of(context).textTheme.headlineMedium?.apply(
                color: tDarkColor.withOpacity(0.5)
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Text(
                  tChild1,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),

      const Spacer(),

       Container(
                  margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(tSmallRadius),
                      border: Border.all(
                        color: greyColor,
                        width: 2.0,
                      )),
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: tSmallPadding + tDefaultElevation,
                          vertical: tSmallPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(hotelRoomsController.child1.value.toString()),
                          const Icon(Icons.arrow_drop_down_outlined)
                        ],
                      ),
                    ),
                    onTap: () => showMaterialNumberPicker(
                      context: context,
                      title: tSelectAge,
                      maxNumber: 11,
                      minNumber: 0,
                      step: 1,
                      confirmText: tConfirm,
                      cancelText: tCancel,
                      headerColor: tPrimaryColor,
                      headerTextColor: tWhiteColor,
                      selectedNumber: hotelRoomsController.child1.value,
                      onChanged: (value) =>
                          hotelRoomsController.setChild(value),
                    ),
                  ),
                ),
            ],
          ),

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Text(
                  tChild2,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),

              const Spacer(),

       Container(

                  margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(tSmallRadius),
                      border: Border.all(
                        color: greyColor,
                        width: 2.0,
                      )),
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: tSmallPadding + tDefaultElevation,
                          vertical: tSmallPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(hotelRoomsController.child2.value.toString()),
                          const Icon(Icons.arrow_drop_down_outlined)
                        ],
                      ),
                    ),
                    onTap: () => showMaterialNumberPicker(
                      context: context,
                      title: tSelectAge,
                      maxNumber: 11,
                      minNumber: 0,
                      step: 1,
                      confirmText: tConfirm,
                      cancelText: tCancel,
                      headerColor: tPrimaryColor,
                      headerTextColor: tWhiteColor,
                      selectedNumber: hotelRoomsController.child2.value,
                      onChanged: (value) =>
                          hotelRoomsController.setChild2(value),
                    ),
                  ),
                ),
            ],
          ),






        ],
      );
  Widget classChildrenNumber3(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultPadding, vertical: tDefaultPadding),
            child: Text(
              tChildrenText,
              style: Theme.of(context).textTheme.headlineMedium?.apply(
                color: tDarkColor.withOpacity(0.5)
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Text(
                  tChild1,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),

      const Spacer(),

       Container(
                  margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(tSmallRadius),
                      border: Border.all(
                        color: greyColor,
                        width: 2.0,
                      )),
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: tSmallPadding + tDefaultElevation,
                          vertical: tSmallPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(hotelRoomsController.child1.value.toString()),
                          const Icon(Icons.arrow_drop_down_outlined)
                        ],
                      ),
                    ),
                    onTap: () => showMaterialNumberPicker(
                      context: context,
                      title: tSelectAge,
                      maxNumber: 11,
                      minNumber: 0,
                      step: 1,
                      confirmText: tConfirm,
                      cancelText: tCancel,
                      headerColor: tPrimaryColor,
                      headerTextColor: tWhiteColor,
                      selectedNumber: hotelRoomsController.child1.value,
                      onChanged: (value) =>
                          hotelRoomsController.setChild(value),
                    ),
                  ),
                ),
            ],
          ),

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Text(
                  tChild2,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),

              const Spacer(),

       Container(

                  margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(tSmallRadius),
                      border: Border.all(
                        color: greyColor,
                        width: 2.0,
                      )),
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: tSmallPadding + tDefaultElevation,
                          vertical: tSmallPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(hotelRoomsController.child2.value.toString()),
                          const Icon(Icons.arrow_drop_down_outlined)
                        ],
                      ),
                    ),
                    onTap: () => showMaterialNumberPicker(
                      context: context,
                      title: tSelectAge,
                      maxNumber: 11,
                      minNumber: 0,
                      step: 1,
                      confirmText: tConfirm,
                      cancelText: tCancel,
                      headerColor: tPrimaryColor,
                      headerTextColor: tWhiteColor,
                      selectedNumber: hotelRoomsController.child2.value,
                      onChanged: (value) =>
                          hotelRoomsController.setChild2(value),
                    ),
                  ),
                ),
            ],
          ),

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Text(
                  tChild3,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),

              const Spacer(),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(tSmallRadius),
                    border: Border.all(
                      color: greyColor,
                      width: 2.0,
                    )),
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: tSmallPadding + tDefaultElevation,
                        vertical: tSmallPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(hotelRoomsController.child3.value.toString()),
                        const Icon(Icons.arrow_drop_down_outlined)
                      ],
                    ),
                  ),
                  onTap: () => showMaterialNumberPicker(
                    context: context,
                    title: tSelectAge,
                    maxNumber: 11,
                    minNumber: 0,
                    step: 1,
                    confirmText: tConfirm,
                    cancelText: tCancel,
                    headerColor: tPrimaryColor,
                    headerTextColor: tWhiteColor,
                    selectedNumber: hotelRoomsController.child3.value,
                    onChanged: (value) =>
                        hotelRoomsController.setChild3(value),
                  ),
                ),
              ),
            ],
          ),





        ],
      );
  Widget classChildrenNumber4(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultPadding, vertical: tDefaultPadding),
            child: Text(
              tChildrenText,
              style: Theme.of(context).textTheme.headlineMedium?.apply(
                color: tDarkColor.withOpacity(0.5)
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Text(
                  tChild1,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),

      const Spacer(),

       Container(
                  margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(tSmallRadius),
                      border: Border.all(
                        color: greyColor,
                        width: 2.0,
                      )),
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: tSmallPadding + tDefaultElevation,
                          vertical: tSmallPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(hotelRoomsController.child1.value.toString()),
                          const Icon(Icons.arrow_drop_down_outlined)
                        ],
                      ),
                    ),
                    onTap: () => showMaterialNumberPicker(
                      context: context,
                      title: tSelectAge,
                      maxNumber: 11,
                      minNumber: 0,
                      step: 1,
                      confirmText: tConfirm,
                      cancelText: tCancel,
                      headerColor: tPrimaryColor,
                      headerTextColor: tWhiteColor,
                      selectedNumber: hotelRoomsController.child1.value,
                      onChanged: (value) =>
                          hotelRoomsController.setChild(value),
                    ),
                  ),
                ),
            ],
          ),

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Text(
                  tChild2,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),

              const Spacer(),

       Container(

                  margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(tSmallRadius),
                      border: Border.all(
                        color: greyColor,
                        width: 2.0,
                      )),
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: tSmallPadding + tDefaultElevation,
                          vertical: tSmallPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(hotelRoomsController.child2.value.toString()),
                          const Icon(Icons.arrow_drop_down_outlined)
                        ],
                      ),
                    ),
                    onTap: () => showMaterialNumberPicker(
                      context: context,
                      title: tSelectAge,
                      maxNumber: 11,
                      minNumber: 0,
                      step: 1,
                      confirmText: tConfirm,
                      cancelText: tCancel,
                      headerColor: tPrimaryColor,
                      headerTextColor: tWhiteColor,
                      selectedNumber: hotelRoomsController.child2.value,
                      onChanged: (value) =>
                          hotelRoomsController.setChild2(value),
                    ),
                  ),
                ),
            ],
          ),

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Text(
                  tChild3,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),

              const Spacer(),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(tSmallRadius),
                    border: Border.all(
                      color: greyColor,
                      width: 2.0,
                    )),
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: tSmallPadding + tDefaultElevation,
                        vertical: tSmallPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(hotelRoomsController.child3.value.toString()),
                        const Icon(Icons.arrow_drop_down_outlined)
                      ],
                    ),
                  ),
                  onTap: () => showMaterialNumberPicker(
                    context: context,
                    title: tSelectAge,
                    maxNumber: 11,
                    minNumber: 0,
                    step: 1,
                    confirmText: tConfirm,
                    cancelText: tCancel,
                    headerColor: tPrimaryColor,
                    headerTextColor: tWhiteColor,
                    selectedNumber: hotelRoomsController.child3.value,
                    onChanged: (value) =>
                        hotelRoomsController.setChild3(value),
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Text(
                  tChild4,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),

             const Spacer(),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(tSmallRadius),
                    border: Border.all(
                      color: greyColor,
                      width: 2.0,
                    )),
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: tSmallPadding + tDefaultElevation,
                        vertical: tSmallPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(hotelRoomsController.child4.value.toString()),
                        const Icon(Icons.arrow_drop_down_outlined)
                      ],
                    ),
                  ),
                  onTap: () => showMaterialNumberPicker(
                    context: context,
                    title: tSelectAge,
                    maxNumber: 11,
                    minNumber: 0,
                    step: 1,
                    confirmText: tConfirm,
                    cancelText: tCancel,
                    headerColor: tPrimaryColor,
                    headerTextColor: tWhiteColor,
                    selectedNumber: hotelRoomsController.child4.value,
                    onChanged: (value) =>
                        hotelRoomsController.setChild4(value),
                  ),
                ),
              ),
            ],
          ),




        ],
      );
}
