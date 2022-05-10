import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const double BUTTON_RADIUS = 20.0;
const double INPUT_RADIUS = 20.0;
class Themes{
  static final light = ThemeData.light().copyWith(
    iconTheme: const IconThemeData(
      color: Colors.black54
    ),

    backgroundColor: Colors.white,
    primaryColor: IColor().LIGHT_PRIMARY_COLOR,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: IColor().LIGHT_ACCENT_COLOR,
    ),
    elevatedButtonTheme:ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(

          padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20),
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BUTTON_RADIUS),),
          //
        primary: IColor().LIGHT_ACCENT_COLOR,
          onPrimary: Colors.black54,
          textStyle: const TextStyle(fontWeight: FontWeight.bold)
          // backgroundColor: MaterialStateProperty.all<Color>(IColor().LIGHT_ACCENT_COLOR)
      )
    ),
    textTheme: const TextTheme(
      subtitle1: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border:OutlineInputBorder(
        borderRadius: BorderRadius.circular(INPUT_RADIUS),
        borderSide: BorderSide.none
      ),
      filled: true,
      fillColor: IColor().LIGHT_INPUT_COLOR,
    )
  );
  static final dark = ThemeData.dark().copyWith(
      iconTheme: const IconThemeData(
          color: Colors.white54
      ),
      brightness: Brightness.dark,
      backgroundColor: Colors.black54,
      primaryColor: IColor().DARK_PRIMARY_COLOR,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: IColor().DARK_PRIMARY_COLOR,
      ),
      elevatedButtonTheme:ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(

              padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20),
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(BUTTON_RADIUS),),
              //
              primary: IColor().DARK_ACCENT_COLOR,
              onPrimary: Colors.black87,
              textStyle: const TextStyle(fontWeight: FontWeight.bold)
            // backgroundColor: MaterialStateProperty.all<Color>(IColor().LIGHT_ACCENT_COLOR)
          )
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white54,fontWeight: FontWeight.bold),

      ),
      inputDecorationTheme: InputDecorationTheme(
        border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(INPUT_RADIUS),
            borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: IColor().DARK_INPUT_COLOR,
      )
  );
}
class IColor{
  Color LIGHT_PRIMARY_COLOR = Colors.deepOrange;
  Color LIGHT_ACCENT_COLOR = Colors.orange;
  Color LIGHT_TEXT_COLOR = Colors.black54;
  Color LIGHT_INPUT_COLOR = Colors.black26.withOpacity(0.1);
  Color LIGHT_ICON_COLOR = Colors.black26.withOpacity(0.1);

  Color DARK_PRIMARY_COLOR = Colors.blue;
  Color DARK_ACCENT_COLOR = Colors.lightBlueAccent;
  Color DARK_TEXT_COLOR = Colors.white38;
  Color DARK_INPUT_COLOR = Colors.black26;
}