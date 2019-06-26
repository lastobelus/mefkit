# Setting up Github Application

## Prerequisites

- github account
- APPNAME
- PORT or DOMAIN

## Steps (development)
- [ ] [New Oauth App](https://github.com/settings/applications/new) on `Settings / Developer settings / OAuth Apps`
  - [ ] Application Name: `$APPNAME Development`
  - [ ] Homepage URL: `http://localhost:$PORT`
  - [ ] Application Description: `Mefkit development environment github oauth app. For internal use only.`
  - [ ] Authorization callback URL: `http://localhost:$PORT/users/auth/github/callback`
  - [ ] Save
- [ ] in `config/application.yml` add `GITHUB_OAUTH_APP_ID: Client ID`
- [ ] in `config/application.yml` add `GITHUB_OAUTH_APP_SECRET: Client Secret`
- [ ] in `config/application.yml` add `GITHUB_OAUTH_APP_URI: https://github.com/settings/applications/ID`

## Steps (all)
- [ ] in `config/initializers/devise.rb` add `config.omniauth :github, ENV.fetch("GITHUB_OAUTH_APP_ID"), ENV.fetch("GITHUB_OAUTH_APP_SECRET"), scope: "user:email"`
