# FROM elixir:latest

# RUN apt-get update && \
#     # apt-get install -y postgresql-client && \
#     apt-get install -y inotify-tools && \
#     apt-get install -y nodejs && \
#     curl -L https://npmjs.org/install.sh | sh && \
#     mix local.hex --force && \
#     mix archive.install hex phx_new --force && \
#     mix local.rebar --force

# ENV APP_HOME /app
# RUN mkdir $APP_HOME
# WORKDIR $APP_HOME

# CMD ["mix", "phx.server"]
# Official Elixir release
# FROM elixir:1.9.1
# # Make sure we have sudo
# RUN apt-get update && \
# apt-get -y install sudo
# # Create an app directory to store our files in
# ADD . /app
# # Install the Phoenix (phx) archive
# RUN mix local.hex --force \
# && mix local.rebar --force
# RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force
# # Install node
# RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - && sudo apt-get install -y inotify-tools nodejs
# # Set working directory as app
# WORKDIR /app
# # CD to assests folder and install node modules
# RUN cd assets && npm install
# # Back to root folder
# RUN cd ../
# # Install Elxir dependencies
# RUN mix deps.get
# # Compile files
# RUN mix compile
# # Expose port 4000
# EXPOSE 4000
# # Execute commands mentioned under run.sh file
# CMD ["./run.sh"]

FROM elixir:latest

# Install debian packages
RUN apt-get update
RUN apt-get install inotify-tools

# Install Phoenix packages
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez

# Install node
RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install --yes nodejs npm

WORKDIR /app
EXPOSE 4000