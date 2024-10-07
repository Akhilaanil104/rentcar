import 'package:car_rental_app/presentation/bloc/onboard_bloc/onboard_event.dart';
import 'package:car_rental_app/presentation/bloc/onboard_bloc/onboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState(0)) {
    on<NextPageEvent>((event, emit) {
      if (state.currentIndex < 2) {
        emit(OnboardingState(state.currentIndex + 1));
      }
    });

    on<PreviousPageEvent>((event, emit) {
      if (state.currentIndex > 0) {
        emit(OnboardingState(state.currentIndex - 1));
      }
    });

    on<SkipOnboardingEvent>((event, emit) {
      emit(OnboardingState(2)); // Jump to the last page
    });
  }
}
