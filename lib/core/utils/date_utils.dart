// Importa o pacote `intl`, que fornece ferramentas para internacionalização e formatação de datas, números, etc.
import 'package:intl/intl.dart';

// Declaração da classe utilitária `DateUtils`.
// Esta classe contém métodos estáticos relacionados a manipulação e formatação de datas e horários.
class DateUtils {
  // Método estático que formata uma data (`DateTime`) para o formato "dd/MM/yyyy".
  // Exemplo: 2024-12-06 será formatado como "06/12/2024".
  static String formatDate(DateTime date) {
    // `DateFormat` é usado para criar um padrão de formatação específico.
    // O método `.format()` aplica esse padrão à data fornecida.
    return DateFormat('dd/MM/yyyy').format(date);
  }

  // Método estático que formata um horário (`DateTime`) para o formato "HH:mm".
  // Exemplo: 14:30 será formatado como "14:30".
  static String formatTime(DateTime time) {
    // Define o padrão de formatação para representar apenas as horas e minutos.
    return DateFormat('HH:mm').format(time);
  }

  // Método estático que combina uma data e um horário em um único objeto `DateTime`.
  // Este método é útil para cenários onde a data e o horário são fornecidos separadamente.
  // Exemplo: Se `date` for 2024-12-06 e `time` for 14:30, o resultado será um `DateTime` representando 2024-12-06 14:30.
  static DateTime combineDateAndTime(DateTime date, DateTime time) {
    // Retorna um novo objeto `DateTime` com os componentes da data e do horário combinados.
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  // Método estático que verifica se duas datas caem no mesmo dia.
  // Ele compara o ano, o mês e o dia dos dois objetos `DateTime`.
  // Retorna `true` se as duas datas forem iguais, caso contrário, retorna `false`.
  static bool isSameDay(DateTime date1, DateTime date2) {
    // Realiza comparações individuais para ano, mês e dia.
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
