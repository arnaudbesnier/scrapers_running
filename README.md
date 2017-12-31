# Manual for my beloved father

## Clone the code

Go to the repository your want (ideally your workspace).
Clone this code on your desktop using Git (https://en.wikipedia.org/wiki/Git):
```
git clone https://github.com/arnaudbesnier/scrapers_running.git
```

It will create the `scrapers_running` repository on your desktop.

## Setup

Install Bundler to manage your dependencies:
```bash
gem install bundler
```

Go to the `scrapers_running` directory:
```bash
cd scrapers_running
```

Install the project dependencies (aka Gems):
```bash
bundle install
```

## Execute it!

Go to the `runnerbreizh` directory:
```bash
cd runnerbreizh
```

Scrape the website:
```bash
ruby scraper.rb
```

It will generate (or update) a `performance.csv` file in the same repository that contains all the performances retrieved for the runners listed in the `runners.json` file.
To have more runners performances, simply edit the `runners.json` file to had more names and launch the scraping one more time.
