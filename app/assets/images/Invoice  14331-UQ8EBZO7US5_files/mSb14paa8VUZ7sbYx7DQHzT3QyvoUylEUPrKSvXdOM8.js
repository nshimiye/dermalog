//global SU namespace
window.su = {};

(function(){
    function logError(message){
        var xhr = new XMLHttpRequest();

        xhr.open('POST', '/api/clientError?message=' + message, true); //asynchronous
        xhr.send();
    }

    function suErrorHandler(msg, url, linenumber) {
        var message = [msg, encodeURIComponent(url), linenumber].join(' ');
        logError(message);
        
        //return true; if true error is considered handled and not logged to console
    }
    
    //add as global error handler
    window.onerror = suErrorHandler;
    //expose ability to log handled errors
    window.su.logError = logError;
})();