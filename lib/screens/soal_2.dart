import 'package:tech_test/utils/global_import.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RankingController controller = Get.put(RankingController());

    return Scaffold(
      appBar: AppBar(title: Text('Soal 2')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.textPLayer,
              decoration: InputDecoration(
                labelText: 'Masukkan skor pemain',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.textGitsPlyer,
              decoration: InputDecoration(
                labelText: 'Masukkan skor GITS',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.hitungRanking,
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

class RankingController extends GetxController {
  var result = ''.obs;
  TextEditingController textPLayer = TextEditingController();
  TextEditingController textGitsPlyer = TextEditingController();

  void hitungRanking() {
    final List<int> playerSkor =
        textPLayer.text.split(' ').map((e) => int.tryParse(e) ?? 0).toList();

    final List<int> gitsSkor =
        textGitsPlyer.text.split(' ').map((e) => int.tryParse(e) ?? 0).toList();

    List<int> sortedSkor = List.from(playerSkor)
      ..sort((a, b) => b.compareTo(a));
    sortedSkor = sortedSkor.toSet().toList();

    List<int> rankings = [];
    int currentRank = 1;
    for (int i = 0; i < sortedSkor.length; i++) {
      if (i > 0 && sortedSkor[i] != sortedSkor[i - 1]) {
        currentRank = i + 1;
      }
      rankings.add(currentRank);
    }

    List<int> gitsRangking = [];
    for (int skor in gitsSkor) {
      int rankForGits = rankings.length + 1;
      for (int i = 0; i < sortedSkor.length; i++) {
        if (skor >= sortedSkor[i]) {
          rankForGits = rankings[i];
          break;
        }
      }
      gitsRangking.add(rankForGits);
    }

    result.value = gitsRangking.join(' ');
  }
}
