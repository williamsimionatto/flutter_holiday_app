import 'package:flutter_holiday_app/ui/pages/holidays/components/components.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_holiday_app/ui/pages/holidays/holidays.dart';

import '../../helpers/helpers.dart';
import '../../mocks/mocks.dart';

void main() {
  late HolidaysByYearPresenterSpy presenter;

  Future<void> loadPage(WidgetTester tester) async {
    presenter = HolidaysByYearPresenterSpy();
    await tester.pumpWidget(makePage(
      path: '/categories',
      page: () => HolidaysByYearPage(presenter: presenter),
    ));
  }

  tearDown(() {
    presenter.dispose();
  });

  testWidgets('Should call load data on page load',
      (WidgetTester tester) async {
    await loadPage(tester);

    verify(() => presenter.load('2023')).called(1);
  });

  testWidgets('Should present page with correct state',
      (WidgetTester tester) async {
    await loadPage(tester);

    expect(find.text('Feriados'), findsOneWidget);

    expect(find.byType(YearList), findsOneWidget);
  });

  testWidgets('Should presenter list of holidays if load  succeeds',
      (WidgetTester tester) async {
    await loadPage(tester);
    await tester.pump();

    presenter.emitHolidays(ViewModelFactory.makeHolidayList());
    await tester.pump();

    expect(find.text('Feriado 1'), findsOneWidget);
    expect(find.text('Feriado 2'), findsOneWidget);

    expect(find.text('Segunda-feira'), findsOneWidget);
    expect(find.text('Terça-feira'), findsOneWidget);

    expect(find.text('01/01/2023'), findsOneWidget);
    expect(find.text('25/12/2023'), findsOneWidget);
  });

  testWidgets('Should call load data on change year',
      (WidgetTester tester) async {
    await loadPage(tester);
    await tester.pump();

    presenter.emitHolidays(ViewModelFactory.makeHolidayList());
    await tester.pump();

    final nextYear = (DateTime.now().year + 1).toString();

    await tester.tap(find.text(nextYear));
    await tester.pump();

    verify(() => presenter.load(nextYear)).called(1);
  });

  testWidgets('Should presents error message if load fails',
      (WidgetTester tester) async {
    await loadPage(tester);
    await tester.pump();

    presenter.emitHolidaysError();
    await tester.pump();

    expect(find.text('Erro ao buscar feriados'), findsOneWidget);
  });
}
