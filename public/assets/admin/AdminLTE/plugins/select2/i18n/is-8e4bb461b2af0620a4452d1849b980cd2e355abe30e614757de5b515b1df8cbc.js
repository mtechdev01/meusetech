/*! Select2 4.0.0 | https://github.com/select2/select2/blob/master/LICENSE.md */
!function(){if(jQuery&&jQuery.fn&&jQuery.fn.select2&&jQuery.fn.select2.amd)var n=jQuery.fn.select2.amd;return n.define("select2/i18n/is",[],function(){return{inputTooLong:function(n){var e=n.input.length-n.maximum,t="Vinsamlegast stytti\xf0 texta um "+e+" staf";return 1>=e?t:t+"i"},inputTooShort:function(n){var e=n.minimum-n.input.length,t="Vinsamlegast skrifi\xf0 "+e+" staf";return e>1&&(t+="i"),t+=" \xed vi\xf0b\xf3t"},loadingMore:function(){return"S\xe6ki fleiri ni\xf0urst\xf6\xf0ur\u2026"},maximumSelected:function(n){return"\xde\xfa getur a\xf0eins vali\xf0 "+n.maximum+" atri\xf0i"},noResults:function(){return"Ekkert fannst"},searching:function(){return"Leita\u2026"}}}),{define:n.define,require:n.require}}();