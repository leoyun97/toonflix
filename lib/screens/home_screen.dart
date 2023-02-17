import 'package:flutter/material.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webToons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Today's Toon's",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 5,
      ),
      body: FutureBuilder(
        future: webToons,
        builder: (context, futureResults) {
          if (futureResults.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(futureResults)),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> futureResults) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: futureResults.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      itemBuilder: (context, index) {
        var webToon = futureResults.data![index];
        return Webtoon(title: webToon.title, thumb: webToon.thumb, id: webToon.id);
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
