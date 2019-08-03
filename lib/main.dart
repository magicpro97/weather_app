import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/bloc.dart';
import 'package:weather_app/model/place_info.dart';
import 'package:weather_app/utils/temperature.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String _title = 'Weather App';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherBloc weatherBloc;

  @override
  void initState() {
    weatherBloc = WeatherBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget._title),
        ),
        body: BlocProvider(
          builder: (context) => WeatherBloc(),
          child: WeatherPageChild(),
        ));
  }

  @override
  void dispose() {
    weatherBloc.dispose();
    super.dispose();
  }
}

class WeatherPageChild extends StatelessWidget {
  const WeatherPageChild({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: BlocListener(
          bloc: BlocProvider.of<WeatherBloc>(context),
          listener: (BuildContext context, WeatherState state) {
            if (state is WeatherLoaded) {
              print('Loaded: ${state.placeInfo.name}');
            }
          },
          child: BlocBuilder(
            bloc: BlocProvider.of<WeatherBloc>(context),
            builder: (BuildContext context, WeatherState state) {
              if (state is WeatherInitial) {
                return buildInitalInput();
              } else if (state is WeatherLoading) {
                return buildLoading();
              } else if (state is WeatherLoaded) {
                return buildColumnWithData(state.placeInfo);
              } else if (state is WeatherLoadedFail) {
                return buildLoadedFail();
              } else if (state is NoConnection) {
                return buildNoConnection();
              }
              return Container();
            },
          ),
        ));
  }

  Widget buildInitalInput() {
    return Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(PlaceInfo placeInfo) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          placeInfo.name,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
        ),
        Text(
          '${TemperatureUtils.convertKToC(placeInfo.main.temp).toStringAsFixed(1)} °C',
          style: TextStyle(fontSize: 80),
        ),
        CityInputField()
      ],
    );
  }

  Widget buildLoadedFail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Not found!',
          style: TextStyle(fontSize: 40, color: Colors.red),
        ),
        CityInputField(),
      ],
    );
  }

  Widget buildNoConnection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No Connection!',
          style: TextStyle(fontSize: 40, color: Colors.red),
        ),
        CityInputField(),
      ],
    );
  }
}

class CityInputField extends StatefulWidget {
  const CityInputField({
    Key key,
  }) : super(key: key);

  @override
  _CityInputFieldState createState() => _CityInputFieldState();
}

class _CityInputFieldState extends State<CityInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(12)),
            suffixIcon: Icon(Icons.search),
            hintText: 'Type your city/country'),
        style: TextStyle(
          fontSize: 20,
        ),
        onSubmitted: submitCityName,
        textInputAction: TextInputAction.search,
      ),
    );
  }

  void submitCityName(String cityName) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    weatherBloc.dispatch(GetWeather(cityName: cityName));
  }
}
