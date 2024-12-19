import 'package:flutter/material.dart';

import '../../../../../../core/constant/colors.dart';

class CustomTypeMenu extends StatelessWidget {
  final void Function(String?)? onChanged;
  final String typeMenu;
  const CustomTypeMenu(
      {super.key, required this.onChanged, required this.typeMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: DropdownButtonFormField(
         
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
              filled: true,
          
              fillColor: AppColors.secoundColorOne.withOpacity(0.7),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none)),
          items: [
          "1","2","3"
          ]
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e=="1"?"النموذج الأول":e=="2"?"النموذج الثاني":"النموذج الثالث"),
                  ))
              .toList(),
          value: typeMenu,
          onChanged: onChanged),
    );
  }
}
