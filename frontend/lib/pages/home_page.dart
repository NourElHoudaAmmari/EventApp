

import 'package:flutter/material.dart';
import 'package:frontend/EventsList.dart';
import 'package:frontend/models/event_model.dart';
import 'package:frontend/models/popular_model.dart';
import 'package:frontend/shared/theme.dart';
import 'package:frontend/widgets/event_card.dart';
import 'package:frontend/widgets/popular_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Mohamed',
                    style: placeholderTextStyle,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Discover our events',
                    style: primaryTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 48,
              width: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/img_profile.png'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget search() {
      return Container(
        margin: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        height: 54,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/ic_search.png'),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search all events...',
                  hintStyle: placeholderTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget upcomingEvents() {
      return Container(
        margin: const EdgeInsets.only(
          top: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Text(
                'Upcoming Events',
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: events
                      .map(
                        (item) => EventCard(item),
                      )
                      .toList(),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget popularNow() {
      return Container(
        margin: const EdgeInsets.only(
          top: 24,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Events',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                                    Navigator.push(context,
    MaterialPageRoute(builder: (context) => const EventsList(events: [],)),
  );
                    },
                    child: Text(
                      'See All',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children:
                        populars.map((item) => PopularCard(item)).toList()),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            search(),
            upcomingEvents(),
            popularNow(),
          ],
        ),
      ),
    );
  }
}