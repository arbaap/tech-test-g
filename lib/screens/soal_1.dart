import 'package:tech_test/utils/global_import.dart';

class DeretScreen extends StatelessWidget {
  const DeretScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DeretController controller = Get.put(DeretController());

    return Scaffold(
      appBar: AppBar(title: Text('Soal 1')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.textController,
              decoration: InputDecoration(
                labelText: 'Masukkan angka',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.genereateFungsi,
              child: Text('Hitung'),
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

class DeretController extends GetxController {
  var result = ''.obs;
  TextEditingController textController = TextEditingController();

  List<int> genereatDeret(int n) {
    List<int> result = [];
    int value = 1;
    result.add(value);

    for (int i = 2; i <= n; i++) {
      value += i - 1;
      result.add(value);
    }

    return result;
  }

  void genereateFungsi() {
    final int n = int.tryParse(textController.text) ?? 0;
    if (n > 0) {
      final List<int> sequence = genereatDeret(n);
      result.value = sequence.join('-');
    } else {
      result.value = 'Masukkan angka yang benr';
    }
  }
}
