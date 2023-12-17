import 'package:boilerplate/core/services/network_service.dart';
import 'package:boilerplate/features/auth/domain/useCases/get_log_data_uc.dart';
import 'package:boilerplate/features/auth/domain/useCases/get_user_data_uc.dart';
import 'package:boilerplate/features/auth/domain/useCases/refresh_token_uc.dart';
import 'package:boilerplate/features/auth/domain/useCases/save_log_data_uc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:boilerplate/app_data.dart';
import 'package:boilerplate/core/utils/screen_size.dart';
import 'package:boilerplate/core/widgets/snack_bar.dart';
import 'package:boilerplate/config/routes/routes.dart';
import 'package:boilerplate/features/auth/data/repositories/auth_repo_impl.dart';

import '../features/auth/domain/useCases/login_uc.dart';
import '../features/auth/domain/useCases/save_user_data_uc.dart';
import '../features/auth/presentation/cubit/auth_cubit.dart';
import '../features/dashboard/presentation/cubit/dashboard_cubit.dart';

part 'injection.dart';
