import 'package:flutter/material.dart';

class FocusForm extends StatefulWidget {
  const FocusForm({super.key});

  @override
  State<FocusForm> createState() => _FocusFormState();
}

class _FocusFormState extends State<FocusForm> {
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(children: [Expanded(child: TextFormField(autofocus: true))]),
            Focus(
              onFocusChange: (value) {
                print("value");
              },
              child: Row(
                children: [
                  Expanded(child: TextFormField(focusNode: focusNode)),
                ],
              ),
            ),
            Row(children: [Expanded(child: TextFormField())]),
            Row(children: [Expanded(child: TextFormField())]),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      focusNode.requestFocus();
                    },
                    child: Text("Фокус на второе поле"),
                  ),
                ),
              ],
            ),

            FocusTraversalGroup(
              policy: OrderedTraversalPolicy(),
              child: Column(
                children: [
                  FocusTraversalOrder(
                    child: Row(children: [Expanded(child: TextFormField())]),
                    order: NumericFocusOrder(2), //порядок задаётся номером. в LexicalFocusOrder порядок задаётся буквой
                  ),
                  FocusTraversalOrder(
                    child: Row(children: [Expanded(child: TextFormField())]),
                    order: NumericFocusOrder(3),
                  ),
                  FocusTraversalOrder(
                    child: Row(children: [Expanded(child: TextFormField())]),
                    order: NumericFocusOrder(1),
                  ),
                  Row(children: [Expanded(child: TextFormField())]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}