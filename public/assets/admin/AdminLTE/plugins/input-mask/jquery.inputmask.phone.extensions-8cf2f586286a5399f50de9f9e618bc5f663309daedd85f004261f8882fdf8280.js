/*
Input Mask plugin extensions
http://github.com/RobinHerbots/jquery.inputmask
Copyright (c) 2010 - 2014 Robin Herbots
Licensed under the MIT license (http://www.opensource.org/licenses/mit-license.php)
Version: 0.0.0

Phone extension.
When using this extension make sure you specify the correct url to get the masks

 $(selector).inputmask("phone", {
                url: "Scripts/jquery.inputmask/phone-codes/phone-codes.json", 
                onKeyValidation: function () { //show some metadata in the console
                    console.log($(this).inputmask("getmetadata")["name_en"]);
                } 
  });


*/
!function(n){n.extend(n.inputmask.defaults.aliases,{phone:{url:"phone-codes/phone-codes.json",mask:function(a){a.definitions={p:{validator:function(){return!1},cardinality:1},"#":{validator:"[0-9]",cardinality:1}};var p=[];return n.ajax({url:a.url,async:!1,dataType:"json",success:function(n){p=n}}),p.splice(0,0,"+p(ppp)ppp-pppp"),p}}})}(jQuery);