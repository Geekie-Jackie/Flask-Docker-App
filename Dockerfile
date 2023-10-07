# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy only the requirements file to the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files into the container
COPY . .

# Expose port 80 for the Flask application
EXPOSE 80

# Define an environment variable for Flask
ENV FLASK_APP=app.py

# Run the Flask application when the container launches
CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:app"]

