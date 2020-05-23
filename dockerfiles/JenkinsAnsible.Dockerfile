FROM jenkins/jenkins

USER root

RUN wget https://updates.jenkins-ci.org/latest/jenkins.war

RUN mv ./jenkins.war /usr/share/jenkins

RUN chown jenkins /usr/share/jenkins/jenkins.war

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" &&  python get-pip.py

RUN pip install -U ansible

RUN mkdir /etc/ansible && touch /etc/ansible/.ansible.cfg

RUN echo "[ssh_connection] \nssh_args = -C -o ControlMaster=auto -o ControlPersist=60s \ncontrol_path = ~/.ssh/ansible/cp%%h-%%p-%%r" >> /etc/ansible/.ansible.cfg

RUN chown jenkins /etc/ansible/.ansible.cfg

RUN chmod 777 /etc/ansible/.ansible.cfg

ENV ANSIBLE_CONFIG=/etc/ansible/.ansible.cfg

USER jenkins
