import 'package:tech_test/utils/global_import.dart';

class BracketScreen extends StatelessWidget {
  const BracketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BracketController controller = Get.put(BracketController());

    return Scaffold(
      appBar: AppBar(title: Text('Soal 3')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.textController,
              decoration: InputDecoration(
                labelText: 'Masukkan Bracket',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.cekBraket,
              child: Text('Periksa'),
            ),
            SizedBox(height: 20),
            Obx(
              () =>
                  Text(controller.result.value, style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}

class BracketController extends GetxController {
  var result = ''.obs;
  TextEditingController textController = TextEditingController();

  void cekBraket() {
    final input = textController.text.replaceAll(RegExp(r'\s+'), '');
    if (isBalance(input)) {
      result.value = 'YES';
    } else {
      result.value = 'NO';
    }
  }

  bool isBalance(String input) {
    final stack = <String>[];
    final opening = {'(', '{', '['};
    final closing = {')': '(', '}': '{', ']': '['};

    for (var char in input.split('')) {
      if (opening.contains(char)) {
        stack.add(char);
      } else if (closing.containsKey(char)) {
        if (stack.isEmpty || stack.last != closing[char]) {
          return false;
        }
        stack.removeLast();
      }
    }

    return stack.isEmpty;
  }
}
