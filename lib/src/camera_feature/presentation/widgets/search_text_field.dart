import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mad_test_work/core/extensions/string_exttensions.dart';
import 'package:mad_test_work/src/colors/app_colors.dart';

/// A custom [TextFormField] widget that provides a search input field with a search icon and a clear button.
///
/// The [SearchTextField] widget is a stateless widget that takes a required [onChanged] callback function as a parameter.
/// This callback is called whenever the user types into the search field, passing the current search text as an argument.
///
/// The widget uses [FormField] to manage the state of the search text, and applies a custom [InputDecoration] to the [TextFormField]
/// to provide the desired visual appearance, including a search icon and a clear button.
///
/// The [preferredSize] getter returns a [Size] of 100 height, which can be used to size the widget appropriately in a layout.

class SearchTextField extends StatelessWidget implements PreferredSizeWidget {
  final Function(String value)? onChanged;
  const SearchTextField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: FormField(
        builder: (field) {
          return TextFormField(
            decoration: InputDecoration(
              fillColor: AppColors.listTileBackgroundColor,
              filled: true,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: SvgPicture.asset(
                'assets/svg/search_postfix_icon.svg',
                height: 24,
                width: 24,
                fit: BoxFit.none,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              labelText: 'Найти...'.hardcoded,
            ),
            onChanged: onChanged,
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
