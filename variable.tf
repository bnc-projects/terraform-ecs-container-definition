variable "command" {
  default     = []
  description = "The command that is passed to the container"
  type        = list(string)
}

variable "cpu" {
  default     = 0
  description = "The number of cpu units reserved for the container"
  type        = number
}

variable "dependsOn" {
  default     = []
  description = "A list of the dependencies defined for container startup and shutdown"
  type        = list(string)
}

variable "disableNetworking" {
  default     = false
  description = "When this parameter is true, networking is disabled within the container"
  type        = bool
}

variable "dnsSearchDomains" {
  default     = []
  description = "A list of DNS search domains that are presented to the container"
  type        = list(string)
}

variable "dnsServers" {
  default     = []
  description = "A list of DNS servers that are presented to the container"
  type        = list(string)
}

variable "dockerLabels" {
  default     = {}
  description = "A key/value map of labels to add to the container"
  type        = map(string)
}

variable "dockerSecurityOptions" {
  default     = []
  description = "A list of strings to provide custom labels for SELinux and AppArmor multi-level security systems"
  type        = list(string)
}

variable "entryPoint" {
  default     = []
  description = "The entry point that is passed to the container"
  type        = list(string)
}

variable "environment" {
  default     = []
  description = "The environment variables to pass to a container"
  type        = list(object({
    name  = string
    value = string
  }))
}

variable "essential" {
  default     = true
  description = "If the essential parameter of a container is marked as true, and that container fails or stops for any reason, all other containers that are part of the task are stopped"
  type        = bool
}

variable "extraHosts" {
  default     = []
  description = "A list of hostnames and IP address mappings to append to the /etc/hosts file on the container"
  type        = list(string)
}

variable "healthCheck" {
  default     = {}
  description = "The health check command and associated configuration parameters for the container"
}

variable "hostname" {
  default     = ""
  description = "The hostname to use for your container"
  type        = string
}

variable "image" {
  description = "The image used to start a container"
  type        = string
}

variable "interactive" {
  default     = false
  description = "When this parameter is true, this allows you to deploy containerized applications that require stdin or a tty to be allocated"
  type        = bool
}

variable "links" {
  default     = []
  description = "The link parameter allows containers to communicate with each other without the need for port mappings"
  type        = list(string)
}

variable "linuxParameters" {
  default     = {}
  description = "Linux-specific modifications that are applied to the container, such as Linux KernelCapabilities"
  type        = map(string)
}

variable "logConfiguration" {
  default     = {
    logDriver = "awslogs"
    options   = {
      awslogs-region        = "us-west-2"
      awslogs-group         = "default"
      awslogs-stream-prefix = "default"
    }
  }
  description = "The log configuration specification for the container"
  type        = object({
    logDriver = string
    options   = map(string)
  })
}

variable "memory" {
  default     = 256
  description = "The hard limit (in MiB) of memory to present to the container"
  type        = number
}

variable "memoryReservation" {
  default     = 128
  description = "The soft limit (in MiB) of memory to reserve for the container"
  type        = number
}

variable "mountPoints" {
  default     = []
  description = "The mount points for data volumes in your container"
  type        = list(string)
}

variable "name" {
  description = "The name of a container"
  type        = string
}

variable "portMappings" {
  default     = []
  description = "The list of port mappings for the container"
  type        = list(object({
    containerPort = number
    hostPort      = number
    protocol      = string
  }))
}

variable "privileged" {
  default     = false
  description = "When this parameter is true, the container is given elevated privileges on the host container instance (similar to the root user)"
  type        = bool
}

variable "pseudoTerminal" {
  default     = false
  description = "When this parameter is true, a TTY is allocated"
  type        = bool
}

variable "readonlyRootFilesystem" {
  default     = false
  description = "When this parameter is true, the container is given read-only access to its root file system"
  type        = bool
}

variable "repositoryCredentials" {
  default     = {}
  description = "The private repository authentication credentials to use"
  type        = map(string)
}

variable "resourceRequirements" {
  default     = []
  description = "The type and amount of a resource to assign to a container. The only supported resource is a GPU."
  type        = list(string)
}

variable "secrets" {
  default     = []
  description = "The secrets to pass to the container"
  type        = list(string)
}

variable "startTimeout" {
  default     = 0
  description = "Time duration to wait before giving up on resolving dependencies for a container"
  type        = number
}

variable "stopTimeout" {
  default     = 0
  description = "Time duration to wait before the container is forcefully killed if it doesn't exit normally on its own"
  type        = number
}

variable "systemControls" {
  default     = []
  description = "A list of namespaced kernel parameters to set in the container"
  type        = list(string)
}

variable "ulimits" {
  default     = []
  description = "A list of ulimits to set in the container"
  type        = list(string)
}

variable "user" {
  default     = ""
  description = "The user name to use inside the container"
  type        = string
}

variable "volumesFrom" {
  default     = []
  description = "Data volumes to mount from another container"
  type        = list(string)
}

variable "workingDirectory" {
  default     = ""
  description = "The working directory in which to run commands inside the container"
  type        = string
}