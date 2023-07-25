# iOS Workspace sample with modular app and SDK setup

## Architecture

### API

* Mocked, well-separated and reusable networking module
* The point is only to showcase one way how the networking layer can be reusable and separated so no real networking is implemented

### CoreSDK

* Actual SDK functionality, fetches some info with an injected API client
* Depends on API, reuses it as a service
* The only module that has some showcase tests as well (repository layer)

### SomeApp

* Some dumb app consuming the SDK
* Doesn't know anything about the `API` module
