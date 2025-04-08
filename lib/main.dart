import 'package:tech_test/utils/global_import.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tecth Test Gits',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tech Test Gits')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(() => DeretScreen());
                },
                child: Text('Soal 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => RankingScreen());
                },
                child: Text('Soal 2'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => BracketScreen());
                },
                child: Text('Soal 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
