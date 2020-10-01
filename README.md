# README

# Group Looper
## A Multi-player Music Looping Tool For Real-Time Remote Collaboration

To try it for yourself, visit [Group Looper on Surge](https://erratic-pest.surge.sh)

Here's the link for the [Group Looper Front-end Repo on Github](https://github.com/edensongjbs/group-looper-frontend)

Check Out the [Video Demo](https://www.youtube.com/watch?v=v2WPS7YCb0U&list=PLjQ6pMJBYCggIXv9A20GPGB2SEx_aymRO&index=1)

## Tech Stack

**Built With**
- React.js
- Redux/Redux-Thunk
- Ruby on Rails (API) with ActionCable (WebSocket)
- Tone.js
- Custom CSS

## About

**Group Looper** is my response to an urge to collaborate musically despite our current need for physical isolation. The platform acts as a typical music looping tool where the user can initiate a new session, record a part, save it, and then start to layer new parts on top of it.  However, **Group Looper** also allows a user to invite other users to their session and build upon each other's musical ideas in real time.  Because everything is loop based and repeats at predictable, pre-defined intervals, we don't need to minimize latency the same way we would in a typical remote collaboration session, which is impossible in most cases.

## Instructions

You can visit a deployed demo version of **Group Looper** [here](https://erratic-pest.surge.sh).  Please note that the back-end API for the playable demo is currently deployed on Heroku, so the first API request can take a while before the server responds.  Subsequent requests should be fairly quick.

### Getting Started

Start by creating a new account or logging into an existing account.  Once logged in, you can choose an existing session or start a new one.  When setting up a new session, please note: 
- Tempo is in beats per measure (bpm).  The metronome always clicks the quarter note, accenting the first beat of the bar, so very slow tempos are not recommended.  - Number of Bars refers to the total number of measures before the composition loops back to the beginning.  The metronome track provides no countoff bars before the downbeat of measure 1, so if you want to record a phrase starting on beat 1 of measure 1, you should wait an entire cycle of the composition before playing the part.

### The Session

Once you're inside a loop session, the sampler will respond to keypresses.  Middle row keys A-K correspond to the white keys in order, and the corresponding upper row keys are the black keys.

Start off by selecting a sound/patch from the dropdown menu.  You can name the new layer by double clicking the text "Enter Layer Name" and typing in a new name.

When you are ready to start recording, hit the play button and wait an appropriate number of metronome cliks before entering.

You can stop and restart the loop at any point.

If you want to commit your part and start work on a new part, hit the commit button and the newly created layer will show up on the right hand side "Layers" container.  You can mute and unmute layers by clicking the layer name and you can permanently delete the part by clicking on the "X" icon next to the corresponding layer name.

If you want to add a collaborator to the session, click on the "+" icon to the left of the title text for the Users container.  You'll be prompted to enter the user name.  There is currently no mechanism for searching for active users, so you will need to enter your collaborator's username precisely (they will need to have an account before they can be added).  The owner of the session has the ability to remove users as well.  A user can also remove themselves and any other user they add.  

All users will have control over muting/unmuting layers in their local session, but a user can only permanently delete their own layers, unless they are the owner of the session, in which case they can delete any layer except the read-only metronome track.
