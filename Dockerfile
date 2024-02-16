# Use an official Ruby runtime as a parent image
FROM ruby:3.1

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed packages specified in Gemfile
RUN bundle install

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Define environment variable
ENV NAME World

# Run app.rb when the container launches
CMD ["ruby", "app.rb"]