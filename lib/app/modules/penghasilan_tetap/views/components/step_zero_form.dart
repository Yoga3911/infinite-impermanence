import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class StepZeroForm extends StatelessWidget {
  const StepZeroForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Column(
        children: <Widget>[
          const Text(
            'Pilih Debitur',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Pilih Debitur yang ingin di ajukan untuk pengajuan penghasilan tetap',
            style: TextStyle(
              color: Colors.grey,
              overflow: TextOverflow.fade,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          FormBuilderDropdown(
            decoration: const InputDecoration(
              labelText: 'Pilih Debitur',
              border: OutlineInputBorder(),
              labelStyle: TextStyle(fontSize: 18),
            ),
            name: 'Nama Debitur',
            items: ['Item 1', 'Item 2', 'Item 3'].map((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
