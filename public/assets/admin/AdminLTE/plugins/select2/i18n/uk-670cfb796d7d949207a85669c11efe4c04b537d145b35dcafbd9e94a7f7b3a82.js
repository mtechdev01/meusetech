/*! Select2 4.0.0 | https://github.com/select2/select2/blob/master/LICENSE.md */
!function(){if(jQuery&&jQuery.fn&&jQuery.fn.select2&&jQuery.fn.select2.amd)var n=jQuery.fn.select2.amd;return n.define("select2/i18n/uk",[],function(){function n(n,e,u,r){return n%100>10&&15>n%100?r:n%10===1?e:n%10>1&&5>n%10?u:r}return{errorLoading:function(){return"\u041d\u0435\u043c\u043e\u0436\u043b\u0438\u0432\u043e \u0437\u0430\u0432\u0430\u043d\u0442\u0430\u0436\u0438\u0442\u0438 \u0440\u0435\u0437\u0443\u043b\u044c\u0442\u0430\u0442\u0438"},inputTooLong:function(e){var u=e.input.length-e.maximum;return"\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0438\u0434\u0430\u043b\u0456\u0442\u044c "+u+" "+n(e.maximum,"\u043b\u0456\u0442\u0435\u0440\u0443","\u043b\u0456\u0442\u0435\u0440\u0438","\u043b\u0456\u0442\u0435\u0440")},inputTooShort:function(n){var e=n.minimum-n.input.length;return"\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0456\u0442\u044c "+e+" \u0430\u0431\u043e \u0431\u0456\u043b\u044c\u0448\u0435 \u043b\u0456\u0442\u0435\u0440"},loadingMore:function(){return"\u0417\u0430\u0432\u0430\u043d\u0442\u0430\u0436\u0435\u043d\u043d\u044f \u0456\u043d\u0448\u0438\u0445 \u0440\u0435\u0437\u0443\u043b\u044c\u0442\u0430\u0442\u0456\u0432\u2026"},maximumSelected:function(e){return"\u0412\u0438 \u043c\u043e\u0436\u0435\u0442\u0435 \u0432\u0438\u0431\u0440\u0430\u0442\u0438 \u043b\u0438\u0448\u0435 "+e.maximum+" "+n(e.maximum,"\u043f\u0443\u043d\u043a\u0442","\u043f\u0443\u043d\u043a\u0442\u0438","\u043f\u0443\u043d\u043a\u0442\u0456\u0432")},noResults:function(){return"\u041d\u0456\u0447\u043e\u0433\u043e \u043d\u0435 \u0437\u043d\u0430\u0439\u0434\u0435\u043d\u043e"},searching:function(){return"\u041f\u043e\u0448\u0443\u043a\u2026"}}}),{define:n.define,require:n.require}}();