import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:boilerplate/app_data.dart';
import 'package:boilerplate/core/utils/screen_size.dart';
import 'package:boilerplate/core/network/network_service.dart';
import 'package:boilerplate/core/widgets/snack_bar.dart';
import 'package:boilerplate/config/routes/routes.dart';
import 'package:boilerplate/features/auth/data/repositories/auth_repo_impl.dart';

part 'injection.dart';

final appData = AppData();
final size = getIt<SizeConfig>();
final appRouter = getIt<AppRouter>();
final networkService = NetworkService();
final dio = getIt<Dio>();
final outlineIB = getIt<OutlineInputBorder>();
final snackBar = getIt<CusSnackBar>();

// Repositories
final authRepoImpl = AuthRepoImpl();
