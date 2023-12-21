import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:flutter/material.dart';

class FilterItemHolder extends StatelessWidget {
  final String title;
  final String value;
  final Widget? child;

  FilterItemHolder({Key? key, required this.title, this.value = '', this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: const  BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius:  BorderRadius.all(const Radius.circular(5.0)),
      ),
      child: Column(
        children: [
          Container(
            //margin: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 12.0),
            padding: const EdgeInsets.symmetric(vertical: tSmallPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: tSmallPadding,horizontal: tSmallPadding),
                  decoration: BoxDecoration(

                    color: chromeGrey,
                    borderRadius: BorderRadius.circular(tDefaultRadius),
                  ),
                  child: Text(
                    value,
                    style:Theme.of(context).textTheme.headlineSmall?.apply(
                      color: tDarkColor.withOpacity(0.6)
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 47.0,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  final titleTextStyle = TextStyle(
    color: const Color(0xFF000000),
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
  );
}