import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/home/home_event.dart';
import 'package:whatsapp_shop/application/home/home_state.dart';
import 'package:whatsapp_shop/infrastructure/home/home_repository.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState.initial());

  void emit(HomeEvent event) {
    event.map(
      home: (homeEvent) async {
        //Loading
        state = HomeState.initial().copyWith(isLoading: true);

        // Home Api
        final result = await HomeRepository().home;

        final HomeState homeState = result.fold(
          (l) => HomeState.initial().copyWith(isError: true),
          (r) => HomeState.initial().copyWith(shopCategories: r),
        );

        state = homeState;
      },
    );
  }
}
