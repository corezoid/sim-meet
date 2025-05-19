# Sim-Meet Helm Chart

This Helm chart deploys the Sim-Meet platform, a comprehensive solution for real-time video conferencing and streaming based on LiveKit.

## Overview

Sim-Meet provides a robust infrastructure for video conferencing, live streaming, and real-time communication. It integrates several components to deliver a complete solution:

- **LiveKit Server**: Core WebRTC SFU (Selective Forwarding Unit) for real-time audio/video
- **Valkey**: Redis-compatible database for state management
- **Egress**: Component for recording and streaming
- **Meet Agent**: AI-powered virtual assistant for meetings
- **Meet Agent Stream**: Component for handling RTSP camera streams

## Architecture

```
                   ┌─────────────┐
                   │   Clients   │
                   └──────┬──────┘
                          │
                          ▼
┌─────────────────────────────────────────────┐
│                Load Balancer                │
└─────────────────────┬───────────────────────┘
                      │
┌─────────────────────┼───────────────────────┐
│                     ▼                       │
│         ┌─────────────────────────┐         │
│         │     LiveKit Server      │         │
│         └─────────────┬───────────┘         │
│                       │                     │
│         ┌─────────────┼───────────┐         │
│         ▼             ▼           ▼         │
│  ┌────────────┐ ┌──────────┐ ┌──────────┐   │
│  │   Egress   │ │  Valkey  │ │Meet Agent│   │
│  └────────────┘ └──────────┘ └──────────┘   │
│                                             │
│  ┌────────────────────────────────────┐     │
│  │        Meet Agent Stream           │     │
│  └────────────────────────────────────┘     │
│                                             │
│               Kubernetes Cluster            │
└─────────────────────────────────────────────┘
```

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure
- LoadBalancer support for external access

## Configuration

### Global Configuration

The chart provides global configuration options that apply to all subcharts:

```yaml
global:
  imageInit:
    repository: hub.corezoid.com/hub.docker.com/library/alpine
    pullPolicy: IfNotPresent
    tag: "3.21"
  repotype: "ctrl"
  # imagePullSecrets:
  #   - name: middleware-hub-secret
  serviceMonitor:
    enabled: true
  dashboards:
    enabled: true
  terminationGracePeriodSeconds: 18000
```

### Component Configuration

Each component can be configured separately:

- **LiveKit Server**: WebRTC SFU configuration, TURN server settings, Redis connection
- **Valkey**: Redis-compatible database settings
- **Egress**: Recording and streaming configuration
- **Meet Agent**: AI assistant configuration
- **Meet Agent Stream**: RTSP stream handling configuration

## Installation

```bash
# Add the repository
helm repo add sim-meet https://your-helm-repo.example.com

# Install the chart
helm install sim-meet sim-meet/sim-meet -f values.yaml

# Upgrade an existing installation
helm upgrade sim-meet sim-meet/sim-meet -f values.yaml
```

## Security Considerations

- The chart supports TLS termination for secure communication
- API keys and secrets should be properly configured
- Redis password should be set for Valkey
- Consider using Kubernetes Secrets for sensitive information

## Monitoring

The chart includes:
- Prometheus ServiceMonitor for metrics collection
- Grafana dashboards for visualization

## License

This chart is licensed under the [MIT License](LICENSE).
