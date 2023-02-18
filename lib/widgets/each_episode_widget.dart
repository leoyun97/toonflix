import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/webtoon_episode_model.dart';

class EachEpisode extends StatelessWidget {
  const EachEpisode({
    super.key,
    required this.episode,
    required this.webtoon_id,
  });

  final WebtoonEpisodeModel episode;
  final String webtoon_id;

  onButtonTap() async{

    //1번 방법
    //final goUrl = Uri.parse("https://google.com");
    //await launchUrl(goUrl);

    //2번 방법
    await launchUrlString("https://comic.naver.com/webtoon/detail?titleId=${webtoon_id}&no=${episode.id}");

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.green.shade300,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 2,
                  offset: Offset(2, 2))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}