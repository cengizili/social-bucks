import 'package:flutter/material.dart';
import 'package:iban/iban.dart';  // Make sure to add the iban package to your pubspec.yaml

class IbanField extends StatefulWidget {
  final Function(String?)? onSaved;
  final String? initialValue;

  const IbanField({Key? key, this.onSaved, this.initialValue}) : super(key: key);

  @override
  _IbanFieldState createState() => _IbanFieldState();
}

class _IbanFieldState extends State<IbanField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _controller.addListener(formatIban);
  }

  @override
  void dispose() {
    _controller.removeListener(formatIban);
    _controller.dispose();
    super.dispose();
  }

  void formatIban() {
    String value = _controller.text.toUpperCase().replaceAll(' ', '');
    String newIban = '';
    for (int i = 0; i < value.length; i += 4) {
      if (i > 0) newIban += ' ';
      newIban += value.substring(i, (i + 4 < value.length) ? i + 4 : value.length);
    }
    if (newIban != _controller.text) {
      _controller.value = TextEditingValue(
        text: newIban,
        selection: TextSelection.collapsed(offset: newIban.length),
      );
    }
  }

  bool isValidIban(String? iban) {
    return isValid(iban ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Enter IBAN',
        hintText: 'DE89 3704 0044 0532 0130 00',
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || !isValidIban(value)) {
          return 'Please enter a valid IBAN';
        }
        return null;
      },
      onSaved: widget.onSaved,
    );
  }
}
