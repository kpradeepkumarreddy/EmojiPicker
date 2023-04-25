function sendRequest(url, callback)
{
    let request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (request.readyState === XMLHttpRequest.DONE)
            callback(JSON.parse(request.response));
    }
    request.open("GET", url);
    request.send();
}
