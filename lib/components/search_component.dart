import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_src/utils/app_styles.dart';
import 'package:weather_src/viewmodels/weather_data_view_model.dart';

class SearchComponent extends StatefulWidget {
  const SearchComponent({super.key});

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimSearchBar(
          boxShadow: false,
          color: Colors.transparent,
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
        ),
        const SizedBox(
          width: 20,
        ),
        Tooltip(
          message: "Weather for current location",
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () async {
              Provider.of<WeatherDataViewModel>(context, listen: false)
                  .getWeatherDataCurrentLocation();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.location_on, color: AppTheme.blue),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
