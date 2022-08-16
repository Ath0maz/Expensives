import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransactionForm extends StatelessWidget {
  final titlecontroller = TextEditingController();
  final valuecontroller = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titlecontroller,
              decoration: InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              controller: valuecontroller,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Nova Transação',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  final title = titlecontroller.text;
                  final value = double.tryParse(valuecontroller.text) ?? 0.0;
                  onSubmit(title, value);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
