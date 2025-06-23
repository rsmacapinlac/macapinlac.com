#!/bin/bash

# Development workflow script for macapinlac.com
# This script helps manage the development process and prevents multiple server instances

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if Middleman server is running
is_server_running() {
    pgrep -f "middleman server" > /dev/null 2>&1
}

# Function to kill existing Middleman servers
kill_servers() {
    if is_server_running; then
        print_status "Killing existing Middleman servers..."
        pkill -f "middleman server" || true
        sleep 2
        print_success "Servers killed"
    fi
}

# Function to start development server
start_server() {
    kill_servers
    print_status "Starting Middleman development server..."
    bundle exec middleman server
}

# Function to run tests
run_tests() {
    print_status "Running tests..."
    bundle exec rspec "$@"
}

# Function to run specific test file
run_test_file() {
    if [ -z "$1" ]; then
        print_error "Please specify a test file"
        echo "Usage: $0 test <test_file>"
        exit 1
    fi
    
    print_status "Running test file: $1"
    bundle exec rspec "$1"
}

# Function to build for production
build_site() {
    print_status "Building site for production..."
    bundle exec middleman build
    print_success "Site built successfully"
}

# Function to show help
show_help() {
    echo "Development workflow script for macapinlac.com"
    echo ""
    echo "Usage: $0 <command> [options]"
    echo ""
    echo "Commands:"
    echo "  server          Start development server (kills existing servers first)"
    echo "  test [file]     Run tests (all or specific file)"
    echo "  build           Build site for production"
    echo "  kill            Kill all Middleman servers"
    echo "  help            Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 server                    # Start development server"
    echo "  $0 test                      # Run all tests"
    echo "  $0 test spec/features/blog_spec.rb  # Run specific test file"
    echo "  $0 build                     # Build for production"
}

# Main script logic
case "${1:-help}" in
    "server")
        start_server
        ;;
    "test")
        shift
        if [ -z "$1" ]; then
            run_tests
        else
            run_test_file "$1"
        fi
        ;;
    "build")
        build_site
        ;;
    "kill")
        kill_servers
        ;;
    "help"|"--help"|"-h")
        show_help
        ;;
    *)
        print_error "Unknown command: $1"
        echo ""
        show_help
        exit 1
        ;;
esac 