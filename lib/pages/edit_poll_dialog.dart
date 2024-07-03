import 'package:flutter/material.dart';

class EditPollDialog extends StatefulWidget {
  final String question;
  final List<String> options;

  const EditPollDialog({Key? key, required this.question, required this.options}) : super(key: key);

  @override
  _EditPollDialogState createState() => _EditPollDialogState();
}

class _EditPollDialogState extends State<EditPollDialog> {
  late TextEditingController _questionController;
  late List<TextEditingController> _optionControllers;

  @override
  void initState() {
    super.initState();
    _questionController = TextEditingController(text: widget.question);
    _optionControllers = widget.options.map((option) => TextEditingController(text: option)).toList();
  }

  @override
  void dispose() {
    _questionController.dispose();
    for (var controller in _optionControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Modifier le sondage'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: InputDecoration(labelText: 'Question'),
            ),
            SizedBox(height: 10),
            ..._optionControllers.map((controller) {
              return TextField(
                controller: controller,
                decoration: InputDecoration(labelText: 'Option'),
              );
            }).toList(),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                setState(() {
                  _optionControllers.add(TextEditingController());
                });
              },
              child: Text('Ajouter une option'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Annuler'),
        ),
        TextButton(
          onPressed: () {
            List<String> updatedOptions = _optionControllers.map((controller) => controller.text).toList();
            Navigator.of(context).pop({
              'question': _questionController.text,
              'options': updatedOptions,
            });
          },
          child: Text('Enregistrer'),
        ),
      ],
    );
  }
}
