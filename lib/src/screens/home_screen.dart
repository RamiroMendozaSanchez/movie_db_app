import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_app/src/bloc/seriebloc/serie_bloc.dart';
import 'package:movie_db_app/src/bloc/seriebloc/serie_event.dart';
import 'package:movie_db_app/src/bloc/seriebloc/serie_state.dart';
import 'package:movie_db_app/src/model/serie.dart';
import 'package:movie_db_app/src/screens/serie_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SerieBloc>(
          create: (_) => SerieBloc()..add(SerieEventStarted(0, '')),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.menu,
            color: Colors.black45,
          ),
          title: Text(
            'Movies-db'.toUpperCase(),
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: Colors.black45,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'muli',
                ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.jpg'),
              ),
            ),
          ],
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<SerieBloc, SerieState>(
                  builder: (context, state) {
                    if (state is SerieLoading) {
                      return Center(
                        child: Platform.isAndroid
                            ? CircularProgressIndicator()
                            : CupertinoActivityIndicator(),
                      );
                    } else if (state is SerieLoaded) {
                      List<Serie> series = state.serieList;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider.builder(
                            itemCount: series.length,
                            itemBuilder: (BuildContext context, int index) {
                              Serie serie = series[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailScreen(serie: serie),
                                    ),
                                  );
                                },
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: <Widget>[
                                    ClipRRect(
                                      child: CachedNetworkImage(
                                        imageUrl: serie.image.mediumUrl,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Platform.isAndroid
                                                ? CircularProgressIndicator()
                                                : CupertinoActivityIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/img_not_found.jpg'),
                                            ),
                                          ),
                                        ),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.black87,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          bottom: 15,
                                          left: 15,
                                        ),
                                        child: Text(
                                          serie.name.toUpperCase()+', Episodios: '.toUpperCase()+ serie.countOfEpisodes.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            fontFamily: 'muli',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            options: CarouselOptions(
                              enableInfiniteScroll: true,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 5),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              pauseAutoPlayOnTouch: true,
                              viewportFraction: 0.8,
                              enlargeCenterPage: true,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Container(
                        child: Text('Something went wrong!!!'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
