import 'package:flutter/material.dart';
import 'question.dart';

void main() => runApp(const QuizzlerApp());

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Quizzler',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF365C59)),
      scaffoldBackgroundColor: const Color(0xFFF3F6F1),
    ),
    home: const QuizPage(),
  );
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  int _correctCount = 0;
  final List<Icon> scoreKeeper = [];

  void _checkAnswer(bool answer) {
    final correct = answer == questionBank[_questionIndex].answer;
    final finished = _questionIndex == questionBank.length - 1;
    final finalScore = _correctCount + (correct ? 1 : 0);
    setState(() {
      scoreKeeper.add(
        Icon(
          correct ? Icons.check_circle : Icons.cancel,
          color: correct ? const Color(0xFF277748) : const Color(0xFFC23D46),
          semanticLabel: correct ? 'Trả lời đúng' : 'Trả lời sai',
        ),
      );
      if (correct) _correctCount++;
      if (finished) {
        // Bắt đầu vòng mới ngay, không để chỉ số vượt khỏi danh sách.
        _questionIndex = 0;
        _correctCount = 0;
        scoreKeeper.clear();
      } else {
        _questionIndex++;
      }
    });
    if (finished) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              'Hoàn thành! Bạn đúng $finalScore/${questionBank.length} câu. Đã bắt đầu lượt mới.',
            ),
            duration: const Duration(seconds: 5),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('QUIZZLER / 06')),
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'CÂU ${_questionIndex + 1} / ${questionBank.length}',
                      key: const Key('progress'),
                    ),
                    Chip(
                      avatar: const Icon(Icons.bolt, size: 18),
                      label: Text(
                        '$_correctCount điểm',
                        key: const Key('score'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: _questionIndex / questionBank.length,
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(8),
                ),
                const SizedBox(height: 28),
                Container(
                  padding: const EdgeInsets.all(28),
                  constraints: const BoxConstraints(minHeight: 220),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.psychology_alt_outlined,
                        size: 40,
                        color: Color(0xFF365C59),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        questionBank[_questionIndex].text,
                        key: const Key('question'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                TextButton.icon(
                  key: const Key('true'),
                  onPressed: () => _checkAnswer(true),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF277748),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 60),
                  ),
                  icon: const Icon(Icons.check_rounded),
                  label: const Text('Đúng', style: TextStyle(fontSize: 20)),
                ),
                const SizedBox(height: 12),
                TextButton.icon(
                  key: const Key('false'),
                  onPressed: () => _checkAnswer(false),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFC23D46),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 60),
                  ),
                  icon: const Icon(Icons.close_rounded),
                  label: const Text('Sai', style: TextStyle(fontSize: 20)),
                ),
                const SizedBox(height: 28),
                const Text('DẤU CHÂN CỦA BẠN', textAlign: TextAlign.center),
                const SizedBox(height: 12),
                SizedBox(
                  height: 32,
                  child: Row(
                    key: const Key('score-keeper'),
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: scoreKeeper,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
