# Demo Flutter

Demo application built with Flutter

## Usage

Clone the repository

`git clone https://github.com/LuisNunez88/demo_just.git`

## Prerequisite

- Flutter 3.13.6

## Getting Started

### Setup

###### 1. Create env file

- Create `.env` file in the root directory according and add the required environment variables into them. The example environment variable is in `.env.sample`.

  - Create an account in https://apifootball.com for get an APIkey.
  - Set demo user email and password

###### 2. Download dependency

```bash
$ flutter pub get
```

###### 3. Run code generator

```bash
$ flutter pub run build_runner build --delete-conflicting-outputs
```

###### 4. Run

- Run the application if you run it on the web, make sure to use the tag:

`$ --web-browser-flag "--disable-web-security"`
