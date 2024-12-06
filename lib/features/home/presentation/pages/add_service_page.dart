// Importa o pacote Flutter para criar a interface do usuário.
import 'package:flutter/material.dart';

// Classe `AddServicePage`.
// Representa uma página para adicionar um novo serviço.
// Recebe uma função de callback `onAddService` para processar os dados do serviço.
class AddServicePage extends StatefulWidget {
  // Função de callback chamada ao adicionar um serviço.
  // Recebe o nome, preço e categoria do serviço.
  final Function(String name, double price, String category) onAddService;

  // Construtor da classe `AddServicePage`.
  // `onAddService` é obrigatório e deve ser fornecido ao instanciar a página.
  const AddServicePage({
    super.key,
    required this.onAddService,
  });

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

// Classe privada `_AddServicePageState`.
// Gerencia o estado da página e lida com a lógica do formulário.
class _AddServicePageState extends State<AddServicePage> {
  // Chave do formulário para validação.
  final _formKey = GlobalKey<FormState>();

  // Controladores para capturar os valores dos campos de texto.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  // Categoria selecionada no dropdown. Valor inicial é "Geral".
  String _selectedCategory = 'Geral';

  // Método `dispose` para limpar os controladores ao descartar a página.
  @override
  void dispose() {
    _nameController.dispose(); // Libera o controlador do nome.
    _priceController.dispose(); // Libera o controlador do preço.
    super.dispose();
  }

  // Método `_submit` para processar os dados do formulário.
  void _submit() {
    // Verifica se o formulário é válido.
    if (_formKey.currentState!.validate()) {
      // Chama a função `onAddService` com os dados do formulário.
      widget.onAddService(
        _nameController.text, // Nome do serviço.
        double.parse(_priceController.text), // Preço do serviço.
        _selectedCategory, // Categoria selecionada.
      );
      // Fecha a página e retorna para a anterior.
      Navigator.pop(context);
    }
  }

  // Método `build` para construir a interface do usuário.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estrutura principal da página com uma AppBar.
      appBar: AppBar(
        title: const Text('Adicionar Serviço'),
      ),
      body: Padding(
        // Adiciona espaçamento interno ao redor do formulário.
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Define a chave do formulário para validação.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campo de texto para o nome do serviço.
              TextFormField(
                controller: _nameController, // Controlador do campo.
                decoration: const InputDecoration(
                    labelText: 'Nome do Serviço'), // Rótulo.
                validator: (value) {
                  // Validação do campo. Verifica se o valor não está vazio.
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do serviço';
                  }
                  return null; // Retorna nulo se a validação passar.
                },
              ),
              const SizedBox(height: 16), // Espaçamento vertical.

              // Campo de texto para o preço do serviço.
              TextFormField(
                controller: _priceController, // Controlador do campo.
                decoration:
                    const InputDecoration(labelText: 'Preço (R\$)'), // Rótulo.
                keyboardType:
                    TextInputType.number, // Define o teclado numérico.
                validator: (value) {
                  // Validação do campo. Verifica se o valor não está vazio e é numérico.
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o preço do serviço';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Insira um valor numérico válido';
                  }
                  return null; // Retorna nulo se a validação passar.
                },
              ),
              const SizedBox(height: 16), // Espaçamento vertical.

              // Dropdown para selecionar a categoria do serviço.
              DropdownButtonFormField<String>(
                value: _selectedCategory, // Valor inicial da categoria.
                items: const [
                  // Opções disponíveis no dropdown.
                  DropdownMenuItem(value: 'Geral', child: Text('Geral')),
                  DropdownMenuItem(value: 'Estética', child: Text('Estética')),
                  DropdownMenuItem(value: 'Mecânica', child: Text('Mecânica')),
                  DropdownMenuItem(value: 'Outros', child: Text('Outros')),
                ],
                onChanged: (value) {
                  // Atualiza o estado ao selecionar uma nova categoria.
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
                decoration:
                    const InputDecoration(labelText: 'Categoria'), // Rótulo.
              ),
              const Spacer(), // Adiciona um espaçamento flexível.

              // Botão para adicionar o serviço.
              ElevatedButton(
                onPressed: _submit, // Chama o método `_submit` ao pressionar.
                child: const Text('Adicionar'), // Texto exibido no botão.
              ),
            ],
          ),
        ),
      ),
    );
  }
}
