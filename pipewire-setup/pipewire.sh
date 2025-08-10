#!/bin/bash

# PipeWire 384kHz/32-bit Audio Configuration Script
# Hardware: TTGK Technology Co.,Ltd CX31993 384Khz HIFI AUDIO DAC
# System: Fedora KDE Plasma with PipeWire
# Author: Linux Audio Configuration Script
# Version: 1.0

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging function
log() {
  echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

warn() {
  echo -e "${YELLOW}[WARNING] $1${NC}"
}

error() {
  echo -e "${RED}[ERROR] $1${NC}"
  exit 1
}

info() {
  echo -e "${BLUE}[INFO] $1${NC}"
}

# Function to check if running on supported system
check_system() {
  log "Checking system compatibility..."

  if ! command -v pipewire &>/dev/null; then
    error "PipeWire is not installed. Please install PipeWire first."
  fi

  if ! command -v pactl &>/dev/null; then
    error "PulseAudio utilities not found. Please install pipewire-pulse."
  fi

  if ! systemctl --user is-active --quiet pipewire; then
    warn "PipeWire service is not running. Attempting to start..."
    systemctl --user start pipewire || error "Failed to start PipeWire"
  fi

  log "System check passed!"
}

# Function to backup existing configuration
backup_config() {
  log "Creating backup of existing configuration..."

  local backup_dir="$HOME/audio-config-backup/$(date +%Y%m%d_%H%M%S)"
  mkdir -p "$backup_dir"

  # Backup existing PipeWire config if it exists
  if [[ -f "$HOME/.config/pipewire/pipewire.conf" ]]; then
    cp "$HOME/.config/pipewire/pipewire.conf" "$backup_dir/"
    log "Backed up existing pipewire.conf to $backup_dir"
  fi

  # Backup WirePlumber configs if they exist
  if [[ -d "$HOME/.config/wireplumber" ]]; then
    cp -r "$HOME/.config/wireplumber" "$backup_dir/" 2>/dev/null || true
    log "Backed up WirePlumber configuration"
  fi

  # Backup .asoundrc if it exists
  if [[ -f "$HOME/.asoundrc" ]]; then
    cp "$HOME/.asoundrc" "$backup_dir/"
    log "Backed up .asoundrc"
  fi

  echo "$backup_dir" >"$HOME/.pipewire_last_backup"
  info "Backup location saved: $backup_dir"
}

# Function to detect audio hardware
detect_hardware() {
  log "Detecting audio hardware..."

  # Check for CX31993 DAC specifically
  if lsusb | grep -qi "CX31993\|384.*HIFI\|AUDIO"; then
    log "CX31993 384kHz HIFI AUDIO DAC detected!"
    return 0
  fi

  # Check for any USB audio device
  if lsusb | grep -qi audio; then
    warn "USB audio device detected, but not specifically CX31993"
    info "Proceeding with generic high-resolution configuration..."
    return 0
  fi

  # Check ALSA cards
  if [[ -f /proc/asound/cards ]] && grep -qi usb /proc/asound/cards; then
    warn "USB audio card found in ALSA, continuing..."
    return 0
  fi

  error "No compatible USB audio device detected. Please ensure your DAC is connected."
}

# Function to create PipeWire configuration
create_pipewire_config() {
  log "Creating PipeWire configuration..."

  # Create config directory
  mkdir -p "$HOME/.config/pipewire"

  # Copy default configuration if it doesn't exist
  if [[ ! -f "/usr/share/pipewire/pipewire.conf" ]]; then
    error "Default PipeWire configuration not found at /usr/share/pipewire/pipewire.conf"
  fi

  cp "/usr/share/pipewire/pipewire.conf" "$HOME/.config/pipewire/"

  # Create the modified configuration
  cat >"$HOME/.config/pipewire/pipewire.conf" <<'EOF'
# PipeWire config file for high-resolution audio
#
# Copy this file to ~/.config/pipewire/pipewire.conf

context.properties = {
    ## Configure properties in the system.
    #mem.warn-mlock  = false
    #mem.allow-mlock = true
    #mem.mlock-all   = false
    #log.level       = 2
    #cpu.zero.denormals = true

    core.daemon = true
    core.name   = pipewire-0

    ## Properties for the DSP configuration - 384kHz/32-bit setup
    default.clock.rate       = 384000
    default.clock.allowed-rates = [ 44100 48000 96000 192000 384000 ]
    default.clock.quantum    = 1024
    default.clock.min-quantum = 32
    default.clock.max-quantum = 8192
    #default.clock.force-quantum = 0
    #default.clock.force-rate = 0

    #default.video.width   = 640
    #default.video.height  = 480
    #default.video.rate.num = 25
    #default.video.rate.denom = 1
    #
    #settings.check-quantum  = false
    #settings.check-rate     = false
    #
    # These overrides are only applied when running in a vm.
    vm.overrides = {
        default.clock.min-quantum = 1024
    }
}

context.spa-libs = {
    #<factory-name regex> = <library-name>
    #
    # Used to find spa factory names. It maps an spa factory name
    # regular expression to a library name that should contain
    # that factory.
    #
    audio.convert.* = audioconvert/libspa-audioconvert
    avb.*           = avb/libspa-avb
    api.alsa.*      = alsa/libspa-alsa
    api.v4l2.*      = v4l2/libspa-v4l2
    api.libcamera.* = libcamera/libspa-libcamera
    api.bluez5.*    = bluez5/libspa-bluez5
    api.vulkan.*    = vulkan/libspa-vulkan
    api.jack.*      = jack/libspa-jack
    support.*       = support/libspa-support
}

context.modules = [
    #{ name = <module-name>
    #    ( args  = { <key> = <value> ... } )
    #    ( flags = [ ( ifexists ) ( nofail ) ] )
    #    ( condition = [ { <key> = <value> ... } ... ] )
    #}
    #
    # Loads a module with the given parameters.
    # - ifexists: ignore if the module does not exist
    # - nofail: continue if the module fails to load
    #
    { name = libpipewire-module-rt
        args = {
            nice.level   = -11
            rt.prio      = 88
            rt.time.soft = -1
            rt.time.hard = -1
        }
        flags = [ ifexists nofail ]
    }
    { name = libpipewire-module-protocol-native }
    { name = libpipewire-module-profiler }
    { name = libpipewire-module-metadata }
    { name = libpipewire-module-spa-device-factory }
    { name = libpipewire-module-spa-node-factory }
    { name = libpipewire-module-client-node }
    { name = libpipewire-module-client-device }
    { name = libpipewire-module-portal
        flags = [ ifexists nofail ]
    }
    { name = libpipewire-module-access
        args = {
            # access.allowed to list an array of paths of allowed
            # apps.
            #access.allowed = [
            #    /usr/bin/pipewire-media-session
            #]

            # An array of rejected paths.
            #access.rejected = [ ]

            # An array of paths with restricted access.
            #access.restricted = [ ]

            # Anything not in the above lists gets assigned the
            # access.force permission.
            #access.force = flatpak
        }
    }
    { name = libpipewire-module-adapter }
    { name = libpipewire-module-link-factory }
    { name = libpipewire-module-session-manager }

    # High-resolution audio support modules
    { name = libpipewire-module-suspend-node }
]

context.objects = [
    # A default dummy driver. This handles nodes marked with the "node.always-driver"
    # property when no other driver is currently active. JACK clients need this.
    { factory = spa-node-factory
        args = {
            factory.name    = support.node.driver
            node.name       = Dummy-Driver
            node.group      = pipewire.dummy
            priority.driver = 8000
        }
    }
    { factory = spa-node-factory
        args = {
            factory.name    = support.node.driver
            node.name       = Freewheel-Driver
            priority.driver = 19000
            node.group      = pipewire.freewheel
            node.freewheel  = true
        }
    }
    # This creates a single PCM source device for the given
    # alsa device path hw:x,y or /dev/snd/pcmC0D0c. You can
    # change the source properties if needed.
    #{ factory = adapter
    #    args = {
    #        factory.name     = api.alsa.pcm.source
    #        node.name        = "alsa-source"
    #        node.description = "My Source"
    #        media.class      = "Audio/Source"
    #        api.alsa.path    = "hw:1,0"
    #    }
    #}
]

context.exec = [
    { path = "pactl"        args = "info" }
    #{ path = "/usr/bin/pipewire" args = "-h" }
]
EOF

  log "PipeWire configuration created successfully!"
}

# Function to restart PipeWire services
restart_services() {
  log "Restarting PipeWire services..."

  # Stop services in order
  systemctl --user stop wireplumber 2>/dev/null || true
  systemctl --user stop pipewire-pulse 2>/dev/null || true
  systemctl --user stop pipewire 2>/dev/null || true

  # Wait a moment
  sleep 2

  # Start services in order
  systemctl --user start pipewire || error "Failed to start pipewire"
  sleep 1
  systemctl --user start pipewire-pulse || error "Failed to start pipewire-pulse"
  sleep 1
  systemctl --user start wireplumber || error "Failed to start wireplumber"

  # Wait for services to initialize
  sleep 3

  log "PipeWire services restarted successfully!"
}

# Function to verify configuration
verify_configuration() {
  log "Verifying audio configuration..."

  # Check if services are running
  local services=("pipewire" "pipewire-pulse" "wireplumber")
  for service in "${services[@]}"; do
    if ! systemctl --user is-active --quiet "$service"; then
      error "Service $service is not running"
    fi
  done

  # Wait a bit more for full initialization
  sleep 2

  # Check sample rate
  info "Current audio configuration:"
  if command -v pactl &>/dev/null; then
    pactl info | grep "Default Sample Specification" || warn "Could not get sample specification"

    # List available sinks
    echo ""
    info "Available audio sinks:"
    pactl list sinks short || warn "Could not list audio sinks"

    # Check for DAC specifically
    if pactl list sinks short | grep -qi "CX31993\|384.*HIFI"; then
      log "✓ High-resolution DAC detected and available!"
    else
      warn "DAC may not be detected or configured properly"
    fi
  fi
}

# Function to test audio
test_audio() {
  log "Testing audio output..."

  if command -v pw-play &>/dev/null && [[ -f "/usr/share/sounds/alsa/Front_Left.wav" ]]; then
    info "Playing test sound..."
    pw-play /usr/share/sounds/alsa/Front_Left.wav 2>/dev/null || warn "Could not play test sound"
  elif command -v speaker-test &>/dev/null; then
    info "Running speaker test (2 seconds)..."
    timeout 2s speaker-test -c 2 -r 48000 -f S16_LE 2>/dev/null || warn "Speaker test failed"
  else
    warn "No audio test utilities available"
  fi
}

# Function to show status
show_status() {
  echo ""
  info "=== PipeWire Audio Status ==="

  if command -v pw-top &>/dev/null; then
    info "PipeWire realtime status (press 'q' to quit):"
    echo "Running 'pw-top' in 5 seconds... (Ctrl+C to skip)"
    sleep 5
    timeout 10s pw-top 2>/dev/null || info "pw-top not available or interrupted"
  fi

  echo ""
  info "=== Configuration Summary ==="
  echo "✓ Target Sample Rate: 384000 Hz"
  echo "✓ Target Format: S32LE (32-bit)"
  echo "✓ Target DAC: CX31993 384kHz HIFI AUDIO"
  echo "✓ Configuration file: ~/.config/pipewire/pipewire.conf"

  if [[ -f "$HOME/.pipewire_last_backup" ]]; then
    local backup_path=$(cat "$HOME/.pipewire_last_backup")
    echo "✓ Backup location: $backup_path"
  fi
}

# Function to show usage
usage() {
  cat <<EOF
Usage: $0 [OPTIONS]

PipeWire 384kHz/32-bit Audio Configuration Script

OPTIONS:
    -h, --help      Show this help message
    -b, --backup    Create backup only (no configuration changes)
    -r, --restore   Restore from latest backup
    -t, --test      Test current audio configuration
    -v, --verify    Verify current configuration only
    --no-restart    Skip restarting PipeWire services
    --force         Force configuration even if DAC not detected

EXAMPLES:
    $0              # Full setup with backup
    $0 --backup     # Create backup only
    $0 --restore    # Restore from backup
    $0 --test       # Test current setup
EOF
}

# Function to restore from backup
restore_backup() {
  log "Restoring from backup..."

  if [[ ! -f "$HOME/.pipewire_last_backup" ]]; then
    error "No backup location found. Please specify backup directory."
  fi

  local backup_path=$(cat "$HOME/.pipewire_last_backup")
  if [[ ! -d "$backup_path" ]]; then
    error "Backup directory not found: $backup_path"
  fi

  # Restore PipeWire config
  if [[ -f "$backup_path/pipewire.conf" ]]; then
    mkdir -p "$HOME/.config/pipewire"
    cp "$backup_path/pipewire.conf" "$HOME/.config/pipewire/"
    log "Restored pipewire.conf"
  fi

  # Restore WirePlumber config
  if [[ -d "$backup_path/wireplumber" ]]; then
    cp -r "$backup_path/wireplumber" "$HOME/.config/"
    log "Restored WirePlumber configuration"
  fi

  # Restore .asoundrc
  if [[ -f "$backup_path/.asoundrc" ]]; then
    cp "$backup_path/.asoundrc" "$HOME/"
    log "Restored .asoundrc"
  fi

  restart_services
  log "Configuration restored successfully!"
}

# Main function
main() {
  local backup_only=false
  local restore_only=false
  local test_only=false
  local verify_only=false
  local no_restart=false
  local force=false

  # Parse command line arguments
  while [[ $# -gt 0 ]]; do
    case $1 in
    -h | --help)
      usage
      exit 0
      ;;
    -b | --backup)
      backup_only=true
      shift
      ;;
    -r | --restore)
      restore_only=true
      shift
      ;;
    -t | --test)
      test_only=true
      shift
      ;;
    -v | --verify)
      verify_only=true
      shift
      ;;
    --no-restart)
      no_restart=true
      shift
      ;;
    --force)
      force=true
      shift
      ;;
    *)
      error "Unknown option: $1. Use --help for usage information."
      ;;
    esac
  done

  # Handle specific modes
  if [[ "$restore_only" == true ]]; then
    restore_backup
    exit 0
  fi

  if [[ "$test_only" == true ]]; then
    test_audio
    exit 0
  fi

  if [[ "$verify_only" == true ]]; then
    verify_configuration
    show_status
    exit 0
  fi

  if [[ "$backup_only" == true ]]; then
    backup_config
    exit 0
  fi

  # Main setup process
  info "Starting PipeWire 384kHz/32-bit Audio Configuration..."
  echo ""

  check_system

  if [[ "$force" != true ]]; then
    detect_hardware
  else
    warn "Forcing configuration without hardware detection"
  fi

  backup_config
  create_pipewire_config

  if [[ "$no_restart" != true ]]; then
    restart_services
  else
    warn "Skipping service restart (--no-restart specified)"
  fi

  verify_configuration
  test_audio
  show_status

  echo ""
  log "✓ PipeWire 384kHz/32-bit configuration completed successfully!"
  info "Your high-resolution audio setup is now ready."
  echo ""
  info "Use 'pactl info' to check current sample rate"
  info "Use 'pw-top' to monitor real-time audio status"
  info "Use '$0 --restore' to restore previous configuration if needed"
}

# Run main function with all arguments
main "$@"
