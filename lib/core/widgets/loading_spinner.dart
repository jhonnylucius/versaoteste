// Importa o pacote Flutter Material, que fornece widgets e classes fundamentais para criar a interface do usuário.
import 'package:flutter/material.dart';

// Declaração da classe `LoadingSpinner`, que é um widget customizado para exibir
// um indicador de carregamento (spinner) com configurações personalizáveis.
class LoadingSpinner extends StatelessWidget {
  // Propriedade opcional que define a cor do indicador de carregamento.
  // O valor padrão é `Colors.blue`.
  final Color color;

  // Propriedade opcional que define o tamanho do indicador de carregamento.
  // O valor padrão é `50.0` pixels (largura e altura).
  final double size;

  // Construtor da classe, que inicializa as propriedades.
  // Propriedades `color` e `size` são opcionais e possuem valores padrão.
  const LoadingSpinner({
    this.color = Colors.blue, // Cor padrão do indicador.
    this.size = 50.0, // Tamanho padrão do indicador.
    super.key, // Passa a chave para o construtor pai, `StatelessWidget`.
  });

  // O método `build` é responsável por construir o widget.
  @override
  Widget build(BuildContext context) {
    // Retorna um widget `Center`, que centraliza o filho no eixo horizontal e vertical.
    return Center(
      child: SizedBox(
        // Define a largura do indicador com base na propriedade `size`.
        width: size,
        // Define a altura do indicador com base na propriedade `size`.
        height: size,
        // Usa o widget `CircularProgressIndicator` para exibir o spinner de carregamento.
        child: CircularProgressIndicator(
          // Define a cor do indicador de carregamento.
          // O `AlwaysStoppedAnimation` garante que a cor permaneça constante.
          valueColor: AlwaysStoppedAnimation<Color>(color),
          // Define a largura do traço (stroke) do indicador.
          strokeWidth: 4.0,
        ),
      ),
    );
  }
}
