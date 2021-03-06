# Jenkins & ReactJS

This project shows how to:
- pull image
- run tests
- create a prod. image
- push it to remote docker image repo

## Jenkins Setup

```shell
docker run --rm -u root -p 8080:8080 \
    -v jenkins_home:/var/jenkins_home -v $(which docker):/usr/bin/docker \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "$HOME":/home jenkinsci/blueocean:1.24.6
```

login to Jenkins at <http://localhost:8080>

## Credentials

- Add your Docker Hub credentials to Jenkins on page <http://localhost:8080/credentials/store/system/> and put id in Jenkinsfile

## Pipeline

- Create pipeline using option pipeline from SCM and use `https://github.com/nikola-bodrozic/react-jest-enzyme` as repo URL
- Run build and a new image will be in your Docker Hub repo

## Pull image and run/stop container

```shell
docker run -d --name react-app -p 80:80 nikolabod/react-app:8084238
```

```shell
docker container stop react-app
```

## Versions Check

### Docker

Docker version 19.03.11-ol
docker-compose version 1.25.5

### Jenkins Plugins

 ace-editor: 1.1
 ant: 1.11
 antisamy-markup-formatter: 2.1
 apache-httpcomponents-client-4-api: 4.5.13-1.0
 authentication-tokens: 1.4
 blueocean: 1.24.6
 blueocean-autofavorite: 1.2.4
 blueocean-bitbucket-pipeline: 1.24.6
 blueocean-commons: 1.24.6
 blueocean-config: 1.24.6
 blueocean-core-js: 1.24.6
 blueocean-dashboard: 1.24.6
 blueocean-display-url: 2.4.1
 blueocean-events: 1.24.6
 blueocean-git-pipeline: 1.24.6
 blueocean-github-pipeline: 1.24.6
 blueocean-i18n: 1.24.6
 blueocean-jwt: 1.24.6
 blueocean-personalization: 1.24.6
 blueocean-pipeline-api-impl: 1.24.6
 blueocean-pipeline-editor: 1.24.6
 blueocean-pipeline-scm-api: 1.24.6
 blueocean-rest: 1.24.6
 blueocean-rest-impl: 1.24.6
 blueocean-web: 1.24.6
 bootstrap4-api: 4.6.0-3
 bouncycastle-api: 2.20
 branch-api: 2.6.3
 build-timeout: 1.20
 checks-api: 1.7.0
 cloudbees-bitbucket-branch-source: 2.9.8
 cloudbees-folder: 6.15
 command-launcher: 1.2
 credentials: 2.3.18
 credentials-binding: 1.24
 display-url-api: 2.3.4
 docker-commons: 1.17
 docker-java-api: 3.1.5.2
 docker-plugin: 1.2.2
 docker-workflow: 1.26
 durable-task: 1.36
 echarts-api: 5.1.0-2
 email-ext: 2.82
 favorite: 2.3.3
 font-awesome-api: 5.15.2-2
 git: 4.7.1
 git-client: 3.7.1
 git-server: 1.9
 github: 1.33.1
 github-api: 1.123
 github-branch-source: 2.10.2
 gradle: 1.36
 handlebars: 3.0.8
 handy-uri-templates-2-api: 2.1.8-1.0
 htmlpublisher: 1.25
 jackson2-api: 2.12.3
 jdk-tool: 1.0
 jenkins-design-language: 1.24.6
 jjwt-api: 0.11.2-9.c8b45b8bb173
 jquery3-api: 3.6.0-1
 jsch: 0.1.55.2
 junit: 1.49
 ldap: 2.6
 lockable-resources: 2.10
 mailer: 1.34
 matrix-auth: 2.6.6
 matrix-project: 1.18
 momentjs: 1.1.1
 okhttp-api: 3.14.9
 pam-auth: 1.6
 pipeline-build-step: 2.13
 pipeline-github-lib: 1.0
 pipeline-graph-analysis: 1.10
 pipeline-input-step: 2.12
 pipeline-milestone-step: 1.3.2
 pipeline-model-api: 1.8.4
 pipeline-model-definition: 1.8.4
 pipeline-model-extensions: 1.8.4
 pipeline-rest-api: 2.19
 pipeline-stage-step: 2.5
 pipeline-stage-tags-metadata: 1.8.4
 pipeline-stage-view: 2.19
 plain-credentials: 1.7
 plugin-util-api: 2.1.0
 popper-api: 1.16.1-2
 pubsub-light: 1.14
 resource-disposer: 0.15
 scm-api: 2.6.4
 script-security: 1.76
 snakeyaml-api: 1.27.0
 sse-gateway: 1.24
 ssh-credentials: 1.18.1
 ssh-slaves: 1.31.5
 structs: 1.22
 timestamper: 1.12
 token-macro: 2.15
 trilead-api: 1.0.13
 variant: 1.4
 workflow-aggregator: 2.6
 workflow-api: 2.42
 workflow-basic-steps: 2.23
 workflow-cps: 2.90
 workflow-cps-global-lib: 2.19
 workflow-durable-task-step: 2.38
 workflow-job: 2.40
 workflow-multibranch: 2.23
 workflow-scm-step: 2.12
 workflow-step-api: 2.23
 workflow-support: 3.8
 ws-cleanup: 0.39
