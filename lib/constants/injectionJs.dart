// ignore_for_file: file_names

import 'package:erp_mru/themes/values/colors.dart';

String initialInjectionJs = '''
        //Login Page Injection 
        document.getElementById("useriid").style.background = "${AccentColors.bg}";
        document.getElementById("actlpass").style.background = "${AccentColors.bg}";
        document.getElementById("psslogin").style.background = "${AccentColors.accent}"; 
        document.getElementsByTagName("a")[3].style.color = "${AccentColors.accent}"; 
        document.getElementsByTagName("img")[1].style.margin='30px';
        document.getElementsByClassName('google-btn')[0].style.display = 'none';
        document.getElementsByClassName('card-body')[0].classList.remove("bg-white");
        document.getElementsByClassName('card-body')[0].style.background ="${AccentColors.bg}";
        document.getElementsByClassName('selection')[0].style.background ="${AccentColors.bg}";
        document.getElementsByClassName('page-content')[0].setAttribute("style","background :#000000 ");
    ''';

String openDrawerJs = '''
      document.getElementsByTagName("body")[0].classList.remove = "mini-sidebar"; 
    ''';

String homeInjectionJs = '''
            document.getElementsByClassName("page-content")[0].style.background = "${AccentColors.bg}"; 
            document.getElementsByClassName("content-area")[0].style.background = "${AccentColors.bg}"; 
            document.getElementsByClassName("page-content")[0].style.color = "#000000"; 
            document.getElementsByClassName("navbar")[0].style.background = "${AccentColors.bg}";
            document.getElementsByClassName("card-body")[0].style.background = "${AccentColors.bg}"; 
            document.getElementsByClassName("navbar")[0].innerHTML = "<h2>ERP Black</h2>"; 
            document.getElementsByClassName("navbar")[0].style.color = "#ffffff"; 
            document.getElementsByClassName("navbar")[0].style.position = "absolute"; 
            document.getElementsByClassName("navbar")[0].style.left = "100px"; 
            document.getElementsByClassName("badge")[0].innerHTML = "Developed by Sk & Gns"; 
            document.getElementsByClassName("navbar")[0].style["boxShadow"] = "0px 0px 0px 0px"; 
            document.getElementsByTagName("body")[0].style.background = "${AccentColors.bg}"; 
            document.getElementById("sidebar").style.background = "${AccentColors.bg}"; 

            //beta


            // document.getElementById("sidebar").style.display ="none";
            document.getElementsByClassName("sidebar-header")[0].remove();
            // document.getElementsByClassName("col-md-2")[0].innerHTML = "<a href='attendance/myattendance.php'>Visit W3Schools.com!</a>";


            //
            // document.getElementsByTagName("img")[1].src = "https://cdn.pixabay.com/photo/2017/11/07/07/06/menu-2925825_1280.png";
            document.getElementById("actlpass").click(); 
            document.getElementById("useriid").click(); 
    ''';

String autoLoginjs(String userId, String pwd) => '''  
                  document.getElementById("useriid").value = "$userId"; 
                  document.getElementById("actlpass").value = "$pwd"; 
                  document.getElementById("selectbrid").add(new Option('MRU','3'),undefined);
                  document.getElementById("selectbrid").value = 3;
                  document.getElementById("psslogin").click();     
            ''';
