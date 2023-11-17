          # Use an official Python runtime as a parent image
          FROM python:3.10

          # Define environment variables
          ENV PYTHONDONTWRITEBYTECODE 1
          ENV PYTHONUNBUFFERED 1

          # Set the working directory to / app
          WORKDIR /app

          # Copy only the requirements file to leverage Docker cache
          COPY requirements.txt /app/

            # Install any needed packages specified in requirements.txt
          RUN pip install --no-cache-dir -r requirements.txt && \
			  pip install gunicorn


          # Copy the current directory contents into the container at / app /
            COPY . /app/

            # Make port 8000 available to the world outside this container
          EXPOSE 8000

          # Run gunicorn when the container launches
            CMD ["gunicorn", "--bind", "0.0.0.0:8000", "${my_site}.wsgi:application"]