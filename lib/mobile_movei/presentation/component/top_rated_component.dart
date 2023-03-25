import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movei_api/core/utils/constants.dart';
import 'package:movei_api/mobile_movei/presentation/controller/movies_bloc.dart';
import 'package:movei_api/mobile_movei/presentation/controller/movies_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/enums.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous,current)=>
        previous.topRatedState!=current.topRatedState,

      builder: (context, state) {
        print("BlocBuilder NowPlayingComponent");
        switch(state.nowPlayingState){

          case RequestState.loading:
            return const SizedBox(
              height: 400.0,
              child: Center(child: CircularProgressIndicator(color: Colors.white,),),
            ) ;
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topRatedMovie.length,
                  itemBuilder: (context, index) {
                    final movie = state.topRatedMovie[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                              width: 120.0,
                              fit: BoxFit.cover,
                              imageUrl: AppConstance.urlImage(
                                  path: movie.backdropPath),
                              placeholder: (context, url) =>
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[850]!,
                                    highlightColor: Colors.grey[800]!,
                                    child: Container(
                                      height: 170.0,
                                      width: 120.0,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                              errorWidget: (context, url, error) =>
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[850]!,
                                    highlightColor: Colors.grey[800]!,
                                    child: Container(
                                      height: 170.0,
                                      width: 120.0,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  )
                            // const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );

          case RequestState.error:
            return  SizedBox(height:400.0,child: Center(child: Text(state.nowPlayingMessage))) ;
        }
      },

    );
  }
}
