
# 📅 AgendaPro - Solução de Agendamentos Inteligente
... em desenvolvimento

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

# Plano de Configuração e Teste do App

1. **Configurar Ambiente**
2. **Instalar/Atualizar CLIs**
3. **Configurar Firebase**
4. **Configurar Projeto**
5. **Testar Aplicativo**

### **Comandos Passo a Passo**

1. **Verificar/Instalar Node.js**

```jsx
node --version
```

Se não instalado, baixe do nodejs.org

1. **Instalar Firebase CLI**

```jsx
npm install -g firebase-tools
```

3. **Login no Firebase**

```jsx
firebase login
```

1. **Instalar FlutterFire CLI** 

```jsx
dart pub global activate flutterfire_cli
```

1. **Configurar Firebase no Projeto**

```jsx
flutterfire configure --project=<seu projeto no firebase>
```

6. **Limpar e Atualizar Projeto Flutter**

```bash
flutter clean
flutter pub get
flutter pub upgrade
```

1. **Verificar Dispositivos Disponíveis**

```jsx
flutter devices
```

1. **Verificar Status do Flutter**

```jsx
flutter doctor
```

9. **Executar em Modo Debug**

```jsx
flutter run
```

10. **Build Release APK**

```jsx
flutter build apk --release
```

1. **Localização do APK Gerado**

```jsx
build/app/outputs/flutter-apk/app-release.apk
```

### **Comandos Extras (Se Necessário)**

- **Ativar Web**

```jsx
flutter config --enable-web
```

• **Executar na Web**

```jsx
flutter run -d chrome
```

• **Atualizar Firebase Tools**

```jsx
npm install -g firebase-tools@latest
```

• **Verificar Versão do Firebase**

```jsx
firebase --version
```
