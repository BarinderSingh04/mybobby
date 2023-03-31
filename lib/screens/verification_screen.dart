
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mybobby/providerNotifier/login_notifier.dart';
import 'package:mybobby/widgets/custombutton.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../widgets/circleBackButton.dart';

class Verification_Screen extends ConsumerStatefulWidget {
   const Verification_Screen({Key? key}) : super(key: key);

  @override
  ConsumerState<Verification_Screen> createState() => _Verification_ScreenState();
}

class _Verification_ScreenState extends ConsumerState<Verification_Screen> {
 late Timer _timer;
 int _start = 30 ;
 final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 TextEditingController otpController = TextEditingController();

 @override
 void initState() {
   super.initState();
   Timer(const Duration(milliseconds: 1),() => startTimer());
 }
 void startTimer() {
   const oneSec = Duration(seconds: 1);
   _timer = Timer.periodic(
     oneSec,
         (Timer timer) {
       if (_start == 0) {
         _timer.cancel();

       } else {
         setState(() {
           _start--;
         });
       }
     },
   );
 }

 @override
 void dispose() {
   _timer.cancel();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true ,
        title: const Text("Verification",style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF010317)
        ),),
        leading: Padding(
          padding: const EdgeInsets.only(
              left: 14
          ),
          child: CircleBack_Button(onPressed: () {
            Navigator.of(context).pop();
          },),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 12),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              const Text("Enter Verification Code",style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  color: Color(0xFF010317)
              ),),
              SizedBox(height: size.height*0.006,),
               Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: 'Enter the code sent to ',
                      style: TextStyle(fontWeight: FontWeight.w400,color: Color(0xFF868686)),),
                    TextSpan(
                      text: ref.read(loginNotifierProvider.notifier).phone,
                      style: const TextStyle(fontWeight: FontWeight.w400,color: Color(0xFF010317)),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 32,),
              PinCodeTextField(
                controller: otpController,
                onSaved: ref.read(loginNotifierProvider.notifier).updateOtp,
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
                length: 4,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape:PinCodeFieldShape.box,
                    inactiveFillColor: const Color(0xFFF4F5F5),
                    selectedFillColor: const Color(0xFFF4F5F5),
                    inactiveColor: const Color(0xFFF4F5F5),
                    selectedColor: const Color(0xFFEBEBEB),
                    activeColor:const Color(0xFFF4F5F5),
                    borderRadius: BorderRadius.circular(12),
                    borderWidth: 1,
                    fieldHeight: 60,
                    fieldWidth: 60,
                    activeFillColor: const Color(0xFFF4F5F5)
                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   TextButton(
                     onPressed: (){
                       if(_start== 0){

                       }


                  }, child: const Text(
                    "Resend code in ",
                    style: TextStyle(color: Color(0xFF868686),
                        fontWeight: FontWeight.w400),
                  ),),
                  Text(
                    "${_start}s",
                    style: const TextStyle(
                      color: Color(0xFF002F60),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              SizedBox(height: size.height*0.05,),
              CustomButton(title: 'Verify',
                  onPressed: (){
                    debugPrint("inside===>");
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      ref .read(loginNotifierProvider.notifier).verifyOtp();
                    }
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
