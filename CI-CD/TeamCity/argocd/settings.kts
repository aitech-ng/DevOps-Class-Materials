import jetbrains.buildServer.configs.kotlin.*
import jetbrains.buildServer.configs.kotlin.buildFeatures.perfmon
import jetbrains.buildServer.configs.kotlin.buildSteps.DockerCommandStep
import jetbrains.buildServer.configs.kotlin.buildSteps.ScriptBuildStep
import jetbrains.buildServer.configs.kotlin.buildSteps.dockerCommand
import jetbrains.buildServer.configs.kotlin.buildSteps.script
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
                namesAndTags = "%env.DOCKER_IMAGE%:%env.DOCKER_TAG%"
                commandArgs = "--pull"
            }
        }
        dockerCommand {
            name = "push"
            id = "push"
            commandType = push {
                namesAndTags = "%env.DOCKER_IMAGE%:%env.DOCKER_TAG%"
            }
        }
        script {
            name = "deploy_argo"
            id = "deploy_argo"
            scriptContent = """
                git clone %env.K8S_MANIFEST_REPO% k8s-manifests
                cd k8s-manifests
                git config user.name "TeamCity"
                git config user.email "teamcity@example.com"
                git pull origin main
                sed -i 's|image: .*|image: %env.DOCKER_IMAGE%:%env.DOCKER_TAG%|' app.yml
                git add .
                git commit -m "Update image tag to %env.DOCKER_TAG%"
                git push origin main
            """.trimIndent()
            dockerImage = "bitnami/git:latest"
            dockerImagePlatform = ScriptBuildStep.ImagePlatform.Linux
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