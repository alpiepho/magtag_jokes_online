## Get Application
Version: 0.1

GH-Pages site: https://alpiepho.github.io/magtag_jokes_online/

or QR Code:

<br>
<b>TRY ME!</b>

![QR Code](./qr-code.png)



## magtag_jokes_online

The [Dad-Joke-Machine](https://github.com/alpiepho/magtag-jokes) project inspired this online/PWA version...because it needs to be shared beyond the refridgerator magnet hardware...your kids deserve it! :)

This is a simple Flutter web application, with a Github actions backend to peridoically update the list of possible jokes.  This is slightly different from the hardware version that hourly gets the next joke from online.  Just think, your kids can be entertained more rapidly but just hitting the refresh button. (They will thank your...or just groan like mine do).

## Operation
There are only 2 user controls: 1) a slider and 2) a "next" button.  The next button rolls to the next joke.  The slider works like the hardware slider, allowing for other data:
1. Dad Jokes
2. Quotes
3. Stoic Quotes
4. Bruce Lee Quotes
5. (also Bruce Lee Quotes)

The application from the above URL will open a respoonsive web page. It is best viewed on a mobile phone with the most testing on and iPhoneX. If opened on iPhone Safari, you can used the middle bottom button to add to the Home Screen (as a PWA).


## Learnings

Below are some things I learned with this project.
- good refresher on Flutter
- was able to leverage many pieces from other projects
- code it probably a little messy

## Ongoing Progress

- BASIC IMPLEMENTATION
- [done] start project from flutter create
- [done] update README
- [done] leverage [timers_tn](https://github.com/alpiepho/timers_tn) since it has many of the layout pieces we need
- [done] clean up unwanted
- [done] create 3x3 grid
- [done] engine for jokes from data files
- [done] start first joke list
- [done] start first list for other subjects
- [done] hook up next
- [done] hook up slider
- [done] split always list of jokes
- [done] set up peanut publish
- [done] links to gh etc
- [done] fix line height
- [done] back to 1hr
- [done] qr code with try-me
- [done] engine access sites for messages
- [done] update readme
- [done] favicon and icons
- [done] save slider value


## Known Issues to Fix and TODO
- the http get of quotes fails for CORS (request is currently disabled)
- need to review code, refactor?

