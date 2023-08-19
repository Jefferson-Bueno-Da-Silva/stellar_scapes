import 'package:flutter/material.dart';

class MyCardComponent extends StatefulWidget {
  const MyCardComponent({super.key});

  @override
  State<MyCardComponent> createState() => _MyCardState();
}

class _MyCardState extends State<MyCardComponent> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 315,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageComponent(),
              ContainerText(),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageComponent extends StatelessWidget {
  const ImageComponent({super.key});

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
            'https://apod.nasa.gov/apod/image/1801/cartwheel_hst.jpg',
            fit: BoxFit.cover,
            semanticLabel: 'A galaxy image',
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
  const ContainerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Cartwheel of Fortune',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: Text(
              "By chance, a collision of two galaxies has created a surprisingly recognizable shape on a cosmic scale, The Cartwheel Galaxy. The Cartwheel is part of a group of galaxies about 500 million light years away in the constellation Sculptor. Two smaller galaxies in the group are visible on the left. The Cartwheel Galaxy's rim is an immense ring-like structure 150,000 light years in diameter composed of newly formed, extremely bright, massive stars. When galaxies collide they pass through each other, their individual stars rarely coming into contact. Still, the galaxies' gravitational fields are seriously distorted by the collision. In fact, the ring-like shape is the result of the gravitational disruption caused by a small intruder galaxy passing through a large one, compressing the interstellar gas and dust and causing a a star formation wave to move out from the impact point like a ripple across the surface of a pond. In this case the large galaxy may have originally been a spiral, not unlike our own Milky Way, transformed into the wheel shape by the collision. But ... what happened to the small intruder galaxy?",
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            )),
          ],
        ),
      ),
    );
  }
}
