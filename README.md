# terraform-ecs-container-definition
A terraform module which outputs a JSON container definition for ecs. This is based on the [container definitions](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#container_definitions).

## Examples

### Container definition for Spring Boot service using Splunk logging driver
```
module "container_definition" {
  source            = "git::https://github.com/bnc-projects/terraform-ecs-container-definition.git?ref=1.0.0"
  cpu               = 128
  environment       = [
    {
      name  = "JAVA_OPTS",
      value = format("-javaagent:newrelic/newrelic.jar -Dnewrelic.environment=%s -Dnewrelic.config.file=newrelic/newrelic.yml", terraform.workspace)
    },
    {
      name  = "SPRING_PROFILES_ACTIVE",
      value = terraform.workspace
    }
  ]
  healthCheck       = {
    "command"     = [
      "CMD-SHELL",
      "wget --quiet --tries=1 --spider --timeout=30 http://localhost:8080/actuator/health || exit 1"
    ],
    "interval"    = 30,
    "retries"     = 3,
    "startPeriod" = 300,
    "timeout": 5
  }
  logConfiguration  = {
    "logDriver": "splunk",
    "options": {
      "splunk-format": "raw",
      "splunk-insecureskipverify": "true",
      "splunk-token": var.splunk_token,
      "splunk-url": var.splunk_url
    }
  },
  image             = "nginx"
  name              = "nginx"
  memory            = 512
  memoryReservation = 256
  portMappings: [
    {
      containerPort = 8080
      hostPort      = 0,
      protocol      = "tcp"
    }
  ],
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| command | The command that is passed to the container | list(string) | `[]` | no |
| cpu | The number of cpu units reserved for the container | number | `0` | no |
| dependsOn | A list of the dependencies defined for container startup and shutdown | list(string) | `[]` | no |
| disableNetworking | When this parameter is true, networking is disabled within the container | boolean | `false` | no |
| dnsSearchDomains | A list of DNS search domains that are presented to the container | list(string) | `[]` | no |
| dnsServers | A list of DNS servers that are presented to the container | list(string) | `[]` | no |
| dockerLabels | A key/value map of labels to add to the container | map(string) | `{}` | no |
| dockerSecurityOptions | A list of strings to provide custom labels for SELinux and AppArmor multi-level security systems | list(string) | `[]` | no |
| entryPoint | The entry point that is passed to the container | list(string) | `[]` | no |
| environment | The environment variables to pass to a container | list(string) | `[]` | no |
| essential | If the essential parameter of a container is marked as true, and that container fails or stops for any reason, all other containers that are part of the task are stopped | boolean | `true` | no |
| extraHosts | A list of hostnames and IP address mappings to append to the /etc/hosts file on the container | list(string) | `[]` | no |
| healthCheck | The health check command and associated configuration parameters for the container | map(string) | `{}` | no |
| hostname | The hostname to use for your container | string | - | no |
| image | The image used to start a container | string | - | yes |
| interactive | When this parameter is true, this allows you to deploy containerized applications that require stdin or a tty to be allocated | boolean | `false` | no |
| links | The link parameter allows containers to communicate with each other without the need for port mappings | list(string) | `[]` | no |
| linuxParameters | Linux-specific modifications that are applied to the container, such as Linux KernelCapabilities | map(string) | `{}` | no |
| logConfiguration | The log configuration specification for the container | map(string) | `{}` | no |
| memory | The hard limit (in MiB) of memory to present to the container | number | `256` | no |
| memoryReservation | The soft limit (in MiB) of memory to reserve for the container | number | `128` | no |
| mountPoints | The mount points for data volumes in your container | list(string) | `[]` | no |
| name | The name of a container | string | - | yes |
| portMappings | The list of port mappings for the container | list(string) | `[]` | no |
| privileged | When this parameter is true, the container is given elevated privileges on the host container instance (similar to the root user) | boolean | `false` | no |
| pseudoTerminal | When this parameter is true, a TTY is allocated | boolean | `false` | no |
| readonlyRootFilesystem | When this parameter is true, the container is given read-only access to its root file system | boolean | `false` | no |
| repositoryCredentials | The private repository authentication credentials to use | map(string) | `{}` | no |
| resourceRequirements | The type and amount of a resource to assign to a container. The only supported resource is a GPU. | list(string) | `[]` | no |
| secrets | The secrets to pass to the container | list(string) | `[]` | no |
| startTimeout | Time duration to wait before giving up on resolving dependencies for a container | number | `0` | no |
| stopTimeout | Time duration to wait before the container is forcefully killed if it doesn't exit normally on its own | number | `0` | no |
| systemControls | A list of namespaced kernel parameters to set in the container | list(string) | `[]` | no |
| ulimits | A list of ulimits to set in the container | list(string) | `[]` | no |
| user | The user name to use inside the container | string | `` | no |
| volumesFrom | Data volumes to mount from another container | list(string) | `[]` | no |
| workingDirectory | The working directory in which to run commands inside the container | string | - | no |

## Outputs

| Name | Description |
|------|-------------|
| container_definition | The rendered JSON container definition |
