var isChrome = (/\bchrome\b/).test(navigator.userAgent.toLowerCase());
dwr.engine.transport.iframe.loadingComplete = function(batchId) {
    var batch = dwr.engine._batches[batchId];
    if(!isChrome)
    if (batch) dwr.engine.batch.validate(batch);
};
dwr.engine.setErrorHandler(dispatchErr); 

function dispatchErr( msg , ex ) { 
	alert(msg);
} 