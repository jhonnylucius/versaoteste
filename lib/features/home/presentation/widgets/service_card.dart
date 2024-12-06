import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final Map<String, dynamic>
      service; // Mapa que contém os dados do serviço (nome, categoria, preço, etc.).
  final VoidCallback onTap; // Callback acionado quando o cartão é tocado.

  const ServiceCard({
    super.key,
    required this.service, // Serviço obrigatório fornecido como um mapa.
    required this.onTap, // Função obrigatória chamada no toque.
    required providerName, // Nome do prestador de serviço, exigido mas não usado diretamente aqui.
    required serviceName, // Nome do serviço, exigido mas não usado diretamente aqui.
    required price, // Preço do serviço, exigido mas não usado diretamente aqui.
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Aciona a função passada ao tocar no cartão.
      child: Card(
        margin: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0), // Define margens externas ao cartão.
        elevation: 4, // Altura do cartão, gerando sombra para destacar.
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12.0), // Arredonda as bordas do cartão.
        ),
        child: Padding(
          padding: const EdgeInsets.all(
              16.0), // Espaçamento interno ao redor do conteúdo do cartão.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .start, // Alinha os itens ao início (esquerda).
            children: [
              Text(
                service['name'], // Exibe o nome do serviço, obtido do mapa.
                style: Theme.of(context)
                    .textTheme
                    .titleLarge, // Aplica estilo de título grande baseado no tema.
              ),
              const SizedBox(
                  height:
                      8), // Adiciona espaçamento vertical entre os elementos.

              Text(
                service[
                    'category'], // Exibe a categoria do serviço, obtida do mapa.
                style: Theme.of(context)
                    .textTheme
                    .titleMedium, // Aplica estilo de título médio baseado no tema.
              ),
              const SizedBox(height: 8), // Mais um espaçamento vertical.

              Text(
                'Preço: R\$${service['price']}', // Exibe o preço formatado do serviço.
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium, // Aplica estilo de corpo médio baseado no tema.
              ),
              const SizedBox(
                  height: 16), // Espaçamento maior antes da linha seguinte.

              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Distribui os itens entre as extremidades.
                children: [
                  Text(
                    '${service['duration']} min', // Exibe a duração do serviço.
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall, // Aplica estilo de corpo pequeno baseado no tema.
                  ),
                  const Icon(
                    Icons
                        .arrow_forward, // Ícone de seta para frente, indicando que o cartão é interativo.
                    color: Colors
                        .blue, // Cor azul para o ícone, destacando-o visualmente.
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
