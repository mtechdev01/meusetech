/*! Select2 4.0.0 | https://github.com/select2/select2/blob/master/LICENSE.md */
!function(){if(jQuery&&jQuery.fn&&jQuery.fn.select2&&jQuery.fn.select2.amd)var n=jQuery.fn.select2.amd;return n.define("select2/i18n/hr",[],function(){function n(n){var e=" "+n+" znak";return 5>n%10&&n%10>0&&(5>n%100||n%100>19)?n%10>1&&(e+="a"):e+="ova",e}return{inputTooLong:function(e){var r=e.input.length-e.maximum;return"Unesite "+n(r)},inputTooShort:function(e){var r=e.minimum-e.input.length;return"Unesite jo\u0161 "+n(r)},loadingMore:function(){return"U\u010ditavanje rezultata\u2026"},maximumSelected:function(n){return"Maksimalan broj odabranih stavki je "+n.maximum},noResults:function(){return"Nema rezultata"},searching:function(){return"Pretraga\u2026"}}}),{define:n.define,require:n.require}}();