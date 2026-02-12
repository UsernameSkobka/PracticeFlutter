import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommaTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate (TextEditingValue oldValue, TextEditingValue newValue) {
    String truncated = newValue.text;
    final TextSelection newSelection = newValue.selection;

    if (newValue.text.contains(',')) {
      truncated = newValue.text.replaceFirst(',', '.');
    } 
    return TextEditingValue(text: truncated, selection: newSelection);
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final loginTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();

  String? selectedValue;
  bool? checkboxValue = null;
  String radioValue = 'Radio 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: TextFormField(
                    controller: loginTextFieldController,
                    inputFormatters: [
                      CommaTextInputFormatter()
                    ],
                    decoration: const InputDecoration(hintText: 'Логин'),
                    validator: (value) {
                      if(value==null || value.isEmpty) {
                        return 'Введите логин';
                      }
                      return null;
                    },
                  )),
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: TextFormField(
                    controller: passwordTextFieldController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(4)
                    ],
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Пароль'),
                    validator: (value) {
                      if(value==null || value.isEmpty) {
                        return 'Введите пароль';
                      }
                      return null;
                    },
                  )),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(child: DropdownButtonFormField(
                    value: selectedValue,
                    items: const [
                      DropdownMenuItem(value: 'USA', child: Text('USA', style: TextStyle(color: Colors.redAccent),)),
                      DropdownMenuItem(value: 'Canada', child: Text('Canada')),
                      DropdownMenuItem(value: 'Brazil', child: Text('Brazil')),
                      DropdownMenuItem(value: 'England', child: Text('England'))
                    ], 
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    }
                    )
                  )
                ]
              ),
              Padding(padding: EdgeInsets.all(8.0),
                child: Checkbox(
                  value: checkboxValue, 
                  tristate: true,
                  onChanged: (value) {
                      setState(() {
                        checkboxValue = value ?? false;
                      }
                    );
                  }
                ),
              ),
              Padding(padding: EdgeInsets.all(8.0),
                child: Radio(
                  groupValue: radioValue,
                  value: 'Radio 1', 
                  onChanged: (value) {
                      setState(() {
                        radioValue = value ?? '';
                      }
                    );
                  }
                ),
              ),Padding(padding: EdgeInsets.all(8.0),
                child: Radio(
                  groupValue: radioValue,
                  value: 'Radio 2', 
                  onChanged: (value) {
                      setState(() {
                        radioValue = value ?? '';
                      }
                    );
                  }
                ),
              ),Padding(padding: EdgeInsets.all(8.0),
                child: Radio(
                  groupValue: radioValue,
                  value: 'Radio 3', 
                  onChanged: (value) {
                      setState(() {
                        radioValue = value ?? '';
                      }
                    );
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(onPressed: submitForm, child: Text('Войти'))
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }

  void submitForm() async {
    if(formKey.currentState?.validate() ?? false) {
      //print(loginTextFieldController.text);
      //print(passwordTextFieldController.text);

      if (formKey.currentState?.validate() ?? false) {
        /*final result = await showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: Text('Данные Формы'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Логин: ${loginTextFieldController.text}'),
                Text('Пароль: ${passwordTextFieldController.text}')
              ],
            ),
            actions: [
              ElevatedButton(onPressed: () {
                Navigator.of(context).pop(true);
              }, child: Text('Ок')),
              ElevatedButton(onPressed: () {
                  Navigator.of(context).pop();
              }, child: Text('Отмена'))
            ],
          );
        });
        print(result);*/

        final snackBar = SnackBar(content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Логин: ${loginTextFieldController.text}'),
                Text('Пароль: ${passwordTextFieldController.text}')
              ],
            ),
            action: SnackBarAction(label: 'ok', onPressed: () {}),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}