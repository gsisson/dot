// https://github.com/johnste/finicky
module.exports = {
    defaultBrowser: "Google Chrome",
    rewrite:
        [
            {
                // Redirect all urls to use https
                match: ({
                    url
                }) => url.protocol === "http",
                url: {
                    protocol: "https"
                }
            },
            {
                // rewrite quip:// urls to https://quip-amazon.com
                match: ({
                    url
                }) => url.protocol === "quip",
                url: ({
                    url
                }) => ({
                    ...url,
                    protocol: "https"
                })
            },
            {
                // rewrite http[s]://chime.aws/<meetingID> to chime://meeting?pin=meetingId>
                match: finicky.matchHostnames(["chime.aws"]),
                url: ({
                    url
                }) => ({
                    ...url,
                    host: "",
                    search: "pin=" + url.pathname.substr(1),
                    pathname: "meeting",
                    protocol: "chime"
                })
            }
        ],
    handlers:
        [
            {
                match: /zoom.us\/j\//,
                browser: "/Applications/zoom.us.app"
            },
            {
                // Open apple.com and example.org urls in Safari
                match: ["apple.com*", "example.org*"],
                browser: "Safari"
            },
            {
                // Open AWS "expenses" site in Firefox (image uploads hang for me in Chrome)
                match: /expenses.corp.amazon.com/,
                browser: "Firefox"
            },
            {
                // Open google.com and *.google.com urls in Google Chrome
                match: [
                    "google.com*", // match google.com urls
                    finicky.matchDomains(/.*\.google.com/) // use helper function to match on domain only
                ],
                browser: "Google Chrome"
            },
//          {
//              match: finicky.matchHostnames(["broadcast.amazon.com"]),
//              browser: "/Applications/Safari.app"
//          },
            {
                match: ({
                    url
                }) => url.protocol === "chime",
                browser: "/Applications/Amazon\ Chime.app"
            }
        ]
};
