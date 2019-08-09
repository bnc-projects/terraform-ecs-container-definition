data "template_file" "container_definition" {
  template = file("${path.module}/template/container-definition.tmpl")

  vars = {
    command                = length(var.command) > 0 ? jsonencode(var.command) : "null"
    cpu                    = var.cpu > 0 ? var.cpu : "null"
    dependsOn              = length(var.dependsOn) > 0 ? jsonencode(var.dependsOn) : "null"
    disableNetworking      = var.disableNetworking ? true : false
    dnsSearchDomains       = length(var.dnsSearchDomains) > 0 ? jsonencode(var.dnsSearchDomains) : "null"
    dnsServers             = length(var.dnsServers) > 0 ? jsonencode(var.dnsServers) : "null"
    dockerLabels           = length(var.dockerLabels) > 0 ? jsonencode(var.dockerLabels) : "null"
    dockerSecurityOptions  = length(var.dockerSecurityOptions) > 0 ? jsonencode(var.dockerSecurityOptions) : "null"
    entryPoint             = length(var.entryPoint) > 0 ? jsonencode(var.entryPoint) : "null"
    environment            = length(var.environment) > 0 ? jsonencode(var.environment) : "null"
    essential              = var.essential ? true : false
    extraHosts             = length(var.extraHosts) > 0 ? jsonencode(var.extraHosts) : "null"
    healthCheck            = length(var.healthCheck) > 0 ? jsonencode(var.healthCheck) : "null"
    hostname               = var.hostname == "" ? "null" : jsonencode(var.hostname)
    image                  = var.image == "" ? "null" : jsonencode(var.image)
    interactive            = var.interactive ? true : false
    links                  = length(var.links) > 0 ? jsonencode(var.links) : "null"
    linuxParameters        = length(var.linuxParameters) > 0 ? jsonencode(var.linuxParameters) : "null"
    logConfiguration       = length(var.logConfiguration) > 0 ? jsonencode(var.logConfiguration) : "null"
    memory                 = var.memory > 0 ? var.memory : "null"
    memoryReservation      = var.memoryReservation > 0 ? var.memoryReservation : "null"
    mountPoints            = length(var.mountPoints) > 0 ? jsonencode(var.mountPoints) : "null"
    name                   = var.name == "" ? "null" : jsonencode(var.name)
    portMappings           = length(var.portMappings) > 0 ? jsonencode(var.portMappings) : "null"
    privileged             = var.privileged ? true : false
    pseudoTerminal         = var.pseudoTerminal ? true : false
    readonlyRootFilesystem = var.readonlyRootFilesystem ? true : false
    repositoryCredentials  = length(var.repositoryCredentials) > 0 ? jsonencode(var.repositoryCredentials) : "null"
    resourceRequirements   = length(var.resourceRequirements) > 0 ? jsonencode(var.resourceRequirements) : "null"
    secrets                = length(var.secrets) > 0 ? jsonencode(var.secrets) : "null"
    startTimeout           = var.startTimeout > 0 ? var.startTimeout : "null"
    stopTimeout            = var.stopTimeout > 0 ? var.stopTimeout : "null"
    systemControls         = length(var.systemControls) > 0 ? jsonencode(var.systemControls) : "null"
    ulimits                = length(var.ulimits) > 0 ? jsonencode(var.ulimits) : "null"
    user                   = var.user == "" ? "null" : jsonencode(var.user)
    volumesFrom            = length(var.volumesFrom) > 0 ? jsonencode(var.volumesFrom) : "null"
    workingDirectory       = var.workingDirectory == "" ? "null" : jsonencode(var.workingDirectory)
  }
}