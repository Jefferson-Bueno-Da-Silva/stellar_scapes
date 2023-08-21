import 'package:flutter/material.dart';
import 'package:stellar_scapes/models/apod_model.dart';

class MyCardComponent extends StatefulWidget {
  final ApodModel apod;

  const MyCardComponent({super.key, required this.apod}) : super();

  @override
  State<MyCardComponent> createState() => _MyCardState();
}

class _MyCardState extends State<MyCardComponent> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          ImageComponent(uri: widget.apod.hdurl),
          ContainerText(
              title: widget.apod.title, description: widget.apod.explanation)
        ],
      ),
    );
  }
}

class ImageComponent extends StatelessWidget {
  final String uri;

  const ImageComponent({super.key, required this.uri});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: SizedBox(
        height: 177.0,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            uri,
            fit: BoxFit.cover,
            semanticLabel: '',
            loadingBuilder: (context, child, progress) {
              return progress == null
                  ? child
                  : LinearProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    );
            },
          ),
        ),
      ),
    );
  }
}

class ContainerText extends StatelessWidget {
  final String title;
  final String description;

  const ContainerText(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
        child: Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      )
    ]);
  }
}
