import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:booking_hotel_ui/core/global.dart';
import 'package:booking_hotel_ui/pages/booking/bloc-booking/booking_state.dart';


class BookingBLoc extends Cubit<BookingState> {
  BookingBLoc() : super(const BookingState(quantity: 0));

  Dio dio = Dio();
  
  TextEditingController quantityController = TextEditingController();
  TextEditingController checkinController = TextEditingController();
  TextEditingController checkoutController = TextEditingController();

  void  onBookingButton(BuildContext context) async {

  }
  

  // Future<> toBooking(int quantity,String checkin,String checkout){
    
  // }
}
