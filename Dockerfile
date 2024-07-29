# Use an official Ruby runtime as a parent image
FROM ruby:3.2.4

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client build-essential libpq-dev

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock /app/

# Install gems
RUN bundle install

# Copy the rest of the application code into the container
COPY . /app

# Precompile assets
RUN bundle exec rake assets:precompile

# Expose port 3000 to the Docker host
EXPOSE 3000

# Set the environment variables for the database
ARG DATABASE_USERNAME
ARG DATABASE_PASSWORD
ENV DATABASE_USERNAME=$DATABASE_USERNAME
ENV DATABASE_PASSWORD=$DATABASE_PASSWORD

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
