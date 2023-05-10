import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_src/viewmodels/weather_data_view_model.dart';

class SearchComponent extends StatefulWidget {
  const SearchComponent({super.key});

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    return AnimSearchBar(
      autoFocus: true,
      helpText: "Search location...",
      width: 400,
      textController: textController,
      animationDurationInMilli: 200,
      onSuffixTap: () {
        setState(() {
          textController.clear();
        });
      },
      onSubmitted: (p0) async {
        Provider.of<WeatherDataViewModel>(context, listen: false)
            .getWeatherDataSearchedCity(p0);
      },
    );
  }
}
