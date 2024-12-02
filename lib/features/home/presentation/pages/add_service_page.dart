import 'package:flutter/material.dart';

class AddServicePage extends StatefulWidget {
  const AddServicePage({super.key});

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newService = {
        'name': _nameController.text,
        'category': _categoryController.text,
        'price': double.parse(_priceController.text),
        'duration': int.parse(_durationController.text),
      };
      Navigator.pop(context, newService);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Serviço'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome do Serviço'),
                validator: (value) => value!.isEmpty
                    ? 'Por favor, insira o nome do serviço'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(labelText: 'Categoria'),
                validator: (value) =>
                    value!.isEmpty ? 'Por favor, insira a categoria' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty
                    ? 'Por favor, insira o preço'
                    : (double.tryParse(value) == null
                        ? 'Por favor, insira um número válido'
                        : null),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _durationController,
                decoration:
                    const InputDecoration(labelText: 'Duração (minutos)'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty
                    ? 'Por favor, insira a duração'
                    : (int.tryParse(value) == null
                        ? 'Por favor, insira um número válido'
                        : null),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Salvar Serviço'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
