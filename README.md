
# 📅 AgendaPro - Solução de Agendamentos Inteligente

AgendaPro é um aplicativo voltado para agendamento e gestão de serviços, ideal para clientes e prestadores que desejam centralizar e simplificar suas interações. Este projeto foi desenvolvido utilizando **Flutter** com **Dart** e se destaca pela organização modular e estrutura profissional, garantindo escalabilidade e facilidade de manutenção.

---

## 📋 Funcionalidades Principais

### Para Clientes:
- **Login e Cadastro**:
  - Autenticação via Google, Facebook e e-mail/senha.
  - Registro e edição de perfil (dados pessoais, preferências, etc.).

- **Exploração de Prestadores**:
  - Tela com cartões interativos exibindo os serviços disponíveis.
  - Filtros para categorias, preços, horários, e localização.

- **Gerenciamento de Agendamentos**:
  - Histórico de agendamentos realizados.
  - Opções para **remarcar**, **cancelar** e adicionar **justificativas** (ex.: imprevisto, motivo pessoal).

- **Avaliação de Serviços**:
  - Sistema de avaliação com estrelas (1 a 5) e comentários.
  - Favoritar prestadores para facilitar novos agendamentos.

### Para Prestadores:
- **Cadastro de Serviços**:
  - Definição de preços, horários disponíveis, especialidades e descrições detalhadas.
  - Criação de um cartão digital exibido para os clientes.

- **Painel de Administração**:
  - Gerenciamento completo da agenda, incluindo filtros avançados.
  - Relatórios financeiros detalhados:
    - Renda total gerada pelo app.
    - Quantidade de serviços realizados.
  - Controle de disponibilidade:
    - Bloquear horários, reagendar ou atender múltiplos clientes em um mesmo período.

- **Comunicação com Clientes**:
  - Notificações automáticas para confirmar, cancelar ou remarcar serviços.
  - Justificativas opcionais para cada ação administrativa.

### Segurança e Privacidade:
- Dados dos usuários compartilhados **apenas após a confirmação do agendamento**.
- Exclusão de conta com conformidade à LGPD:
  - Termos de exclusão acessíveis e opção de download de dados antes da exclusão.

---

## 📂 Estrutura do Projeto

### 🌟 Modularização:
O app foi desenvolvido seguindo as melhores práticas de arquitetura limpa (Clean Architecture), com separação clara de responsabilidades em camadas:

1. **Core**: Contém constantes globais, temas, widgets reutilizáveis e utilitários.
2. **Features**:
   - **Auth**: Gerencia autenticação, login e registro.
   - **Home**: Funcionalidades principais de clientes e prestadores.
   - **Navigation**: Serviços e rotas de navegação.
   - **Settings**: Configurações de conta e preferências.

### 🌲 Estrutura de Diretórios:
```plaintext
lib/
├── core/
│   ├── constants/
│   ├── themes/
│   ├── utils/
│   └── widgets/
├── features/
│   ├── auth/
│   ├── home/
│   ├── navigation/
│   └── settings/
├── navigation/
├── app.dart
└── main.dart
```

---

## 🚀 Tecnologias Utilizadas
- **Flutter**: Framework principal para desenvolvimento mobile.
- **Firebase**: Backend-as-a-Service (BaaS) para autenticação, banco de dados e notificações.

---

## 🛠️ Como Executar o Projeto

### Pré-requisitos:
- Flutter SDK instalado.
- Emulador ou dispositivo físico conectado.

### Passos:
1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
   ```
2. Acesse o diretório do projeto:
   ```bash
   cd seu-repositorio
   ```
3. Instale as dependências:
   ```bash
   flutter pub get
   ```
4. Execute o projeto:
   ```bash
   flutter run
   ```

---

## 📜 Licença
Este projeto está licenciado sob a **MIT License**.

---


