# elm-web-app
This project contains an app built with Elm functional language and a server built with Haskell.
Application connects with the server in order to get json data, then converts it and shows result on the page.


# Getting started

## elm-app

Best way is to use yarn, You can download it from [yarn.pkg.com](https://yarnpkg.com/lang/en/)  

Download this repository, then go into elm-app.  

Before start, You will need to install some dependencies of the project.  
To install all the dependencies, type:
```
yarn install
```
Or:
```
yarn
```

Information about required dependencies You can find in package.json and elm-package.json.  

After Installing, just type:

```
yarn start
```
App will start at port : 3000  
In Your browser type:
```
localhost:3000
```
## haskell-server

Best way is to use Haskell Stack, You can download it from [docs.haskellstack.org](https://docs.haskellstack.org/en/stable/README/)


Download this repository, then go into server-haskell.

Before start, You will need to install dependencies.  
To install it, type:
```
stack build
```
Information about dependencies You can find in my-project.cabal  

After installing, type:
```
stack exec server
```
Server will start on port : 7000





