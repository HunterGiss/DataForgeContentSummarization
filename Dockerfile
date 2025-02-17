# Use a Python base image
FROM python:3.9-slim

WORKDIR /app

# Copy and install requirements, these change less so I am leverage caching
COPY requirements.txt $WORKDIR/
RUN python -m pip install -r requirements.txt

# Copy the entire app to the container
COPY . /app

# Make scripts executable
RUN chmod +x configuration/bin/*.sh

# Set the entrypoint to the script
ENTRYPOINT ["./configuration/bin/entry_point.sh"]