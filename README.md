### Veggies ###

## Setup ##

Veggies requires several environment variables to be set in order to work:

# Rails secret key base #

`VEGGIES_SECRET_KEY` - Use rake secret to generate a value for this variable.

Either create your own twitter application in https://dev.twitter.com or ask us 
for the dummy twitter app credentials:
`TWITTER_CONSUMER_KEY`
`TWITTER_CONSUMER_SECRET`

## Import DB from production ##
You can import data from the production environment by running 
`./scripts/import_db veggies_development`, assuming you have the heroku remote 
configured and you are a collaborator.
