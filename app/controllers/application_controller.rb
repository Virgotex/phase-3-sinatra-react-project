require 'sinatra/base'
require 'json'
require 'bcrypt'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Enable sessions to store user data
  enable :sessions

  # Add your routes here
  get '/' do
    { message: 'Good luck with your project!' }.to_json
  end

  # User registration route
  post '/register' do
    # Extract the user data from the request parameters
    user_data = JSON.parse(request.body.read)
    name = user_data['name']
    email = user_data['email']
    password = user_data['password']

    # Perform validation on the user data
    if name.nil? || email.nil? || password.nil?
      status(400)
      { message: 'Please provide name, email, and password.' }.to_json
    else
      # Create a new user record
      hashed_password = BCrypt::Password.create(password)
      user = User.create(name: name, email: email, password: hashed_password)

      # Return the created user as JSON
      status(201)
      user.to_json
    end
  end

  # User login route
  post '/login' do
    # Extract the user credentials from the request parameters
    user_credentials = JSON.parse(request.body.read)
    email = user_credentials['email']
    password = user_credentials['password']

    # Find the user record based on the email
    user = User.find_by(email: email)

    # Check if the user exists and the password is correct
    if user && BCrypt::Password.new(user.password) == password
      # Store the user ID in the session
      session[:user_id] = user.id

      # Return a success message as JSON
      { message: 'Login successful.' }.to_json
    else
      # Return an error message as JSON
      status(401)
      { message: 'Invalid email or password.' }.to_json
    end
  end

  # User logout route
  post '/logout' do
    # Clear the user ID from the session
    session.clear

    # Return a success message as JSON
    { message: 'Logout successful.' }.to_json
  end

  # Protected route example - requires authentication
  get '/protected' do
    # Check if the user is authenticated (logged in)
    if authenticated?
      { message: 'This is a protected route.' }.to_json
    else
      # Return an error message if the user is not authenticated
      status(401)
      { message: 'Not authenticated.' }.to_json
    end
  end

  # Create a new event
post '/events' do
  # Authenticate the user
  if authenticated?
    # Extract the event data from the request parameters
    event_data = JSON.parse(request.body.read)
    title = event_data['title']
    description = event_data['description']
    start_time = event_data['start_time']
    end_time = event_data['end_time']

    # Perform validation on the event data
    if title.nil? || description.nil? || start_time.nil? || end_time.nil?
      status(400)
      { message: 'Please provide title, description, start_time, and end_time.' }.to_json
    else
      # Create a new event record
      event = Event.create(title: title, description: description, start_time: start_time, end_time: end_time)

      # Return the created event as JSON
      status(201)
      event.to_json
    end
  else
    # Return an error message if the user is not authenticated
    status(401)
    { message: 'Not authenticated.' }.to_json
  end
end


  # Get all events
  get '/events' do
    events = Event.all
    events.to_json
  end

  # Get a specific event
  get '/events/:id' do
    event = Event.find(params[:id])
    event.to_json
  end

  # Update an event
  patch '/events/:id' do
    # Authenticate the user
    if authenticated?
      # Find the event to update
      event = Event.find(params[:id])

      # Extract the updated event data from the request parameters
      event_data = JSON.parse(request.body.read)
      title = event_data['title']
      description = event_data['description']
      # ...

      # Perform validation on the event data
      if title.nil? || description.nil? || ...
        status(400)
        { message: 'Please provide title, description, and ...' }.to_json
      else
        # Update the event record
        event.update(title: title, description: description, start_time: start_time, end_time: end_time)

        # Return the updated event as JSON
        event.to_json
      end
    else
      # Return an error message if the user is not authenticated
      status(401)
      { message: 'Not authenticated.' }.to_json
    end
  end

  # Delete an event
  delete '/events/:id' do
    # Authenticate the user
    if authenticated?
      # Find the event to delete
      event = Event.find(params[:id])

      # Delete the event
      event.destroy

      # Return a success message as JSON
      { message: 'Event deleted.' }.to_json
    else
      # Return an error message if the user is not authenticated
      status(401)
      { message: 'Not authenticated.' }.to_json
    end
  end

  private

  # Helper method to check if the user is authenticated
  def authenticated?
    !session[:user_id].nil?
  end
end
