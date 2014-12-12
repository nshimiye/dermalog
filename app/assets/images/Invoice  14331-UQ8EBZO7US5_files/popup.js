if ("undefined" === typeof __rrExitSurvey) {
    var __rrExitSurvey = true;
    window._rrES = (function(w, cfg) {
        cfg.seller_id = cfg.seller_id || 0;
        
        cfg.rrAutoShow = (typeof w.rrAutoShow != "undefined") ? w.rrAutoShow : true;
        if (cfg.email) {
            var e = cfg.email.replace(' ', '');
            while (cfg.email != (e = decodeURIComponent(e))) {
                cfg.email = e;
            }
        }

        var __scrpt = document.createElement('script');
            __scrpt.src="//www.resellerratings.com/popup/javascript/" + cfg.seller_id + ".js?_="+Math.random();
            __scrpt.type='text/javascript';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(__scrpt, s);

        return cfg;
    })(window, (window._rrES || {email: window.__rr_email_pass, invoice: window.__rr_inv, auto:window.__rr_autoEnroll, seller_id:window.seller_id}));
}
