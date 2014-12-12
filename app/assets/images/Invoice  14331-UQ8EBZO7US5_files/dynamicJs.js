	var cookiesRequiredPageLink = 'https://www.studentuniverse.com/cookies-required';

	if( !navigator.cookieEnabled && window.location.href != cookiesRequiredPageLink ) {
		window.location.replace(cookiesRequiredPageLink);
	}
	if( window.location.href.indexOf('#ref') != -1 ) {
		location.hash = 'new';
		window.location.reload(true);
	}

	var cartCheckoutLink = '/app/cart/checkout';
	var cartActionLink = '/app/cart/cartAction';
    var showCartLink = '/app/cart/cart';
//    var groupsCartPassportInfoLink = '/app/group/ajaxPassportInfo';
    var groupsCartSummaryLink = '/app/group/cartSummary';
    var groupsBillingFormPayOptsLink  = '/app/group/billingFormPaymentOpts';
	var addTravelerLink = '/app/cart/addTraveler?format=json';
	var checkEmailLink = '/app/user/checkEmail?format=json';
	var setComparePartnerOffOnLink = '/app/product/setComparePartnerOffOn';
	var activitiesWidgetLink = '/grails/product/activities';
	var findContentLink = '/grails/content/findPage';
	var filterProductsUrl = "/grails/apiCall/index?method=filter";
	var cartAddOnLink = '/app/cart/addOn?format=json';
//	var cartAddOnAllLink = '/app/cart/addOnAll?format=json';
	var cartUpdateUpsellLink = '/app/cart/updateUpsellInCart?format=json';
	var cartUpdateCCFeeInCartLink = '/app/cart/updateCreditCardFeeInCart?format=json';
	var isUpsellUpdateDone = false;
	var validateInsuranceBillingAddressLink = '/app/cart/validateInsuranceBillingAddress?format=json';
	var citiesByCountryUrl = "/grails/apiCall/index.json";
	var compareURL = "/app/product/compare";
	var verifyMeLink = '/app/verification/verifyUserAjax';
	var veduCheckLink = '/app/user/veduCheck';
	var manualUploadLink = '/app/user/manualUpload';
	var userLoginWindowLink = '/app/user/loginWindow';
	var updateVerifyStatusLink = '/app/verification/updateVerifyStatus';
	var clientLogger = '/app/logging/clientLogger';
	var cartFinalizedUrl = '/order-finalized';
	var statesByCountryBillingUrl = '/app/cart/statesByCountryBilling';
	var statesByCountryContactUrl = '/app/cart/statesByCountryContact';
	var statesByCountryAddschoolUrl = '/app/cart/statesByCountryAddschool';
	var dealsRedirectLink = '/deals/redirect?locationId=&dealId=';
	var logToStatServerLink = '/app/logging/logToStatServer?format=json';
	var tourCalendarBodyLink = '/app/tour/loadCalendarBody';
	var comparePopupPlaceholderLink = '/staticPage/comparePopupPlaceholder';

	var changeLocaleLink = '/app/content/changeLocale';

	var verifyOnlyUpdateTime = 120000; // best place for this?

	var autocheckVerifiedStatus;
	
	var sortArrowOff = "/static/RZjPs1TfcNdfN6SC28KjvY2aJbiHeO72MZhOhx74YUs.png";
	var arrowDown = "/static/sECowNdESGV7uvSUZfdvm2T8rLsCV9geXP3Mnfu4NmV.png";
	var arrowTop = "/static/3E0s0Mvwn4wnZxg26jETyjYYegrWbtX6qWblFVYsJyL.png";

	var ccImages = new Array();
	ccImages["visa"] = '/static/D6eSPaRXCf5vFUcHNYFv4fE5ONNIe1zb4VaMn302dRv.png';
	ccImages["mastercard"] = '/static/ny5fSYn2D8icDNNvSnnCjTkbyG3lV3gvmHDWH37Uyf8.png';
	ccImages["amex"] = '/static/mYOPnBIANP11Mww1X5ipAwmTlVQCTJPMFTWcigqEqx.png';
	ccImages["discover"] = '/static/KsDrbhyZBjTr8Ihe1E0lr5sYuun6Pgh8EYGxsqNV3E6.png';
	ccImages["all"] = '/static/HT9xGafsC6f5ymAw0GcMlX1UDgz0nYEp6Wzc94jVUxo.png';
	ccImages["visa_on"] = '/static/eGNNKb9FQRCbMkS5m14MMnp9MOOdWVhr79FmGA3vagm.png';
	ccImages["mastercard_on"] = '/static/D4ezSpUnH77noJxjRehogKCm8BfC43RAixvgIajfWFw.png';
	ccImages["amex_on"] = '/static/4fUm1C2Es8PSDONBDpudAPZinxX9CnSfQb2bVAQe1me.png';
	ccImages["discover_on"] = '/static/HpY5ylT0NaSF86BqOpYxzRfQSjla00jnwAuKhUfbGR8.png';
	ccImages["visa_off"] = '/static/RcXCmVGDCzPs3PJmBmBfhxlesF3ZnkMgUTTNYnlnDFH.png';
	ccImages["mastercard_off"] = '/static/rhop0Umn0HtdfRdT0jiADIMTPytTUtE9zvr77EiYsbd.png';
	ccImages["amex_off"] = '/static/Ce6zUfiYINW76XvKuCXLWHkbF4p4K0nsnwjPC8ltVR4.png';
	ccImages["discover_off"] = '/static/O79Id0xlQGevQ43yt4zMLedJ3X5py1s2fQHDYvh605e.png';

	var sessionActiveUrl = '/app/test/sessionActive'
	var expireSessionUrl = '/app/user/expireSession'
	var sessionTimeoutWarningPeriod = 120000;
	var sessionTimeoutCheckInterval = 60000;
	var maxKeepAliveFrequency = 60000;
	var keepAliveEnabled = true;
	var keepAliveUrl = '/app/test/keepAlive';
	var currencySymbol = '$';
	
	// Bug 9917: if property showMissingTranslations = true, make sure this is excluded or else JS errors will occur
	// this is where you can put hotfixes for javascript code/functions via StaticContent piece 'dynamic_javascript'
