FROM ruby:2.3.0

RUN git clone https://github.com/Farjad/repo-tracker.git \
 && cd repo-tracker \
 && bundle

WORKDIR /repo-tracker

ENTRYPOINT ["thin","-R","config.ru","start"]
