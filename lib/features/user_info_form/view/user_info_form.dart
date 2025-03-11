import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_task/config/app_consts.dart';
import 'package:flutterflow_task/config/session_data.dart';
import 'package:flutterflow_task/config/theming/app_colors.dart';
import 'package:flutterflow_task/config/theming/text_styles.dart';
import 'package:flutterflow_task/core/extensions/context.dart';
import 'package:flutterflow_task/core/helpers/alerts.dart';
import 'package:flutterflow_task/core/services/validators.dart';
import 'package:flutterflow_task/di.dart';
import 'package:flutterflow_task/features/create_order/cubits/order_cubit.dart';
import 'package:flutterflow_task/features/create_order/cubits/products_cubit.dart';
import 'package:flutterflow_task/features/create_order/view/create_order_screen.dart';
import 'package:flutterflow_task/features/general_widgets/main_button.dart';
import 'package:flutterflow_task/features/general_widgets/main_text_field.dart';
import 'package:flutterflow_task/features/general_widgets/spacing.dart';
import 'package:flutterflow_task/features/user_info_form/view/widgets/gender_selection_widget.dart';

class UserInfoForm extends StatefulWidget {
  const UserInfoForm({super.key});

  @override
  State<UserInfoForm> createState() => _UserInfoFormState();
}

class _UserInfoFormState extends State<UserInfoForm> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final isBtnEnabled = ValueNotifier(false);

  _onChangeFields() {
    isBtnEnabled.value = SessionData.inst.userInfo.isValid();
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    ageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Co.background,
      appBar: AppBar(
        title: Text('Enter Your Details'),
        // titleTextStyle: TStyle.blackSemi(22),
        automaticallyImplyLeading: true,
        foregroundColor: Co.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: AppConsts.defaultPadding,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Gender", style: TStyle.blackSemi(16)),
                    ),
                    GenderSelectionWidget(onSelected: (v) {
                      SessionData.inst.userInfo.gender = v;
                      _onChangeFields();
                    }),
                    VerticalSpacing(24),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Weight", style: TStyle.blackSemi(16)),
                    ),
                    MainTextField(
                      controller: weightController,
                      hintText: 'Enter your weight',
                      inputFormatters: FilteringTextInputFormatter.digitsOnly,
                      validator: Validators.notEmpty,
                      onChange: (p0) {
                        SessionData.inst.userInfo.weight = int.tryParse(p0);
                        _onChangeFields();
                      },
                      suffixWidget: Text('Kg', style: TStyle.blackSemi(16)),
                    ),
                    VerticalSpacing(24),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Height", style: TStyle.blackSemi(16)),
                    ),
                    MainTextField(
                      controller: heightController,
                      validator: Validators.notEmpty,
                      hintText: 'Enter your Height',
                      inputFormatters: FilteringTextInputFormatter.digitsOnly,
                      onChange: (p0) {
                        SessionData.inst.userInfo.height = int.tryParse(p0);
                        _onChangeFields();
                      },
                      suffixWidget: Text(
                        'Cm',
                        style: TStyle.blackSemi(16),
                      ),
                    ),
                    VerticalSpacing(24),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Age", style: TStyle.blackSemi(16)),
                    ),
                    MainTextField(
                      controller: ageController,
                      inputFormatters: FilteringTextInputFormatter.digitsOnly,
                      validator: Validators.notEmpty,
                      onChange: (p0) {
                        SessionData.inst.userInfo.age = int.tryParse(p0);
                        _onChangeFields();
                      },
                      hintText: 'Enter your Age',
                      // suffixWidget: Text('Cm', style: TStyle.blackSemi(16),),
                    ),
                  ],
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: isBtnEnabled,
              builder: (context, value, child) => MainButton(
                text: 'Next',
                enable: value,
                margin: AppConsts.defaultHorPadding,
                ontap: () {
                  if (_formKey.currentState?.validate() != true || !SessionData.inst.userInfo.isValid()) {
                    Alerts.showToast('Please Fill All Fields');
                  } else {
                    context.myPush(MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (context) => di<ProductsCubit>()),
                        BlocProvider(create: (context) => di<OrderCubit>()),
                      ],
                      child: const CreateOrderScreen(),
                    ));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
