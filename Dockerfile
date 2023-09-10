# Use the official Ruby image as the base image
FROM ruby:3.1

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y nodejs mariadb-client

# Install bundler
RUN gem install bundler

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./
COPY transeasy.gemspec transeasy*.gem ./
COPY lib/transeasy/ ./lib/transeasy/

# Install gems using Bundler
RUN bundle install

# Copy the rest of the application code to the container
COPY . .

# Expose port 3000 for the Rails application
EXPOSE 3000

# Start the Rails application
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
