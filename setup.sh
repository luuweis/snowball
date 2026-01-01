#!/bin/bash

echo "Checking environment..."

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo "Error: Homebrew is not installed. Please install it first: https://brew.sh/"
    echo "Note: If you are on Windows or Linux without Homebrew, please install Node.js manually."
    exit 1
fi

# Check for Node.js
if ! command -v node &> /dev/null; then
    echo "Node.js not found. Installing via Homebrew..."
    brew install node
else
    echo "Node.js is already installed."
fi

# Check for npm
if ! command -v npm &> /dev/null; then
    echo "npm not found. Re-installing node..."
    brew reinstall node
fi

# Install dependencies
echo "Installing project dependencies..."
if [ ! -d "node_modules" ]; then
    npm install
else
    echo "Dependencies already installed."
fi

# Start the server
echo "Starting the server..."
npm start
