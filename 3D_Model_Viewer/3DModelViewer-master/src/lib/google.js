
export const onGoogleScriptLoad = decodeJwtResponse => {
    try {
        const handleCredentialResponse = async response => {
            // decodeJwtResponse() is a custom function defined by you
            // to decode the credential response.
            /*const result = decodeJwtResponse(response.credential)
            if (result.redirected) {
                goto(result.url);
            } else {
                const data = await result.json();
                console.log(data);
            }*/
           await decodeJwtResponse(response.credential);

           window.location.reload();
        }

        google.accounts.id.initialize({
            client_id: import.meta.env.VITE_GOOGLE_SIGNIN_API_KEY,
            callback: handleCredentialResponse
        })

        google.accounts.id.renderButton(
            document.getElementById("googleSignIn"), // customization attributes
            {
                theme: "outline",
                size: "large",
                text: "signin_with",
                shape: "rectangular",
                logo_alignment: "left"
            }
        )

        google.accounts.id.prompt() // also display the One Tap dialog
    } catch {}
}

export const decodeJwtResponse = async token => {
    const base64Url = token.split(".")[1]
    const base64 = base64Url.replace(/-/g, "+").replace(/_/g, "/")
    const jsonPayload = decodeURIComponent(
        atob(base64)
            .split("")
            .map(c => {
                return "%" + ("00" + c.charCodeAt(0).toString(16)).slice(-2)
            })
            .join("")
    )
    /*const jsonParsed = JSON.parse(jsonPayload);
    const response = await fetch('/auth/login/jwt', {
        method: 'POST',
        body: JSON.stringify(jsonPayload),
        headers: {
            'Content-Type': 'application/json'
        }
    });
    //console.log(jsonParsed);
    return response;*/

    await fetch('/auth/login/jwt', {
        method: 'POST',
        body: JSON.stringify(jsonPayload),
        headers: {
            'Content-Type': 'application/json'
        }
    });
}
