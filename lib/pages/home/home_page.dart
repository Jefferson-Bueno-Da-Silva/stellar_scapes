import 'package:flutter/material.dart';
import 'package:stellar_scapes/components/card.dart';
import 'package:stellar_scapes/controllers/home_controller.dart';

class MyHomePage extends StatefulWidget {
  final String title = "Astronomy Picture of the Day";

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  _success() {
    return RefreshIndicator(
      onRefresh: controller.start,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          padding: const EdgeInsets.only(
              top: 16.0, left: 16.0, right: 16.0, bottom: 24.0),
          itemBuilder: (context, index) {
            var apod = controller.apods[index];
            return Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: MyCardComponent(
                  apod: apod,
                ));
          }),
    );
  }

  _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  _errorMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('an error occurred, please:'),
          TextButton(
            style: TextButton.styleFrom(primary: Colors.blue),
            onPressed: () {
              controller.start();
            },
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.loading:
        return _loading();
      case HomeState.success:
        return _success();
      case HomeState.error:
        return _errorMessage();
      default:
        return _errorMessage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
        ),
        body: AnimatedBuilder(
          animation: controller.state,
          builder: (context, child) {
            return stateManagement(controller.state.value);
          },
        ));
  }
}
