### TeamSnap API Exploration

This app is created to explore the TeamSnap API. The TeamSnap API is a Collection+JSON type API.

This app will use OAuth2 to authenticate that the user has access to their information via the TeamSnap API. Once authenticated it will show team info, member info, and other stats related to the user/team.

The purpose of this app is to learn the TeamSnap API, and to learn how to navigate a Collection+JSON API. The functionality of the app is much more well suited for a Single Page app and a front-end framework such as Ember or Angular would be a better choice to carry this type of app forward. It is built in Rails to see what connecting to the TeamSnap API through Rails could look like.

---
#### Setup
Clone this repo, change to it's directory:
```
git clone https://github.com/adammcfadden/teamsnap.git
cd teamsnap
```


Run Bundle Install:
```
bundle install
```


Create a .env file at the root level

```
touch .env
```

The .env file should hold the following variables, and have the following format. (the codes given below are samples and will not work.)


```
CLIENT_ID: kahsfiudfhq9p4uhfiausnf9p2873h984y857wruhef984
CLIENT_SECRET: 9845y9nf9854fjsgb573fyn87o4bfhf4ub5fhd8d47m4334
```
You can get your CLIENT_ID and CLIENT_SECRET at the [TeamSnap Auth](https://auth.teamsnap.com) site.

Start the Rails server:
```
rails s
```

Navigate to http://localhost:3000/

This will redirect you too TeamSnap's Auth page where you will need to sign-in. After that you will be redirected back and be able to explore the app!

---
#### Author
Adam McFadden

#### Copyright
2015 Adam McFadden


#### License
MIT
