// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fuleap/helpers/storage.dart';

// Db names

const String db_user = "user";
const String db_banks = "banks";
const String db_account = "account";
const String db_attandance = "attendants";
const String db_wallet = "wallet";
String db_transaction({String? id}) =>
    id == null ? "transaction" : "transaction_$id";
const String key_station_manager = 'station_manager';

const String key_token = 'token';

var pushKey = 'push_${getUser()!.user!.id!}';
var pinKey = 'pin_${getUser()!.user!.id!}';
var pinStateKey = 'pinstate_${getUser()!.user!.id!}';
var bioKey = 'bio_${getUser()!.user!.id!}';

// Colors
const green_ = Color(0xff002928);
const white_ = Colors.white;
const black_ = Colors.black;
const blue_ = Color(0xff29335C);
const gray_ = Color(0xff949494);
const lightGreen_ = Color.fromARGB(255, 228, 237, 249);
const lightBlue_ = Color(0xffEDF2FF);
const darkBlue_ = Color(0xff323F4B);
const blueGray_ = Colors.blueGrey;
var lightGray_ = const Color(0xffAAB9CC).withOpacity(.2);
var lighGreen2_ = const Color.fromARGB(96, 81, 118, 81);
var red_ = Colors.red.shade800;

// Assets Paths
const imagesPath = "assets/images/";
const svgPath = "assets/svgs/";

// Messages

const emailHint = "Enter Email or Phone Number";
const passwordHint = "Password must be more than six digits";

const username = "Username";
const password = "Password";

const signIn = "Sign In";
const belovedCustoemr = "Our beloved Employee";

const rememberMe = "Remember Me";
const forgotPassword = "Forgotten password?";
const stationStatus = "Station Status";
const update = "update";

const open = "Open";
const from = "From";
const to = "To";
const timeHint = "HH:MM";
const products = "Products";
const addProducts = "+ Add Products";
const perLitter = "Naira per liter";
const attendants = "Attendants";
