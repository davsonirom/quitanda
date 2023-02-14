// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  const TextForm({
    Key? key,
    required this.label,
    required this.icon,
    this.eSecreto = false,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final bool eSecreto;

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  bool isObscure = false;

  @override
  void initState() {
    isObscure = widget.eSecreto;
    super.initState();
  }

  escondeEsconde() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText: isObscure,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.eSecreto
              ? IconButton(
                  onPressed: escondeEsconde,
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off))
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: widget.label,
        ),
      ),
    );
  }
}
