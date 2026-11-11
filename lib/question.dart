class Question {
  const Question({required this.text, required this.answer});
  final String text;
  final bool answer;
}

const questionBank = [
  Question(text: 'Flutter sử dụng ngôn ngữ lập trình Dart.', answer: true),
  Question(text: 'Một tam giác có bốn cạnh.', answer: false),
  Question(text: 'Mặt Trời là một ngôi sao.', answer: true),
  Question(text: 'Một byte gồm 8 bit.', answer: true),
  Question(text: 'Số 1 là một số nguyên tố.', answer: false),
  Question(
    text: 'Widget StatelessWidget tự lưu trạng thái thay đổi bằng setState().',
    answer: false,
  ),
  Question(text: 'Hệ Mặt Trời có 8 hành tinh.', answer: true),
  Question(
    text: 'Navigator.push() dùng để đóng màn hình hiện tại.',
    answer: false,
  ),
];
