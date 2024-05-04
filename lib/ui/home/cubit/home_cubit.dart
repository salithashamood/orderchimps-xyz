import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:xyz/domain/entity/product_entity.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getUserLocation();
  }

  ScrollController scrollController = ScrollController();

  List<ProductEntity> currentProductList = [
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", '40% off', '\$24', '\$22'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", null, null, '\$24'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", '40% off', '\$24', '\$22'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", null, null, '\$24'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", '40% off', '\$24', '\$22'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", '40% off', '\$24', '\$22'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", null, null, '\$24'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", null, null, '\$24'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", '40% off', '\$24', '\$22'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", '40% off', '\$24', '\$22'),
  ];

  List<ProductEntity> newProductList = [
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", '40% off', '\$24', '\$22'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", null, null, '\$24'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", '40% off', '\$24', '\$22'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", null, null, '\$24'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", '40% off', '\$24', '\$22'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", '40% off', '\$24', '\$22'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", null, null, '\$24'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", null, null, '\$24'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", '40% off', '\$24', '\$22'),
    ProductEntity('Anggurku Fresh Indonesian Grapes',
        "https://i.pravatar.cc/300", '40% off', '\$24', '\$22'),
  ];

  void scrollHorizontal(int index) {
    emit(HomeScrollHorizontal(index: index));
  }

  void scrollListener() {
    scrollController.addListener(() async {
      if (state is HomeProductFetching) return;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        emit(HomeProductFetching());
        newProductList.shuffle();
        currentProductList.addAll(newProductList);
        emit(HomeProductFetched());
      }
    });
  }

  Future<void> getUserLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
      } else {
        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            emit(HomeLocationPermitionDenieded());
            return;
          } else if (permission == LocationPermission.deniedForever) {
            emit(HomeLocationPermitionDenieded());
            return;
          }
        } else if (permission == LocationPermission.deniedForever) {
          emit(HomeLocationPermitionDenieded());
          return;
        }

        emit(HomeLocationFetching());

        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        final placeMarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        final place = placeMarks[0];
        if (place.country != null) {
          emit(HomeLocationFetched(country: place.country!));
        } else {
          emit(HomeLocationCannotFetch());
        }
      }
    } catch (e) {
      emit(HomeLocationCannotFetch());
    }
  }
}
