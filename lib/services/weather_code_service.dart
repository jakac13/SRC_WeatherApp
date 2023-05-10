class WeatherCodeService {
  String getWeatherImage(int weatherCode) {
    Map<int, String> weatherCodeToImage = {
      0: "assets/weather/01d.png",
      1: "assets/weather/02d.png",
      2: "assets/weather/03d.png",
      3: "assets/weather/04d.png",
      45: "assets/weather/50d.png",
      48: "assets/weather/50d.png",
      51: "assets/weather/09d.png",
      53: "assets/weather/09d.png",
      55: "assets/weather/09d.png",
      56: "assets/weather/09d.png",
      57: "assets/weather/09d.png",
      61: "assets/weather/09d.png",
      63: "assets/weather/09d.png",
      65: "assets/weather/09d.png",
      66: "assets/weather/09d.png",
      67: "assets/weather/09d.png",
      80: "assets/weather/09d.png",
      81: "assets/weather/09d.png",
      82: "assets/weather/09d.png",
      71: "assets/weather/13d.png",
      73: "assets/weather/13d.png",
      75: "assets/weather/13d.png",
      77: "assets/weather/13d.png",
      85: "assets/weather/13d.png",
      86: "assets/weather/13d.png",
      10: "assets/weather/13d.png",
      95: "assets/weather/11d.png",
      96: "assets/weather/11d.png",
      99: "assets/weather/11d.png",
    };

    return weatherCodeToImage[weatherCode] ?? "assets/weather/01d.png";
  }
}
