import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:go_router/go_router.dart';
import 'package:rivo_admin_app/core/models/device_info.dart';
import 'package:rivo_admin_app/features/index_resturants/presentation/screens/widget/add_resturant_dialog/dialog_button.dart';
import 'package:rivo_admin_app/features/resturant_create_update/presntation/bloc/resturant_create_update_bloc.dart';

class CustomDialogColorPicker extends StatefulWidget {
  final DeviceInfo deviceInfo;
  const CustomDialogColorPicker({super.key, required this.deviceInfo});

  @override
  State<CustomDialogColorPicker> createState() =>
      _CustomDialogColorPickerState();
}

class _CustomDialogColorPickerState extends State<CustomDialogColorPicker> {
  late ResturantCreateUpdateBloc bloc;

  @override
  void initState() {
    bloc = ResturantCreateUpdateBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=> bloc,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child:
            BlocBuilder<ResturantCreateUpdateBloc, ResturantCreateUpdateState>(
                builder: (context, state) {
          return ListTile(
            title: const Text("اللون"),
            trailing: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: state.currentColor,
              ),
              width: 30,
              height: 30,
            ),
            // isThreeLine: true,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("اختر اللون"),
                      actions: [
                        CustomDialogButton(
                          text: "اختيار",
                          deviceInfo: widget.deviceInfo,
                          onPressed: () {
                          bloc.add(ChangeColorEvent(currentColor: state.pickerColor));

                            context.pop();
                          },
                        )
                      ],
                      content: ColorPicker(
                        onColorChanged: (val) {
                          bloc.add(ChangeColorEvent(pickerColor: val));

                        },
                        pickerColor: state.pickerColor,
                      ),
                    );
                  });
            },
            subtitle: Text(state.pickerColor.toString()),
          );
        }),
      ),
    );
  }
}
