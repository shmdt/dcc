#start with the base ruby image
FROM ruby:2.7.2

#make sure we have a folder called /app
RUN mkdir /app

#cd into our app folder each time we start up
WORKDIR /app

#copy app to container
COPY ./ /app/

RUN gem install bundler

#install gems
RUN bundle install --jobs 3
