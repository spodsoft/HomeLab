# Dockerfile

# Step 1: Start from a base image with Python 3.9 pre-installed.
FROM python:3.9-slim

# Step 2: Set the working directory inside the image.
WORKDIR /app

# Step 3: Copy the dependency list into the image.
COPY requirements.txt .

# Step 4: Install the dependencies inside the image.
RUN pip install -r requirements.txt

# Step 5: Copy the rest of the application code into the image.
COPY . .

# Step 6: Specify the command to run when a container starts from this image.
CMD ["python", "app.py"]
