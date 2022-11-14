import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:whatsapp_shop/domain/core/api_endpoints.dart';
import 'package:whatsapp_shop/domain/models/address/address_model.dart';
import 'package:whatsapp_shop/domain/utils/failures/main_failures.dart';

class AddressRepository {
  final Dio dio =
      Dio(BaseOptions(headers: {"Content-Type": "application/json"}));

  //==================== Get Addresses ====================
  Future<Either<MainFailures, List<AddressModel>>> getAddresses({
    required int userId,
  }) async {
    try {
      final FormData form = FormData.fromMap({"user_id": userId});

      final Response response = await dio.post(
        ApiEndpoints.addresses,
        data: form,
      );

      log('response == ${response.data.toString()}', name: 'Get Addresses');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          final List<AddressModel> addresses = (result['address'] as List)
              .map((address) => AddressModel.fromJson(address))
              .toList();

          return Right(addresses);
        } else {
          return const Left(MainFailures.clientFailure());
        }
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e, s) {
      log('Exception : $e', stackTrace: s);
      return const Left(MainFailures.clientFailure());
    }
  }

  //==================== Get Address ====================
  Future<Either<MainFailures, AddressModel>> getAddress({
    required int addressId,
  }) async {
    try {
      final Response response = await dio.post(
        ApiEndpoints.address + addressId.toString(),
      );

      log('response == ${response.data.toString()}', name: 'Get Address');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          final AddressModel address = result['address'];

          return Right(address);
        } else {
          return const Left(MainFailures.clientFailure());
        }
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e, s) {
      log('Exception : $e', stackTrace: s);
      return const Left(MainFailures.clientFailure());
    }
  }

  //==================== Add Address ====================
  Future<Either<MainFailures, bool>> addAddress({
    required AddressModel addressModel,
  }) async {
    try {
      final FormData form = FormData.fromMap(
        {
          "user_id": addressModel.customerId,
          "name": addressModel.name,
          "email": addressModel.email,
          "mobile": addressModel.mobile,
          "phone": "",
          "address": addressModel.address,
          "landmark": addressModel.landmark,
          "pincode": addressModel.pincode,
          "city": addressModel.city,
          "district": addressModel.district,
          "state": addressModel.state,
          "type": addressModel.type,
        },
      );

      final Response response = await dio.post(
        ApiEndpoints.addressAdd,
        data: form,
        options: Options(
            // will not throw errors
            // validateStatus: (status) => true,
            ),
      );

      log('response == ${response.data.toString()}', name: 'Add Address');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          return const Right(true);
        } else {
          return const Left(MainFailures.clientFailure());
        }
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e, s) {
      log('Exception : $e', stackTrace: s);
      return const Left(MainFailures.clientFailure());
    }
  }

  //==================== Update Address ====================
  Future<Either<MainFailures, bool>> updateAddress({
    required AddressModel addressModel,
  }) async {
    try {
      final FormData form = FormData.fromMap(
        {
          "user_id": addressModel.customerId,
          "name": addressModel.name,
          "email": addressModel.email,
          "mobile": addressModel.mobile,
          "phone": "",
          "address": addressModel.address,
          "landmark": addressModel.landmark,
          "pincode": addressModel.pincode,
          "city": addressModel.city,
          "district": addressModel.district,
          "state": addressModel.state,
          "type": addressModel.type,
        },
      );

      final Response response = await dio.post(
        ApiEndpoints.addressUpdate + addressModel.id.toString(),
        data: form,
      );

      log('response == ${response.data.toString()}', name: 'Update Address');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          return const Right(true);
        } else {
          return const Left(MainFailures.clientFailure());
        }
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e, s) {
      log('Exception : $e', stackTrace: s);
      return const Left(MainFailures.clientFailure());
    }
  }

  //==================== Remove Address ====================
  Future<Either<MainFailures, bool>> removeAddress({
    required int addressId,
  }) async {
    try {
      final Response response = await dio.post(
        ApiEndpoints.addressRemove + addressId.toString(),
      );

      log('response == ${response.data.toString()}', name: 'Remove Address');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          return const Right(true);
        } else {
          return const Left(MainFailures.clientFailure());
        }
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e, s) {
      log('Exception : $e', stackTrace: s);
      return const Left(MainFailures.clientFailure());
    }
  }

  //==================== Default Address ====================
  Future<Either<MainFailures, bool>> defaultAddress({
    required int userId,
    required int addressId,
  }) async {
    try {
      final FormData form =
          FormData.fromMap({"userid": userId, "addressid": addressId});

      final Response response = await dio.post(
        ApiEndpoints.addressDefault,
        data: form,
      );

      log('response == ${response.data.toString()}', name: 'Default Address');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map result = json.decode(response.data) as Map;

        if (result['sts'] == '01') {
          return const Right(true);
        } else {
          return const Left(MainFailures.clientFailure());
        }
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e, s) {
      log('Exception : $e', stackTrace: s);
      return const Left(MainFailures.clientFailure());
    }
  }
}
