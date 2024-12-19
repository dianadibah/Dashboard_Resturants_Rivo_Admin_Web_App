import 'package:flutter/material.dart';

import '../../../../../../core/constant/colors.dart';

class CustomDropDownCities extends StatelessWidget {
  final String typeCity;
  final void Function(String?) onChanged;
  const CustomDropDownCities(
      {super.key, required this.typeCity, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: DropdownButtonFormField(
          alignment: Alignment.center,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
              filled: true,
              fillColor: AppColors.secoundColorOne.withOpacity(0.7),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none)),
          items: [
            "حلب",
            "دمشق",
            "حسكة",
            "سويداء",
            "حمص",
            "حماه",
            "درعا",
          ]
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: const TextStyle(
                          fontFamily: "ArbFONTS-Almarai-Light.ttf"),
                    ),
                  ))
              .toList(),
          value: typeCity,
          onChanged: onChanged),
    );
  }
}
