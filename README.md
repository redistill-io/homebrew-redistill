# Homebrew Tap for Redistill

Homebrew tap for [Redistill](https://github.com/shahidshaikh/redistill) - A high-performance Redis-compatible key-value store.

## Installation

```bash
# Add the tap
brew tap shahidshaikh/redistill

# Install Redistill
brew install redistill
```

## Usage

After installation, you can run Redistill:

```bash
# Start Redistill server
redistill

# Or run as a service (macOS)
brew services start redistill
```

## Configuration

Redistill uses a configuration file `redistill.toml` in the current working directory, or you can set environment variables:

```bash
# Set password
export REDIS_PASSWORD=your-password

# Set port
export REDIS_PORT=6379

# Set bind address
export REDIS_BIND=0.0.0.0

# Set health check port
export REDIS_HEALTH_CHECK_PORT=8080
```

See the [main repository](https://github.com/shahidshaikh/redistill) for full documentation.

## Updating

```bash
brew update
brew upgrade redistill
```

## Uninstalling

```bash
brew uninstall redistill
brew untap shahidshaikh/redistill
```

## License

MIT License - see the [main repository](https://github.com/shahidshaikh/redistill) for details.


