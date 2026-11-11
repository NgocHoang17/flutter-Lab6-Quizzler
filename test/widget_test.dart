import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab06_quizzler/main.dart';
import 'package:lab06_quizzler/question.dart';

void main() {
  testWidgets('Đúng/sai được chấm, chuyển câu, tự xóa điểm khi kết thúc', (
    tester,
  ) async {
    await tester.pumpWidget(const QuizzlerApp());
    for (var i = 0; i < questionBank.length; i++) {
      expect(find.text(questionBank[i].text), findsOneWidget);
      final answer = i == 0 ? !questionBank[i].answer : questionBank[i].answer;
      final button = find.byKey(Key(answer ? 'true' : 'false'));
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pump();
      if (i == 0) expect(find.byIcon(Icons.cancel), findsOneWidget);
      if (i == 1) expect(find.byIcon(Icons.check_circle), findsOneWidget);
    }
    expect(find.text(questionBank.first.text), findsOneWidget);
    expect(find.text('0 điểm'), findsOneWidget);
    final keeper = tester.widget<Row>(find.byKey(const Key('score-keeper')));
    expect(keeper.children, isEmpty);
    expect(find.textContaining('Bạn đúng 7/8 câu'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
