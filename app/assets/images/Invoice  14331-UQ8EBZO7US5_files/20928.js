;if (!window.addEventListener) {
    window.addEventListener = function(type, listener, useCapture) {
        window.attachEvent('on' + type, function(){ listener(event); });
    }
}
function __rr_GetEmail() {return _rrES.email || window.__rr_email_pass || window.email_pass;}
function __rr_GetInvoice() {return _rrES.invoice || window.__rr_inv || window.inv;}

var RRExitSurvey = RRExitSurvey || (new function(w) {
    var that = this;

    this.version = "1417029671";
    this.seller_id = 20928;
    this.seo_name = "StudentUniverse";

    this.autoShow = true;
    this.auto = this.autoEnroll = true;

    this.gi = 0;
    this.gPopupMask = null;
    this.gPopupContainer = null;
    this.gPopFrame = null;
    this.gReturnFunc = null;
    this.gPopupIsShown = false;
    this.gDefaultPage = "javascript:void(0)";
    this.gHideSelects = false;
    this.gReturnVal = null;
    this.gTabIndexes = new Array();
    // Pre-defined list of tags we want to disable/enable tabbing into
    this.gTabbableTags = new Array("A", "BUTTON", "TEXTAREA", "INPUT", "IFRAME");

    this.addEvent = function (obj, evType, fn) {
        if (obj.addEventListener) {
            obj.addEventListener(evType, fn, false);
            return true;
        } else if (obj.attachEvent) {
            window["on" + evType] = fn;
            return true;
        } else {
            return false;
        }
    };

    this.getViewportHeight = function () {
        if (window.innerHeight != window.undefined) return window.innerHeight;
        if (document.compatMode == 'CSS1Compat') return document.documentElement.clientHeight;
        if (document.body) return document.body.clientHeight;

        return window.undefined;
    };

    this.getViewportWidth = function () {
        var offset = 17;
        var width = null;
        if (window.innerWidth != window.undefined) return window.innerWidth;
        if (document.compatMode == 'CSS1Compat') return document.documentElement.clientWidth;
        if (document.body) return document.body.clientWidth;
    };

    this.getScrollTop = function () {
        if (self.pageYOffset)
        // all except Explorer
        {
            return self.pageYOffset;
        }
        else if (document.documentElement && document.documentElement.scrollTop)
        // Explorer 6 Strict
        {
            return document.documentElement.scrollTop;
        }
        else if (document.body)
        // all other Explorers
        {
            return document.body.scrollTop;
        }
    };

    this.getScrollLeft = function () {
        if (self.pageXOffset)
        // all except Explorer
        {
            return self.pageXOffset;
        }
        else if (document.documentElement && document.documentElement.scrollLeft)
        // Explorer 6 Strict
        {
            return document.documentElement.scrollLeft;
        }
        else if (document.body)
        // all other Explorers
        {
            return document.body.scrollLeft;
        }
    };

    this.showExitSurvey = function () {
        var total = this.orderTotal(),
            baseUrl = 'https://www.resellerratings.com/popup/survey',
            url = baseUrl + '/' + this.seo_name + '?' + this.version + '&auto=' + (this.auto ? "true" : "false");

        if (this.invoice) url += '&invoice=' + encodeURIComponent(this.invoice);
        if (this.email) url += '&email=' + encodeURIComponent(this.email);
        if (total) url += '&total=' + total;

        this.initPopUp(url);
    };
    
    this.showPopup = function (e) {
        if ((e != "auto" || this.autoShow !== false) && !this.autoEnroll) {
            this.showPopWin(650, 360, null);
        }
        this.showPopWin(650, 360, null);
    };

    this.initPopUp = function (url) {
        // Add the HTML to the body
        theBody = document.getElementsByTagName('BODY')[0];
        popmask = document.createElement('div');
        popmask.id = 'popupMask';
        popmask.onclick = function() { that.hidePopWin(); };

        popcont = document.createElement('div');
        popcont.id = 'popupContainer';
        popcont.innerHTML = '' +
            '<div id="popupInner">' +
            '<div id="popupTitleBar">' +
            '<div id="popCloseHolder"><img src="https://www.resellerratings.com/static/images/close.png" onclick="window.RRExitSurvey.hidePopWin(false);" id="popCloseBox" style="z-index:225"height="27" /></div>' +
            '</div>' +
            '<iframe src="' + this.gDefaultPage + '" style="width:100%;height:100%;background-color:transparent;overflow:hidden;" scrolling="no" frameborder="0" allowtransparency="true" id="popupFrame" name="popupFrame" width="100%" onload="window.RRExitSurvey.showPopup(\'auto\')"></iframe>' +
        '<div  style="margin-top:0px;background-color:#4d94cc;height: 60px;color: white; padding-top:10px" style="margin-top:0px"><span style="float:left; margin-left:10px;"><a style="color:white;text-decoration:underline;" href="#" class="no_thanks" onclick="window.RRExitSurvey.hidePopWin(false);">No thanks, not today</a> | Read our <a style="color:white" href="http://www.resellerratings.com/privacy-policy" target="_blank"><strong>No Spam Policy</strong></a> and <a style="color:white" href="http://www.resellerratings.com/ipad-giveaway" target="_blank"><strong>iPad drawing</strong></a> details</span> <img style="height:50px;margin-top:-5px;float:right;" src="https://www.resellerratings.com/static/images/rr_logo.png"> </div>' +
        '</div>';
        theBody.appendChild(popmask);
        theBody.appendChild(popcont);

        this.gPopupMask = document.getElementById("popupMask");
        this.gPopupContainer = document.getElementById("popupContainer");
        this.gPopFrame = document.getElementById("popupFrame");

        // check to see if this is IE version 6 or lower. hide select boxes if so
        // maybe they'll fix this in version 7?
        var brsVersion = parseInt(window.navigator.appVersion.charAt(0), 10);
        if (brsVersion <= 6 && window.navigator.userAgent.indexOf("MSIE") > -1) {
            this.gHideSelects = true;
        }

        // set the url
        this.gPopFrame.src = url;
    };

    this.showPopWin = function(width, height, returnFunc, showCloseBox) {
        if (!this.gPopFrame) return;

        var src = this.gPopFrame.src;
        if (src == "javascript:void(0)") return;
                if (src.indexOf("auto=true") > -1) return;
        
        // show or hide the window close widget
        if (showCloseBox == null || showCloseBox == true) {
            document.getElementById("popCloseBox").style.display = "block";
        } else {
            document.getElementById("popCloseBox").style.display = "none";
        }
        this.gPopupIsShown = true;
        this.disableTabIndexes();
        this.gPopupMask.style.display = "block";
        this.gPopupContainer.style.display = "block";
        // calculate where to place the window on screen
        this.centerPopWin(width, height);

        var titleBarHeight = parseInt(document.getElementById("popupTitleBar").offsetHeight, 10);

        this.gPopupContainer.style.width = width + "px";
        this.gPopupContainer.style.height = (height + titleBarHeight) + "px";

        this.setMaskSize();

        // need to set the width of the iframe to the title bar width because of the dropshadow
        // some oddness was occuring and causing the frame to poke outside the border in IE6
        this.gPopFrame.style.width = parseInt(document.getElementById("popupTitleBar").offsetWidth, 10) + "px";
        this.gPopFrame.style.height = (height) + "px";

        this.gReturnFunc = returnFunc;
        // for IE
        this.gHideSelects && this.hideSelectBoxes();
    };


    this.centerPopWin = function(width, height) {
        if (this.gPopupIsShown == true) {
            if (width == null || isNaN(width)) {
                width = this.gPopupContainer.offsetWidth;
            }
            if (height == null) {
                height = this.gPopupContainer.offsetHeight;
            }

            //var theBody = document.documentElement;
            var theBody = document.getElementsByTagName("BODY")[0],
            //theBody.style.overflow = "hidden";
                scTop = parseInt(this.getScrollTop(), 10);
                scLeft = parseInt(theBody.scrollLeft, 10);

            this.setMaskSize();

            var titleBarHeight = parseInt(document.getElementById("popupTitleBar").offsetHeight, 10),

                fullHeight = this.getViewportHeight(),
                fullWidth = this.getViewportWidth();

            this.gPopupContainer.style.top = (scTop + ((fullHeight - (height + titleBarHeight)) / 2)) + "px";
            this.gPopupContainer.style.left = (scLeft + ((fullWidth - width) / 2)) + "px";
        }
    };

    this.setMaskSize = function() {
        var theBody = document.getElementsByTagName("BODY")[0],
            fullHeight = this.getViewportHeight(),
            fullWidth = this.getViewportWidth();

        // Determine what's bigger, scrollHeight or fullHeight / width
        if (fullHeight > theBody.scrollHeight) {
            popHeight = fullHeight;
        } else {
            popHeight = theBody.scrollHeight;
        }

        if (fullWidth > theBody.scrollWidth) {
            popWidth = fullWidth;
        } else {
            popWidth = theBody.scrollWidth;
        }

        this.gPopupMask.style.height = popHeight + "px";
        this.gPopupMask.style.width = popWidth + "px";
    };
    this.hidePopWin = function(callReturnFunc) {
        this.gPopupIsShown = false;
        var theBody = document.getElementsByTagName("BODY")[0];
        theBody.style.overflow = "";
        this.restoreTabIndexes();
        if (this.gPopupMask == null) {
            return;
        }
        this.gPopupMask.style.display = "none";
        this.gPopupContainer.style.display = "none";
        if (callReturnFunc == true && this.gReturnFunc != null) {
            // Set the return code to run in a timeout.
            // Was having issues using with an Ajax.Request();
            this.gReturnVal = window.frames["popupFrame"].returnVal;
            window.setTimeout(function() { that.gReturnFunc.apply(this, [that.gReturnVal]); }, 1);
        }
        this.gPopFrame.src = this.gDefaultPage;
        // display all select boxes
        this.gHideSelects && this.displaySelectBoxes();
    };

    this.keyDownHandler = function(e) {
        if (this.gPopupIsShown && e.keyCode == 9) return false;
    };

    this.disableTabIndexes = function() {
        if (document.all) {
            var i = 0;
            for (var j = 0; j < this.gTabbableTags.length; j++) {
                var tagElements = document.getElementsByTagName(this.gTabbableTags[j]);
                for (var k = 0; k < tagElements.length; k++) {
                    this.gTabIndexes[i] = tagElements[k].tabIndex;
                    tagElements[k].tabIndex = "-1";
                    i++;
                }
            }
        }
    };

    this.restoreTabIndexes = function() {
        if (document.all) {
            var i = 0;
            for (var j = 0; j < this.gTabbableTags.length; j++) {
                var tagElements = document.getElementsByTagName(this.gTabbableTags[j]);
                for (var k = 0; k < tagElements.length; k++) {
                    tagElements[k].tabIndex = this.gTabIndexes[i];
                    tagElements[k].tabEnabled = true;
                    i++;
                }
            }
        }
    };

    this.hideSelectBoxes = function() {
        var x = document.getElementsByTagName("SELECT");

        for (i = 0; x && i < x.length; i++) {
            x[i].style.visibility = "hidden";
        }
    };

    this.displaySelectBoxes = function() {
        var x = document.getElementsByTagName("SELECT");

        for (i = 0; x && i < x.length; i++) {
            x[i].style.visibility = "visible";
        }
    };

    this.orderTotal = function() {
        var dochtml = document.body.innerHTML;
        __rr_total = 0;
        dochtml = dochtml.replace(/(\r\n|\n|\r)/gm, "");

        var price_array = new Array;
                    var pattmatch = /(\$(([0-9]{0,1})?\.[0-9]{1,2}))|(\$([1-9]{1}[0-9]{0,2}([,][0-9]{3})*)(\.[0-9]{1,2})?)/gi;
        
        price_array = dochtml.match(pattmatch);

        if (price_array) {
            for (var i = 0; i < price_array.length; i++) {
                var value = parseFloat(price_array[i].replace(/\$/, ""));

                if (value > __rr_total || !__rr_total) {
                    __rr_total = value;
                }
            }
        }

        return __rr_total;
    };

    this.validateEmail = function(email) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    };

    this.init = function() {
        this.addEvent(window, "resize", function() { that.centerPopWin(); });
        this.addEvent(window, "scroll", function() { that.centerPopWin(); });
        this.addEvent(document, "keypress", function() { that.keyDownHandler(); });

        var lnk = document.createElement('link');
        lnk.rel = 'stylesheet';
        lnk.href = "https://www.resellerratings.com/static/css/popup_survey.css?1417029671";
        lnk.type = "text/css";
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(lnk, s);
    };

    this.init();
    this.invoice = "";
    this.email = "";

    this.load = function(settings) {
        this.invoice = settings.invoice || this.invoice;
        this.email = settings.email || this.email;
        if (this.email == "customer@home.com" ||this.email == "customer@domain.com") {
            this.email = "";
        }

        this.autoShow = (typeof settings.rrAutoShow == "undefined") ? true : settings.rrAutoShow;

        // Auto defaults to whatever the merchant has set in their dashboard
        // If they've enabled it then we'll look at the settings.auto value for a potential disable otherwise
        // it defaults to true as long as the email is valid

        if (this.autoEnroll) {
            var validEmail = this.validateEmail(this.email);
            this.auto = (validEmail && ((typeof settings.auto == "undefined") ? true : settings.auto));
        }
        if (document.readyState == "complete") {
            this.showExitSurvey();
        } else {
            this.addEvent(window, 'load', function() {that.showExitSurvey.apply(that, []); });
        }
        return this;
    }
}(window).load(_rrES || {inv: __rr_inv, email: __rr_email_pass}));

if ( "undefined" === typeof window.RRExitSurvey) {
    window.RRExitSurvey = RRExitSurvey;
}

if (typeof window.RRExitSurvey == "undefined") {window.RRExitSurvey = RRExitSurvey;}
var __rr_showPopup = function() {window.RRExitSurvey.showPopup('manual');};
