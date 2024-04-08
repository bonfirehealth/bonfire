async function fetchPut(payload) {
    const url = payload['url'];
    const body = payload['body'];
    try {
        const response = await fetch(url, {
            method: 'PUT',
            mode: 'cors',
            body: body,
        });
        const responseJson = await response.text();
        return {
            statusCode: response.status,
            reasonPhrase: response.statusText,
            jsonResponse: responseJson,
        };
    } catch (error) {
        return {
            statusCode: 500,
            reasonPhrase: error,
            jsonResponse: {},
        };
    }
}
