import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_10/cubit/color_cubit.dart';

final colorCubit = ColorCubit();

class CubitPage extends StatelessWidget {
  const CubitPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: colorCubit,
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: BlocConsumer<ColorCubit, ColorState>(
              listener: (context, state) {
              print(state.color);    
            }, 
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    width: 400,
                    height: 400,
                    color: state.color,
                    child: Column(
                      children: [
                        Text(state.color.toString()),
                        ElevatedButton(
                          onPressed: () {
                            context.read<ColorCubit>().newRandomColor();
                          },
                          child: Text("Set random color"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.read<ColorCubit>().resetColor();
                          },
                          child: Text("Reset color"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("/second");
                          },
                          child: Text("Second page"),
                        ),
                      ],
                    ),
                  ),
                  ColorPicker(
                    color: state.color,
                    onColorChanged: (color) {
                      context.read<ColorCubit>().newColor(color);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    ),);
  }
}