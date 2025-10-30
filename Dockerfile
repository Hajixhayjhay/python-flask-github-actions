# Stage 1: Build Stage
FROM python:3.10-slim AS build

# Set the working directory
WORKDIR /app

# Copy requirements.txt first (for layer caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all application code
COPY . .

# Optional: Run tests or precompile assets
# RUN pytest

# Stage 2: Production Stage
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy dependencies from build stage
COPY --from=build /usr/local/lib/python3.10 /usr/local/lib/python3.10
COPY --from=build /usr/local/bin /usr/local/bin

# Copy app code from build stage
COPY --from=build /app /app

# Expose port
EXPOSE 5000

# Define environment variable (prevents Python buffering)
ENV PYTHONUNBUFFERED=1

# Command to run the Flask app
CMD ["python", "app.py"]

# Dummy comments to test pull requests
# New Dummy change to create a new pull request and test the release drafter
# Dummy change made for feature/release branch testing
# Further changes!!
