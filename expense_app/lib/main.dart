import 'package:expense_app/common/constants.dart';
import 'package:expense_app/widget/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
      colorScheme: Constant.kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: Constant.kColorScheme.onPrimaryContainer,
        foregroundColor: Constant.kColorScheme.primaryContainer,
      ),
      cardTheme: CardTheme().copyWith(
        color: Constant.kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Constant.kColorScheme.primaryContainer,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: Constant.kColorScheme.onSecondaryContainer,
            fontSize: 14,
          )),
    ),
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: Constant.kDarkColorScheme,
    ),
    // themeMode: ThemeMode.dark,
    home: const Expenses(),
  ));
}
