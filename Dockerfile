FROM ruby:2.7

RUN apt-get update && \ 
    apt-get install -y postgresql-client nmap && \
    curl https://raw.githubusercontent.com/rapid7/metasploit-framework/master/docker/data/msfconsole.rc -o /root/.msf4/msfconsole.rc

RUN git clone https://github.com/rapid7/metasploit-framework.git /opt/metasploit-framework
WORKDIR /opt/metasploit-framework

RUN bundle install

ENV MSF_DATABASE_CONFIG=/opt/metasploit-framework/config/database.yml
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]