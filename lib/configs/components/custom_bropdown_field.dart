import '../configs.dart';
import 'package:flutter/material.dart';

class Normaldropdown extends StatelessWidget {
  // dropdown menu shadow elevation
  final int elevation;

  // dropdown hint text
  final String hintText;

  // dropdown selected text
  final String? selectedText;

  // dropdown items height
  final double itemHeight;

  // dropdown background border width
  final double borderWidth;

  // dropdown hint text style
  final VoidCallback? onTap;

  // dropdown menu max width
  final double menuMaxWidth;

  // dropdown menu max height
  final double menuMaxHeight;

  // dropdown background left border radius
  final double radiusTopLeft;

  // dropdown width
  final double dropDownWidth;

  // dropdown height
  final double dropDownHeight;

  // dropdown icon
  final IconData dropDownIcon;

  // dropdown background right border radius
  final double radiusTopRight;

  // dropdown icon size
  final double dropDownIconSize;

  // dropdown icon color
  final Color dropDownIconColor;

  // dropdown background left border radius
  final double radiusBottomLeft;

  // dropdown background right border radius
  final double radiusBottomRight;

  // hint text style
  final TextStyle hintTextStyle;

  // dropdown background border color
  final Color dropDownBorderColor;

  // selected item text style
  final TextStyle selectTextStyle;

  // dropdown background color
  final Color dropDownBackgroundColor;

  // dropdown menu text style
  final TextStyle dropDownTextStyle;

  // dropdown items
  final List<String> dropdownItems;

  // dropdown menu radius
  final BorderRadius dropDownItemRadius;

  // padding for dropdown items
  final EdgeInsetsGeometry padding;

  // icon padding for dropdown items
  final EdgeInsetsGeometry? iconPadding;

  // dropdown change value function
  final ValueChanged<String?>? onChange;

  // dropdown change value function
  final Widget? widgetIcon;

  const Normaldropdown({
    super.key,
    this.onTap,
    this.elevation = 4,
    this.borderWidth = 2,
    this.itemHeight = 50,
    this.menuMaxWidth = 300,
    this.radiusTopLeft = 10,
    this.dropDownHeight = 60,
    this.dropDownWidth = 350,
    this.menuMaxHeight = 400,
    this.radiusTopRight = 10,
    this.dropDownIconSize = 20,
    this.radiusBottomLeft = 10,
    this.radiusBottomRight = 10,
    required this.dropdownItems,
    this.hintText = "Select an item",
    this.selectedText,
    this.widgetIcon,
    this.dropDownIconColor = Colors.black,
    this.dropDownIcon = Icons.arrow_drop_down,
    this.dropDownBorderColor = Colors.deepOrange,
    this.dropDownBackgroundColor = Colors.orangeAccent,
    this.dropDownItemRadius = const BorderRadius.all(Radius.circular(10)),
    this.padding = const EdgeInsets.all(10),
    this.onChange,
    this.iconPadding,
    this.dropDownTextStyle = const TextStyle(
      fontSize: 12,
      color: ThemeConfig.primaryColor,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none,
      decorationThickness: 0,
    ),
    this.selectTextStyle = const TextStyle(
      fontSize: 12,
      color: ThemeConfig.primaryColor,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none,
      decorationThickness: 0,
    ),
    this.hintTextStyle = const TextStyle(
      fontSize: 12,
      color: ThemeConfig.primaryColor,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none,
      decorationThickness: 0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: dropDownHeight,
        width: dropDownWidth,
        decoration: BoxDecoration(
          color: dropDownBackgroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(radiusTopRight),
            topLeft: Radius.circular(radiusTopLeft),
            bottomLeft: Radius.circular(radiusBottomLeft),
            bottomRight: Radius.circular(radiusBottomRight),
          ),
          border: Border.all(
            color: dropDownBorderColor,
            width: borderWidth,
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            widgetIcon ??
                SizedBox(
                  width: 40,
                ),
            SizedBox(
              width: 6,
            ),
            Expanded(child: dropDownWidget())
          ],
        ));
  }

  dropDownWidget() {
    selectedItemBuilder(BuildContext context) => dropdownItems
        .map(
          (item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: item == selectedText ? selectTextStyle : dropDownTextStyle,
            ),
          ),
        )
        .toList();
    List<DropdownMenuItem<String>> items = dropdownItems
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style:
                    item == selectedText ? selectTextStyle : dropDownTextStyle,
              ),
            ))
        .toList();
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        onTap: onTap,
        items: items,
        isDense: true,
        padding: padding,
        elevation: elevation,
        itemHeight: itemHeight,
        style: selectTextStyle,
        menuWidth: menuMaxWidth,
        menuMaxHeight: menuMaxHeight,
        borderRadius: dropDownItemRadius,
        selectedItemBuilder: selectedItemBuilder,
        hint: Text(hintText, style: hintTextStyle),
        value: selectedText,
        icon: Padding(
          padding: iconPadding ?? const EdgeInsets.all(0),
          child: Icon(
            dropDownIcon,
            color: dropDownIconColor,
            size: dropDownIconSize,
          ),
        ),
        onChanged: onChange,
      ),
    );
  }
}
