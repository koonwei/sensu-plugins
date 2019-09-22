Skip to content
Search or jump to…

Pull requests
Issues
Marketplace
Explore
 
@koonwei 
Your GitHub academic discount coupon has expired
If you’re still eligible, you may re-apply.
If you’re no longer eligible, you may either update your payment information, or downgrade your account.
If you have any questions, please contact GitHub Education.

19
136131Accenture/adop-jenkins
 Code Issues 10 Pull requests 10 Actions Projects 0 Wiki Security Insights
adop-jenkins/Dockerfile
@anton-kasperovich anton-kasperovich Upgrade to Jenkins 2.7.4 and update version of plugins
1f374e5 on Sep 21, 2016
@nickdgriffin@anton-kasperovich@dsingh07@DanTarl@quirinobrizi@mihail-dev
34 lines (25 sloc)  1.17 KB
  
FROM jenkins:2.7.4

MAINTAINER Nick Griffin, <nicholas.griffin>

ENV GERRIT_HOST_NAME gerrit
ENV GERRIT_PORT 8080
ENV GERRIT_JENKINS_USERNAME="" GERRIT_JENKINS_PASSWORD=""


# Copy in configuration files
COPY resources/plugins.txt /usr/share/jenkins/ref/
COPY resources/init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d/
COPY resources/scripts/ /usr/share/jenkins/ref/adop_scripts/
COPY resources/jobs/ /usr/share/jenkins/ref/jobs/
COPY resources/scriptler/ /usr/share/jenkins/ref/scriptler/scripts/
COPY resources/views/ /usr/share/jenkins/ref/init.groovy.d/
COPY resources/m2/ /usr/share/jenkins/ref/.m2
COPY resources/entrypoint.sh /entrypoint.sh
COPY resources/scriptApproval.xml /usr/share/jenkins/ref/

# Reprotect
USER root
RUN chmod +x -R /usr/share/jenkins/ref/adop_scripts/ && chmod +x /entrypoint.sh
# USER jenkins

# Environment variables
ENV ADOP_LDAP_ENABLED=true ADOP_SONAR_ENABLED=true ADOP_ANT_ENABLED=true ADOP_MAVEN_ENABLED=true ADOP_NODEJS_ENABLED=true ADOP_GERRIT_ENABLED=true
ENV LDAP_GROUP_NAME_ADMIN=""
ENV JENKINS_OPTS="--prefix=/jenkins -Djenkins.install.runSetupWizard=false"

RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

ENTRYPOINT ["/entrypoint.sh"]
© 2019 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
Pricing
API
Training
Blog
About
