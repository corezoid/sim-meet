# Changelog

All notable changes to this project will be documented in this file.

## [1.8.0] - 2024-05-19

### Added
- Added Helm chart dependencies configuration in Chart.yaml for egress, livekit-server, meet-agent, and valkey-livekit subcharts
- Added meet-agent-stream component for handling RTSP camera streams
- Added Grafana dashboard for LiveKit monitoring
- Added ServiceMonitor for Prometheus metrics collection

### Changed
- Fixed imagePullSecrets structure to use array format instead of object format
- Updated imagePullSecrets handling in subchart templates
- Improved handling of meet-agent-stream chart packaging
- Added terminationGracePeriodSeconds parameter (18000 seconds / 5 hours) for graceful pod termination

### Fixed
- Fixed issue with meet-agent-stream chart packaging that contained macOS metadata files
- Fixed template rendering issues related to imagePullSecrets format

## Unreleased

