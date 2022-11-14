import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whatsapp_shop/application/address/address_event.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/core/routes/routes.dart';
import 'package:whatsapp_shop/domain/models/address/address_model.dart';
import 'package:whatsapp_shop/domain/provider/address_provider.dart';
import 'package:whatsapp_shop/domain/utils/snackbars/snackbar.dart';
import 'package:whatsapp_shop/presentation/widgets/dialogs/alert_dialog_custom.dart';

class AddressItemWidget extends ConsumerWidget {
  const AddressItemWidget({
    Key? key,
    required this.address,
    required this.addressesProvider,
  }) : super(key: key);

  final AddressModel address;
  final AutoDisposeStateProvider<List<AddressModel>> addressesProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        horizontalTitleGap: 0,
        dense: true,
        title: Row(
          children: [
            Text(
              address.type,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            dWidth05,
            address.type == "Home"
                ? Icon(
                    Icons.home_outlined,
                    size: 16.sp,
                    color: kBlack,
                  )
                : Icon(
                    Icons.work_outline,
                    size: 16.sp,
                    color: kBlack,
                  ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dHeight05,
            FractionallySizedBox(
              widthFactor: .8,
              child: Text(
                address.address,
                maxLines: 2,
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
            dHeight02,
            Text(
              'Phone no: ${address.mobile}',
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            dHeight03,
            Row(
              children: [
                //==================== Edit Address ====================
                IconButton(
                  onPressed: () async {
                    final status = await Navigator.pushNamed(
                        context, routeAddAddress,
                        arguments: address);

                    if (status == true) {
                      ref.invalidate(AddressProvider.getAddressesProvider);
                    }
                  },
                  icon: Icon(
                    Icons.edit,
                    color: primaryTextColor,
                    size: 19.sp,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                dWidth2,

                //==================== Delete Address ====================
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => KAlertDialog(
                        title: 'Delete Address',
                        content:
                            'Are you sure you want to delete this address?',
                        submitText: 'Delete',
                        submitAction: () async {
                          Navigator.pop(context);
                          ref
                              .read(AddressProvider
                                  .removeAddressProvider.notifier)
                              .emit(AddressEvent.removeAddress(
                                  addressId: address.id));

                          ref.listenManual(
                            AddressProvider.removeAddressProvider,
                            (previous, next) {
                              if (!next.isLoading && next.status) {
                                ref.read(addressesProvider.notifier).update(
                                  (state) {
                                    List<AddressModel> adrs = List.from(state);
                                    adrs.remove(address);
                                    return adrs;
                                  },
                                );

                                kSnackBar(
                                  context: context,
                                  content: 'Address deleted successfully',
                                  success: true,
                                );
                              }
                            },
                          );
                        },
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.delete,
                    color: kRed300,
                    size: 19.sp,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
