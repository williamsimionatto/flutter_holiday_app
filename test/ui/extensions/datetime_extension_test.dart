import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_holiday_app/ui/extensions/extensions.dart';

void main() {
  group('DateTimeExtension', () {
    test('format should return formatted date string', () {
      final date = DateTime(2023, 12, 25);
      expect(date.format(), '25/12/2023');
    });

    test('dayOfWeek should return correct day of week', () {
      final monday = DateTime(2023, 12, 25);
      expect(monday.dayOfWeek(), 'Segunda-feira');

      final tuesday = DateTime(2023, 12, 26);
      expect(tuesday.dayOfWeek(), 'Terça-feira');

      final wednesday = DateTime(2023, 12, 27);
      expect(wednesday.dayOfWeek(), 'Quarta-feira');

      final thursday = DateTime(2023, 12, 28);
      expect(thursday.dayOfWeek(), 'Quinta-feira');

      final friday = DateTime(2023, 12, 29);
      expect(friday.dayOfWeek(), 'Sexta-feira');

      final saturday = DateTime(2023, 12, 30);
      expect(saturday.dayOfWeek(), 'Sábado');

      final sunday = DateTime(2023, 12, 31);
      expect(sunday.dayOfWeek(), 'Domingo');
    });
  });
}
