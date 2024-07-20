package _Self.buildTypes

import jetbrains.buildServer.configs.kotlin.*
import jetbrains.buildServer.configs.kotlin.buildFeatures.perfmon
import jetbrains.buildServer.configs.kotlin.buildSteps.DockerCommandStep
import jetbrains.buildServer.configs.kotlin.buildSteps.dockerCommand
import jetbrains.buildServer.configs.kotlin.buildSteps.sshExec
import jetbrains.buildServer.configs.kotlin.triggers.vcs

object Build : BuildType({
    name = "Build"

    vcs {
        root(DslContext.settingsRoot)
    }

    steps {
        step {
            name = "test-scan"
            id = "test_scan"
            type = "sonar-plugin"
            param("sonarProjectSources", "")
            param("teamcity.build.workingDir", "./")
            param("sonarProjectName", "React")
            param("teamcity.tool.sonarquberunner", "%teamcity.tool.sonar-qube-scanner.4.2.0.1873-scanner%")
            param("sonarProjectVersion", "")
            param("sonarProjectKey", "React")
            param("sonarServer", "9efd98dd-ab58-4702-a30a-f19a35036558")
        }
        dockerCommand {
            name = "docker_login"
            id = "docker_login"
            commandType = other {
                subCommand = "login"
                commandArgs = "-u %env.DOCKERHUB_USERNAME% -p %env.DOCKERHUB_PASSWORD%"
            }
        }
        dockerCommand {
            name = "build"
            id = "build"
            commandType = build {
                source = file {
                    path = "Dockerfile"
                }
                platform = DockerCommandStep.ImagePlatform.Linux
                namesAndTags = "%env.DOCKER_IMAGE%"
                commandArgs = "--pull"
            }
        }
        dockerCommand {
            name = "push"
            id = "push"
            commandType = push {
                namesAndTags = "%env.DOCKER_IMAGE%"
            }
        }
        sshExec {
            name = "deploy"
            id = "deploy"
            commands = "docker run -p 5000:80 -d --name reactapp %env.DOCKER_IMAGE%"
            targetUrl = "%env.HOST%"
            authMethod = uploadedKey {
                username = "%env.USER%"
                key = "id_rsa"
            }
        }
    }

    triggers {
        vcs {
        }
    }

    features {
        perfmon {
        }
    }
})
Name: *	