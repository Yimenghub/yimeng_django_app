# Use an official Python runtime as a parent image
FROM python:3.10

# Define environment variable
# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1 

# Set the working directory to /app
WORKDIR /app

COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install gunicorn

# Copy the current directory contents into the container at /app
COPY . /app/

# Make port 8000 available to the world outside this container
EXPOSE 8000



# Run app.py when the container launches
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "test_project.wsgi:application"]
